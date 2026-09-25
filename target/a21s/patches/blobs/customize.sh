BLOBS_LIST="
system/lib/lib_SoundBooster_ver1100.so
system/lib64/lib_SoundBooster_ver1100.so
"
for blob in $BLOBS_LIST; do
  DELETE_FROM_WORK_DIR "system" "$blob"
done
