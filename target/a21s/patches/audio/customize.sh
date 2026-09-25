BLOBS_LIST="
lib/android.hardware.audio.common@5.0-util.so
lib/hw/android.hardware.audio.effect@5.0-impl.so
lib/hw/android.hardware.audio@5.0-impl.so
lib64/android.hardware.audio.common@5.0-util.so
lib64/hw/android.hardware.audio.effect@5.0-impl.so
lib64/hw/android.hardware.audio@5.0-impl.so
"
for blob in $BLOBS_LIST; do
  DELETE_FROM_WORK_DIR "vendor" "$blob"
done

AUDIO_BLOBS="
lib/android.hardware.audio.common-util.so
lib/android.hardware.audio.common@2.0-util.so
lib/android.hardware.audio.common@6.0-util.so
lib/android.hardware.audio.common@6.0.so
lib/android.hardware.audio.effect@6.0-util.so
lib/android.hardware.audio.effect@6.0.so
lib/android.hardware.audio@6.0-util.so
lib/android.hardware.audio@6.0.so
lib/hw/android.hardware.audio.effect@2.0-impl.so
lib/hw/android.hardware.audio.effect@6.0-impl.so
lib/hw/android.hardware.audio@2.0-impl.so
lib/hw/android.hardware.audio@6.0-impl.so
lib64/android.hardware.audio.common-util.so
lib64/android.hardware.audio.common@2.0-util.so
lib64/android.hardware.audio.common@6.0-util.so
lib64/android.hardware.audio.common@6.0.so
lib64/android.hardware.audio.effect@6.0-util.so
lib64/android.hardware.audio.effect@6.0.so
lib64/android.hardware.audio@6.0-util.so
lib64/android.hardware.audio@6.0.so
lib64/hw/android.hardware.audio.effect@2.0-impl.so
lib64/hw/android.hardware.audio.effect@6.0-impl.so
lib64/hw/android.hardware.audio@2.0-impl.so
lib64/hw/android.hardware.audio@6.0-impl.so
"
for blob in $AUDIO_BLOBS; do
  ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "$blob"
done

LOG "- Updating audio HAL versions in the vendor manifest"
sed -i \
  -e '/<name>android.hardware.audio<\/name>/,/<\/hal>/ { s/<version>5\.0<\/version>/<version>6.0<\/version>/; s/@5\.0::/@6.0::/g; }' \
  -e '/<name>android.hardware.audio.effect<\/name>/,/<\/hal>/ { s/<version>5\.0<\/version>/<version>6.0<\/version>/; s/@5\.0::/@6.0::/g; }' \
  "$WORK_DIR/vendor/etc/vintf/manifest.xml"
