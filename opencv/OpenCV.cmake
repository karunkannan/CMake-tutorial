cmake_minimum_required (VERSION 2.6)
include(ExternalProject)
project(opencv-download NONE)

set(OPENCV_ARGS "TEST")

message(STATUS, "${OPENCV_ARGS}")

set(
    OPENCV_ARGS
    "-DOPENCV_EXTRA_MODULES_PATH:PATH=opencv_contrib-src/modules"
    "-DBUILD_opencv_flann:BOOL=OFF"
    "-DBUILD_opencv_features2d:BOOL=OFF"
    "-DBUILD_opencv_calib3d:BOOL=OFF"
    "-DBUILD_opencv_ml:BOOL=OFF"
    "-DBUILD_opencv_video:BOOL=OFF"
    "-DBUILD_opencv_shape:BOOL=OFF"
    "-DBUILD_opencv_xfeatures2d:BOOL=OFF"
    "-DBUILD_opencv_stitching:BOOL=OFF"
    "-DBUILD_opencv_saliency:BOOL=OFF"
    "-DBUILD_opencv_dnn:BOOL=OFF"
    PARENT_SCOPE
    )

message(STATUS, ${OPENCV_ARGS})

ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv
    GIT_TAG "3.4.0"

    SOURCE_DIR "${CMAKE_BINARY_DIR}/opencv-src"
    BINARY_DIR "${CMAKE_BINARY_DIR}/opencv-build"
    CMAKE_ARGS
        "-DBUILD_opencv_apps:BOOL=OFF"
        "-DBUILD_opencv_calib3d:BOOL=OFF"
        "-DBUILD_opencv_core:BOOL=ON"
        "-DBUILD_opencv_dnn:BOOL=OFF"
        "-DBUILD_opencv_features2d:BOOL=OFF"
        "-DBUILD_opencv_flann:BOOL=OFF"
        "-DBUILD_opencv_highgui:BOOL=ON"
        "-DBUILD_opencv_imgcodecs:BOOL=ON"
        "-DBUILD_opencv_imgproc:BOOL=OFF"
        "-DBUILD_opencv_js:BOOL=OFF"
        "-DBUILD_opencv_ml:BOOL=OFF"
        "-DBUILD_opencv_objdetect:BOOL=OFF"
        "-DBUILD_opencv_photo:BOOL=OFF"
        "-DBUILD_opencv_python2:BOOL=OFF"
        "-DBUILD_opencv_python3:BOOL=OFF"
        "-DBUILD_opencv_python_bindings_generator:BOOL=OFF"
        "-DBUILD_opencv_saliency:BOOL=OFF"
        "-DBUILD_opencv_shape:BOOL=OFF"
        "-DBUILD_opencv_stitching:BOOL=OFF"
        "-DBUILD_opencv_superres:BOOL=OFF"
        "-DBUILD_opencv_ts:BOOL=OFF"
        "-DBUILD_opencv_video:BOOL=OFF"
        "-DBUILD_opencv_videoio:BOOL=OFF"
        "-DBUILD_opencv_world:BOOL=OFF"
        "-DBUILD_opencv_xfeatures2d:BOOL=OFF"
        "-DOPENCV_EXTRA_MODULES_PATH:PATH=opencv_contrib-src/modules"
    )
#better not to use CMAKE_ARGS
#define the arguments before using, move the list above
#replace the CMAKE_ARGS with the list defined
#Future: Don't use reserved word as variables for safety

