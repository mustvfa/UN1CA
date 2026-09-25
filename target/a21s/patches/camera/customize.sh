# Add MultiFrameProcessing10 lib
EVAL "echo \"libMultiFrameProcessing10.camera.samsung.so\" >> \"$WORK_DIR/system/system/etc/public.libraries-camera.samsung.txt\""

# Singletake
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "etc/singletake"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libBlurDetectionDeepLearning.camera.samsung.so"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libSingleTakeBlurDetection.uniplugin@1.0.so"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libblurdetection.so"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libblurdetection_interface.so"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libtensorflowLite.singletake.camera.samsung.so"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/libuniplugin.so"

EVAL "echo \"libBestPhoto.camera.samsung.so\" >> \"$WORK_DIR/system/system/etc/public.libraries-camera.samsung.txt\""
