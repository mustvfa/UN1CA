SKIPUNZIP=1

LOG_STEP_IN "- Replacing source's SoundBooster libs with s21 ones"
BLOBS_LIST="
system/lib/lib_SoundBooster_ver1100.so
system/lib64/lib_SoundBooster_ver1100.so
"
for blob in $BLOBS_LIST; do
  DELETE_FROM_WORK_DIR "system" "$blob"
done

BLOBS_LIST="
system/lib/libsamsungSoundbooster_plus_legacy.so
system/lib/lib_SoundBooster_ver1050.so
system/lib64/libsamsungSoundbooster_plus_legacy.so
system/lib64/lib_SoundBooster_ver1050.so
"
for blob in $BLOBS_LIST; do
  ADD_TO_WORK_DIR "$MODPATH" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done
LOG_STEP_OUT

LOG_STEP_IN "- Adding A145F GNSS 2.1 implementation"
ADD_TO_WORK_DIR "$MODPATH" "vendor" "lib64/hw/android.hardware.gnss@2.1-impl.so" 0 0 644 "u:object_r:vendor_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Updating Vibrator HAL"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "bin/hw/vendor.samsung.hardware.vibrator-service"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "etc/vintf/manifest/vendor.samsung.hardware.vibrator-default.xml"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/vendor.samsung.hardware.vibrator-V5-ndk_platform.so"

EVAL "echo \"service sec-vibrator-aidl /vendor/bin/hw/vendor.samsung.hardware.vibrator-service\" > \"$WORK_DIR/vendor/etc/init/vendor.samsung.hardware.vibrator-default.rc\""
EVAL "echo \"    class hal\" >> \"$WORK_DIR/vendor/etc/init/vendor.samsung.hardware.vibrator-default.rc\""
EVAL "echo \"    user system\" >> \"$WORK_DIR/vendor/etc/init/vendor.samsung.hardware.vibrator-default.rc\""
EVAL "echo \"    group system\" >> \"$WORK_DIR/vendor/etc/init/vendor.samsung.hardware.vibrator-default.rc\""
SET_METADATA "vendor" "etc/init/vendor.samsung.hardware.vibrator-default.rc" 0 0 644 "u:object_r:vendor_configs_file:s0"
LOG_STEP_OUT

# Radio FM jni blob
ADD_TO_WORK_DIR "a14nsxx" "system" "system/lib64/libfmradio_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
