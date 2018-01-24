cmake_minimum_required(VERSION 2.6)
include(ExternalProject)
project(opencv_contrib-download NONE)

ExternalProject_Add(
    opencv_contrib
    GIT_REPOSITORY "https://github.com/opencv/opencv_contrib"
    GIT_TAG "3.4.0"

    SOURCE_DIR "${CMAKE_BINARY_DIR}/opencv_contrib-src"
)
