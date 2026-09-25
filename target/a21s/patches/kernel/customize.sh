PATCH_DIR="$SRC_DIR/target/a21s/patches/kernel/kernels"
TMP_DIR="$HOME/tmp_boot"

if [ -d "$TMP_DIR" ]; then
  EVAL "rm -rf \"$TMP_DIR\""
fi
EVAL "mkdir -p \"$TMP_DIR\""

LOG "- Copying original boot.img"
EVAL "cp -a \"$WORK_DIR/kernel/boot.img\" \"$TMP_DIR/boot.img\""

LOG "- Unpacking boot.img"
MKBOOTIMG_ARGS="$(unpack_bootimg --boot_img "$TMP_DIR/boot.img" --out "$TMP_DIR/out" --format mkbootimg 2>&1)" ||
  ABORT "Failed to unpack boot.img"

BEFORE_KERNEL="$(stat -c '%s' "$TMP_DIR/out/kernel" 2>/dev/null)"
BEFORE_DTB="$(stat -c '%s' "$TMP_DIR/out/dtb" 2>/dev/null)"

LOG "- Copying new kernel and dtb from patches"
EVAL "cp -a \"$PATCH_DIR/Image\" \"$TMP_DIR/out/kernel\""
EVAL "cp -a \"$PATCH_DIR/dtb\" \"$TMP_DIR/out/dtb\""

AFTER_KERNEL="$(stat -c '%s' "$TMP_DIR/out/kernel" 2>/dev/null)"
AFTER_DTB="$(stat -c '%s' "$TMP_DIR/out/dtb" 2>/dev/null)"

LOG "- Repacking boot.img"
EVAL "mkbootimg $MKBOOTIMG_ARGS -o \"$TMP_DIR/new-boot.img\"" ||
  ABORT "Failed to repack boot.img"

echo "  Kernel size changed: $BEFORE_KERNEL → $AFTER_KERNEL"
echo "  DTB size changed:    $BEFORE_DTB → $AFTER_DTB"

LOG "- Replacing old boot.img with new one"
EVAL "mv -f \"$TMP_DIR/new-boot.img\" \"$WORK_DIR/kernel/boot.img\""

EVAL "rm -rf \"$TMP_DIR\""

unset PATCH_DIR TMP_DIR MKBOOTIMG_ARGS
