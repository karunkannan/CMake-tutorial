cmake_minimum_required (VERSION 2.6)

project(Display)

configure_file(OpenCV.txt.in opencv-download/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")

execute_process(COMMAND "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-download")

add_subdirectory("${CMAKE_BINARY_DIR}/opencv-src"
                 "${CMAKE_BINARY_DIR}/opencv-build"
)
set(OpenCV_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build_dir/")
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(display display.cpp)
target_link_libraries(display ${OpenCV_LIBS})
