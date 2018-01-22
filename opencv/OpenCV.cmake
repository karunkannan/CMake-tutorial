cmake_minimum_required (VERSION 2.6)
include(ExternalProject)
project(opencv-download NONE)

ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv
    GIT_TAG "3.4.0"

    SOURCE_DIR "${CMAKE_BINARY_DIR}/opencv-src"
    BINARY_DIR "${CMAKE_BINARY_DIR}/opencv-build"
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    TEST_COMMAND ""
    CMAKE_ARGS "${CMAKE_ARGS}
        -DOPENCV_EXTRA_MODULES_PATH=<opencv_contrib>/modules
        -DBUILD_opencv_flann:BOOL=OFF"
)

list(APPEND
    CMAKE_ARGS
    "-DOPENCV_EXTRA_MODULES_PATH=<opencv_contrib>/modules
    -DBUILD_opencv_flann:BOOL=OFF
    -DBUILD_opencv_features2d:BOOL=OFF
    -DBUILD_opencv_calib3d:BOOL=OFF
    -DBUILD_opencv_ml:BOOL=OFF
    -DBUILD_opencv_video:BOOL=OFF
    -DBUILD_opencv_shape:BOOL=OFF
    -DBUILD_opencv_xfeatures2d:BOOL=OFF
    -DBUILD_opencv_stitching:BOOL=OFF
    -DBUILD_opencv_saliency:BOOL=OFF
    -DBUILD_opencv_dnn:BOOL=OFF"
    )


