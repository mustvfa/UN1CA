LOG "-Disabling encryption"
# Encryption
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.exynos850")
sed -i "${LINE}s/,fileencryption=ice//g" "$WORK_DIR/vendor/etc/fstab.exynos850"

# ODE
sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.exynos850"

LOG_STEP_IN "- Nuking objectcapture libs"
DELETE_FROM_WORK_DIR "system" "system/lib64/libobjectcapture_jni.arcsoft.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libobjectcapture.arcsoft.so"
LOG_STEP_OUT

LOG_STEP_IN "- Removing unsupported Single Take files"
DELETE_FROM_WORK_DIR "system" "system/cameradata/singletake"
DELETE_FROM_WORK_DIR "system" "system/priv-app/SingleTakeService"
DELETE_FROM_WORK_DIR "system" "system/etc/default-permissions/default-permissions-com.samsung.android.singletake.service.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.singletake.service.xml"
LOG_STEP_OUT

LOG_STEP_IN "- Disabling AV1 decoders"
{
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    echo "<MediaCodecs>"
    echo "    <Decoders>"
    echo "        <MediaCodec name=\"c2.android.av1-dav1d.decoder\" type=\"video/av01\" update=\"true\" enabled=\"false\" />"
    echo "        <MediaCodec name=\"c2.android.av1.decoder\" type=\"video/av01\" update=\"true\" enabled=\"false\" />"
    echo "    </Decoders>"
    echo "</MediaCodecs>"
} > "$WORK_DIR/vendor/etc/media_codecs_c2.xml"
SET_METADATA "vendor" "etc/media_codecs_c2.xml" 0 0 644 "u:object_r:vendor_configs_file:s0"
LOG_STEP_OUT
