LOG_STEP_IN "- Fixing audio server crash"
DELETE_FROM_WORK_DIR "system" "system/lib/lib_SoundBooster_ver1100.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/lib_SoundBooster_ver1100.so"
DELETE_FROM_WORK_DIR "system" "system/lib/libsamsungSoundbooster_plus_legacy.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libsamsungSoundbooster_plus_legacy.so"

ADD_TO_WORK_DIR "$SRC_DIR/target/a21s/patches/stock_blobs" "system" "system/lib/lib_SoundBooster_ver1050.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$SRC_DIR/target/a21s/patches/stock_blobs" "system" "system/lib64/lib_SoundBooster_ver1050.so" 0 0 644 "u:object_r:system_lib_file:s0"

ADD_TO_WORK_DIR "$SRC_DIR/target/a21s/patches/stock_blobs" "system" "system/lib/libsamsungSoundbooster_plus_legacy.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$SRC_DIR/target/a21s/patches/stock_blobs" "system" "system/lib64/libsamsungSoundbooster_plus_legacy.so" 0 0 644 "u:object_r:system_lib_file:s0"

LOG_STEP_OUT
