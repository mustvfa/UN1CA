BLOBS_LIST="
android.hardware.radio.config@1.0.so
android.hardware.radio.config@1.1.so
android.hardware.radio.config@1.2.so
android.hardware.radio.deprecated@1.0.so
android.hardware.radio@1.3.so
android.hardware.radio@1.4.so
vendor.samsung.hardware.radio.bridge@2.0.so
vendor.samsung.hardware.radio.bridge@2.1.so
vendor.samsung.hardware.radio.channel@2.0.so
vendor.samsung.hardware.radio@2.0.so
vendor.samsung.hardware.radio@2.1.so
vendor.samsung.hardware.radio@2.2.so
"
for blobs in $BLOBS_LIST; do
  DELETE_FROM_WORK_DIR "vendor" "lib64/$blobs"
done

EVAL "cp -f \"$MODPATH/sys/etc/init/disable_rild2.rc\" \"$WORK_DIR/system/system/etc/init/disable_rild2.rc\""
SET_METADATA "system" "system/etc/init/disable_rild2.rc" 0 0 644 "u:object_r:system_file:s0"

# Dual SIM fix - not required for UN1CA but it is for a16+
EVAL "echo \"    setprop ro.telephony.sim_slots.count 2\" >> \"$WORK_DIR/vendor/etc/init/init.baseband.rc\""

# Add Samsung Radio AIDL services to vendor_service_contexts
VND_CTX="$WORK_DIR/vendor/etc/selinux/vendor_service_contexts"
EVAL "sed -i '/vendor.samsung.hardware.radio/d' \"$VND_CTX\""
echo "" >>"$VND_CTX"
echo "# Samsung Radio AIDL Services Contexts Mappings" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.network.ISehRadioNetwork/slot1      u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.network.ISehRadioNetwork/slot2      u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.bridge.ISehRadioBridge/slot1        u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.bridge.ISehRadioBridge/slot2        u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.channel.ISehRadioChannel/imsd       u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.channel.ISehRadioChannel/imsd2      u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.channel.ISehRadioChannel/epdgd      u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.channel.ISehRadioChannel/epdgd2     u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.data.ISehRadioData/slot1            u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.data.ISehRadioData/slot2            u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.sim.ISehRadioSim/slot1              u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.sim.ISehRadioSim/slot2              u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.messaging.ISehRadioMessaging/slot1  u:object_r:hal_radio_service:s0" >>"$VND_CTX"
echo "vendor.samsung.hardware.radio.messaging.ISehRadioMessaging/slot2  u:object_r:hal_radio_service:s0" >>"$VND_CTX"
unset VND_CTX
