BLOBS_LIST="
bin/hw/android.hardware.audio.service
lib/libsehbluetooth_audio_session.so
lib/vendor.samsung.hardware.bluetooth.a2dp@1.0.so
lib/vendor.samsung.hardware.bluetooth.audio@2.0.so
lib/vendor.samsung.hardware.bluetooth.audio@2.1.so
lib/vendor.samsung_slsi.hardware.ExynosA2DPOffload@3.0.so
lib/hw/audio.bluetooth.default.so
lib/hw/vendor.samsung.hardware.bluetooth.a2dp@1.0-impl.so
lib/hw/vendor.samsung.hardware.bluetooth.audio@2.1-impl.so
lib64/libsehbluetooth_audio_session.so
lib64/vendor.samsung.hardware.bluetooth.a2dp@1.0.so
lib64/vendor.samsung.hardware.bluetooth.audio@2.0.so
lib64/vendor.samsung.hardware.bluetooth.audio@2.1.so
lib64/vendor.samsung_slsi.hardware.ExynosA2DPOffload@3.0.so
lib64/hw/audio.bluetooth.default.so
lib64/hw/vendor.samsung.hardware.bluetooth.a2dp@1.0-impl.so
lib64/hw/vendor.samsung.hardware.bluetooth.audio@2.1-impl.so
"
for blob in $BLOBS_LIST; do
    ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "$blob"
done
