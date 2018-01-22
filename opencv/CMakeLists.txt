cmake_minimum_required (VERSION 2.6)

project(Display)

configure_file(OpenCV.cmake opencv-download/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")

execute_process(COMMAND "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")



configure_file(OpenCV_contrib.cmake opencv_contrib-download/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv_contrib-download")

execute_process(COMMAND "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv_contrib-download")

add_subdirectory("${CMAKE_BINARY_DIR}/opencv-src/"
                 "${CMAKE_BINARY_DIR}/opencv-build/"
)



set(OpenCV_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build_dir/")
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(display display.cpp)
target_link_libraries(display ${OpenCV_LIBS})

