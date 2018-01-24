cmake_minimum_required (VERSION 2.6)
include(ExternalProject)
project(opencv-download NONE)

list(APPEND
    OPENCV_CMAKE_ARGS
    "-DOPENCV_EXTRA_MODULES_PATH=:opencv_contrib-src/modules"
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
    )


ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv
    GIT_TAG "3.4.0"

    SOURCE_DIR "${CMAKE_BINARY_DIR}/opencv-src"
    BINARY_DIR "${CMAKE_BINARY_DIR}/opencv-build"
    CMAKE_ARGS ${OPENCV_CMAKE_ARGS}
    )
#better not to use CMAKE_ARGS
#define the arguments before using, move the list above
#replace the CMAKE_ARGS with the list defined
#Future: Don't use reserved word as variables for safety

