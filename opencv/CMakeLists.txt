cmake_minimum_required (VERSION 3.0)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/libraries" CACHE PATH "Path where to install binaries")

project(display)

set(ES_DEPENDS_DOWNLOAD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty" CACHE STRING "Download directory")
set(ES_BUILD_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Build the given configs")
option(BUILD_SHARED_LIBS "Build static or shared libs" OFF)
option(ES_BUILD_ALL "Build all packages" ON)

include(ProcessorCount)
ProcessorCount(NUMBER_OF_PROCESSORS)
# message(STATUS "Processor Count : ${NUMBER_OF_PROCESSORS}")

# OpenCV
configure_file(superbuild/OpenCV-External.cmake
               ${CMAKE_BINARY_DIR}/opencv-external/CMakeLists.txt)

execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
                WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-external")

execute_process(COMMAND "${CMAKE_COMMAND}" --build . 
                -- -j${NUMBER_OF_PROCESSORS}
                WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/opencv-external")


set(OpenCV_DIR "${CMAKE_BINARY_DIR}/opencv_build")

find_package(OpenCV REQUIRED)
if (NOT OPENCV_FOUND)
  message(FATAL_ERROR "Cannot find OpenCV!")
endif ()

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(display display.cpp)
target_link_libraries(display ${OpenCV_LIBS})



# EOF