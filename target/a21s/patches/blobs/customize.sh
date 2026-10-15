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

LOG_STEP_IN "- Adding 32-bit WFD blobs"
BLOBS_LIST="
system/bin/insthk
system/bin/remotedisplay
system/lib/android.hardware.graphics.extension.composer3-V1-ndk.so
system/lib/libhdcp_client_aidl.so
system/lib/libhdcp2.so
system/lib/libremotedisplay_wfd.so
system/lib/libremotedisplayservice.so
system/lib/librepeater.so
system/lib/libsecuibc.so
system/lib/libstagefright_hdcp.so
system/lib/libtsmux.so
system/lib/vendor.samsung.hardware.security.hdcp.wifidisplay-V2-ndk.so
system/lib/vendor.samsung_slsi.hardware.ExynosHWCServiceTW@1.0.so
system/lib/vendor.samsung_slsi.hardware.graphics.extension.composer3-V4-ndk.so
system/lib/wfd_log.so
"
for blob in $BLOBS_LIST; do
    ADD_TO_WORK_DIR "r9sxxx" "system" "$blob"
done

BLOBS_LIST="
system/lib64/android.hardware.graphics.extension.composer3-V1-ndk.so
system/lib64/libhdcp_client_aidl.so
system/lib64/libhdcp2.so
system/lib64/libremotedisplay_wfd.so
system/lib64/libremotedisplayservice.so
system/lib64/librepeater.so
system/lib64/libsecuibc.so
system/lib64/libstagefright_hdcp.so
system/lib64/libtsmux.so
system/lib64/vendor.samsung.hardware.security.hdcp.wifidisplay-V2-ndk.so
system/lib64/wfd_log.so
"
for blob in $BLOBS_LIST; do
    DELETE_FROM_WORK_DIR "system" "$blob"
done
LOG_STEP_OUT

LOG_STEP_IN "- Updating Wi-Fi supplicant interface libraries"
BLOBS_LIST="
lib64/android.hardware.wifi.supplicant@1.0.so
lib64/android.hardware.wifi.supplicant@1.1.so
lib64/android.hardware.wifi.supplicant@1.2.so
lib64/android.hardware.wifi.supplicant@1.3.so
lib64/android.hardware.wifi.supplicant@1.4.so
"
for blob in $BLOBS_LIST; do
    ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "$blob"
done

ADD_TO_WORK_DIR "$MODPATH" "vendor" "bin/hw/wpa_supplicant" 0 2000 755 "u:object_r:hal_wifi_supplicant_default_exec:s0"
LOG_STEP_OUT
