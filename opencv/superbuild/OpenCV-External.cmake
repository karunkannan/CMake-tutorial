cmake_minimum_required (VERSION 2.6)

include(ExternalProject)

project(opencv-external NONE)


ExternalProject_Add(
  opencv_contrib_download
  URL                  "https://github.com/opencv/opencv_contrib/archive/3.4.0.tar.gz"
  # URL_HASH             MD5=ed60f8bbe7a448f325d0a0f58fcf2063
  DOWNLOAD_NAME        "opencv_contrib-3.4.0.tar.gz"
  DOWNLOAD_DIR         ${ES_DEPENDS_DOWNLOAD_DIR}
  DOWNLOAD_NO_PROGRESS 1
  SOURCE_DIR           "${ES_DEPENDS_DOWNLOAD_DIR}/opencv_contrib"
  UPDATE_COMMAND       ""
  PATCH_COMMAND        ""
  CONFIGURE_COMMAND    ""
  BUILD_COMMAND        ""
  INSTALL_COMMAND      ""
  TEST_COMMAND         ""
)

set(OPENCV_CMAKE_ARGS "")
list(APPEND
  OPENCV_CMAKE_ARGS
)

# list(APPEND
#     OPENCV_CMAKE_ARGS
# )

ExternalProject_Add(
  opencv
  URL                  "https://github.com/opencv/opencv/archive/3.4.0.tar.gz"
  # URL_HASH             MD5=ed60f8bbe7a448f325d0a0f58fcf2063
  DOWNLOAD_NAME        "opencv-3.4.0.tar.gz"
  DOWNLOAD_DIR         ${ES_DEPENDS_DOWNLOAD_DIR}
  DOWNLOAD_NO_PROGRESS 1
  SOURCE_DIR           "${ES_DEPENDS_DOWNLOAD_DIR}/opencv"
  BINARY_DIR           "${CMAKE_BINARY_DIR}/opencv_build"
  DEPENDS              opencv_contrib_download
  UPDATE_COMMAND       ""
  PATCH_COMMAND        ""
  INSTALL_COMMAND      ""
  TEST_COMMAND         ""
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
    -DBUILD_DOCS:BOOL=OFF
    -DBUILD_IPP_IW:BOOL=OFF
    -DBUILD_ITT:BOOL=OFF
    -DBUILD_OPENEXR:BOOL=OFF
    -DBUILD_JASPER:BOOL=OFF
    -DBUILD_JPEG:BOOL=OFF
    -DBUILD_TESTS:BOOL=OFF
    -DBUILD_PERF_TESTS:BOOL=OFF
    -DBUILD_PACKAGE:BOOL=OFF
    -DBUILD_WITH_STATIC_CRT:BOOL=OFF
    -DWITH_CUDA:BOOL=OFF
    -DBUILD_ZLIB:BOOL=OFF
    -DBUILD_JAVA:BOOL=OFF
    -DENABLE_PIC:BOOL=ON
    -DWITH_OPENEXR:BOOL=OFF
    -DWITH_MATLAB:BOOL=OFF
    "-DBUILD_opencv_java:BOOL=OFF"
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
    -DBUILD_opencv_videoio:BOOL=FF
    -DBUILD_opencv_videostab:BOOL=FF
    "-DBUILD_opencv_world:BOOL=OFF"
    "-DOPENCV_EXTRA_MODULES_PATH:PATH=${ES_DEPENDS_DOWNLOAD_DIR}/opencv_contrib/modules"
    -DBUILD_opencv_aruco:BOOL=OFF
    -DBUILD_opencv_bgsegm:BOOL=OFF
    -DBUILD_opencv_bioinspired:BOOL=OFF
    -DBUILD_opencv_ccalib:BOOL=OFF
    -DBUILD_opencv_cnn_3dobj:BOOL=OFF
    -DBUILD_opencv_contrib_world:BOOL=OFF
    -DBUILD_opencv_cvv:BOOL=OFF
    -DBUILD_opencv_datasets:BOOL=OFF
    -DBUILD_opencv_dnn:BOOL=OFF
    -DBUILD_opencv_dnn_easily_fooled:BOOL=OFF
    -DBUILD_opencv_dnn_modern:BOOL=OFF
    -DBUILD_opencv_dpm:BOOL=OFF
    -DBUILD_opencv_face:BOOL=OFF
    -DBUILD_opencv_freetype:BOOL=OFF
    -DBUILD_opencv_fuzzy:BOOL=OFF
    -DBUILD_opencv_hdf:BOOL=ON
    -DBUILD_opencv_line_descriptor:BOOL=OFF
    -DBUILD_opencv_matlab:BOOL=OFF
    -DBUILD_opencv_optflow:BOOL=OFF
    -DBUILD_opencv_phase_unwrapping:BOOL=OFF
    -DBUILD_opencv_plot:BOOL=OFF
    -DBUILD_opencv_reg:BOOL=OFF
    -DBUILD_opencv_rgbd:BOOL=OFF
    -DBUILD_opencv_saliency:BOOL=OFF
    -DBUILD_opencv_sfm:BOOL=OFF
    -DBUILD_opencv_stereo:BOOL=OFF
    -DBUILD_opencv_structured_light:BOOL=OFF
    -DBUILD_opencv_surface_matching:BOOL=OFF
    -DBUILD_opencv_text:BOOL=OFF
    -DBUILD_opencv_tracking:BOOL=OFF
    -DBUILD_opencv_xfeatures2d:BOOL=OFF
    -DBUILD_opencv_ximgproc:BOOL=OFF
    -DBUILD_opencv_xobjdetect:BOOL=OFF
    -DBUILD_opencv_xphoto:BOOL=OFF
)
#better not to use CMAKE_ARGS
#define the arguments before using, move the list above
#replace the CMAKE_ARGS with the list defined
#Future: Don't use reserved word as variables for safety
