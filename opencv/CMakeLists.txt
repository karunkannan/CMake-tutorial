cmake_minimum_required (VERSION 2.6)

project(Display)

configure_file(OpenCV_contrib.cmake opencv_contrib-download/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv_contrib-download")

#execute_process(COMMAND "${CMAKE_COMMAND}" --build .
#    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv_contrib-download")


configure_file(OpenCV.cmake opencv-download/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")

execute_process(COMMAND "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")



#test if you need to build as well
#test order
add_subdirectory("${CMAKE_BINARY_DIR}/opencv-src/"
                 "${CMAKE_BINARY_DIR}/opencv-build/"
)

list(APPEND
    CMAKE_ARGS
        "-DBUILD_opencv_apps:BOOL=OFF"
        "-DBUILD_opencv_calib3d:BOOL=OFF"
        "-DBUILD_opencv_core:BOOL=ON"
        "-DBUILD_opencv_dnn:BOOL=OFF"
        "-DBUILD_opencv_features2d:BOOL=OFF"
        "-DBUILD_opencv_flann:BOOL=OFF"
        "-DBUILD_opencv_highgui:BOOL=ON"
        "-DBUILD_opencv_imgcodecs:BOOL=ON"
        "-DBUILD_opencv_imgproc:BOOL=ON"
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
        "-DBUILD_opencv_videoio:BOOL=ON"
        "-DBUILD_opencv_world:BOOL=OFF"
        "-DBUILD_opencv_xfeatures2d:BOOL=OFF"
        "-DOPENCV_EXTRA_MODULES_PATH:PATH=${CMAKE_BINARY_DIR}/opencv_contrib-src/modules"
    )



set(OpenCV_DIR "${CMAKE_BINARY_DIR}/opencv-build/")
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(display display.cpp)
target_link_libraries(display ${OpenCV_LIBS})

