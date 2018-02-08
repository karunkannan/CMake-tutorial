cmake_minimum_required (VERSION 3.6)

project(display)

find_package(OpenCV REQUIRED)
if (NOT OPENCV_FOUND)
  message(FATAL_ERROR "Cannot find OpenCV!")
endif ()

# clBLAS
set(BLA_STATIC OFF)
find_package(clBLAS REQUIRED)
include_directories(${CLBLAS_INCLUDE_DIRS})
message( "clBLAS = ${CLBLAS_INCLUDE_DIRS}")
# ${CLBLAS_LIBRARIES}

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(display src/display.cpp)
target_link_libraries(display ${OpenCV_LIBS})


# EOF