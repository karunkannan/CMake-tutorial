cmake_minimum_required (VERSION 3.6)

project(display)

find_package(OpenCV REQUIRED)
if (NOT OPENCV_FOUND)
  message(FATAL_ERROR "Cannot find OpenCV!")
endif ()

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(display src/display.cpp)
target_link_libraries(display ${OpenCV_LIBS})


# EOF