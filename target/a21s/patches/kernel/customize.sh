# [
GET_URL()
{
    _CHECK_NON_EMPTY_PARAM "ASSET" "$1" || return 1

    local KERNEL_URL="https://api.github.com/repos/mustvfa/android_kernel_samsung_exynos850/releases/latest"

    curl -s --retry 3 "$KERNEL_URL" | jq -r --arg i "$1" '.assets[] | select(.name | test($i)) | .browser_download_url' | head -n 1
}
# ]

KERNEL_ARCHIVE_URL="$(GET_URL "^a-kernel-for-a21s-.*\\.zip$")"

if [ ! "$KERNEL_ARCHIVE_URL" ]; then
    ABORT "Failed to fetch kernel archive URL"
fi

TMP_DIR="$HOME/tmp_boot"
PATCH_DIR="$TMP_DIR"

if [ -d "$TMP_DIR" ]; then
  EVAL "rm -rf \"$TMP_DIR\""
fi
EVAL "mkdir -p \"$TMP_DIR\""

DOWNLOAD_FILE "$KERNEL_ARCHIVE_URL" "$TMP_DIR/kernel.zip"
EVAL "unzip -j -o \"$TMP_DIR/kernel.zip\" Image dtb -d \"$PATCH_DIR\"" || ABORT "Failed to extract A21s kernel"

LOG "- Copying original boot.img"
EVAL "cp -a \"$WORK_DIR/kernel/boot.img\" \"$TMP_DIR/boot.img\""

LOG "- Unpacking boot.img"
MKBOOTIMG_ARGS="$(unpack_bootimg --boot_img "$TMP_DIR/boot.img" --out "$TMP_DIR/out" --format mkbootimg 2>&1)" ||
  ABORT "Failed to unpack boot.img"

LOG "- Copying new kernel and dtb from release"
EVAL "cp -a \"$PATCH_DIR/Image\" \"$TMP_DIR/out/kernel\""
EVAL "cp -a \"$PATCH_DIR/dtb\" \"$TMP_DIR/out/dtb\""

LOG "- Repacking boot.img"
EVAL "mkbootimg $MKBOOTIMG_ARGS -o \"$TMP_DIR/new-boot.img\"" ||
  ABORT "Failed to repack boot.img"

LOG "- Replacing old boot.img with new one"
EVAL "mv -f \"$TMP_DIR/new-boot.img\" \"$WORK_DIR/kernel/boot.img\""

EVAL "rm -rf \"$TMP_DIR\""

unset PATCH_DIR TMP_DIR MKBOOTIMG_ARGS KERNEL_ARCHIVE_URL
unset -f GET_URL
