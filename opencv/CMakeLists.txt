cmake_minimum_required (VERSION 2.6)
include(ExternalProject)
project(Display)

ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv
    GIT_TAG "master"

    PREFIX ${CMAKE_BINARY_DIR}/opencv
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )


#set(opencv_INCLUDE_DIRS "${CMAKE_SOURCE_DIR}/external/opencv/include")
#set(opencv_LIBRARIES "${CMAKE_SHARED_LIBRARY_PREFIX}opencv${CMAKE_SHARED_LIBRARY_SUFFIX}")
#include_directories(${opencv_INCLUDE_DIRS})
ExternalProject_Get_Property(opencv install_dir)
include_directories(${install_dir}/include)

add_executable(display display.cpp)
add_dependencies(display opencv)
target_link_libraries(display ${opencv_LIBS})
