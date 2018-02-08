cmake_minimum_required (VERSION 3.6)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/libraries" CACHE PATH "Path where to install binaries")

project(display-Superbuild)

set(ES_DEPENDS_DOWNLOAD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty" CACHE STRING "Download directory")
set(ES_BUILD_CONFIG_TYPES "Debug;Release" CACHE STRING "Build the given configs")
option(BUILD_SHARED_LIBS "Build static or shared libs" OFF)
option(ES_BUILD_ALL "Build all packages" ON)

include(ProcessorCount)
ProcessorCount(NUMBER_OF_PROCESSORS)
# message(STATUS "Processor Count : ${NUMBER_OF_PROCESSORS}")

include(ExternalProject)

# OpenCV
include(OpenCV-External.cmake)

ExternalProject_Add(display
  DEPENDS          opencv
  DOWNLOAD_COMMAND ""
  UPDATE_COMMAND   ""
  PATCH_COMMAND    ""
  SOURCE_DIR       ${CMAKE_CURRENT_SOURCE_DIR}/..
  BINARY_DIR       display_build
  CMAKE_ARGS       -DOpenCV_DIR:PATH=${OpenCV_DIR}
  INSTALL_COMMAND ""
)


# EOF