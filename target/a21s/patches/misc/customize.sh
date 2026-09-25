LOG_STEP_IN "- Fixing setting wallpaper from gallery bug"
DELETE_FROM_WORK_DIR "system" "system/lib64/libobjectcapture_jni.arcsoft.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libobjectcapture.arcsoft.so"
LOG_STEP_OUT

LOG "-Disabling encryption"
# Encryption
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.exynos850")
sed -i "${LINE}s/,fileencryption=ice//g" "$WORK_DIR/vendor/etc/fstab.exynos850"

# ODE
sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.exynos850"

LOG_STEP_IN "- Disabling A2DP Offload"
SET_PROP "system" persist.bluetooth.a2dp_offload.disabled "true"
LOG_STEP_OUT
