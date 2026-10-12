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
