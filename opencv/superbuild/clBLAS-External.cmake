message("\nExternal project - clBLAS")

list(APPEND
  ES_DEPENDS
  clblas
)

ExternalProject_Add(clblas
  URL                  "https://github.com/clMathLibraries/clBLAS/releases/download/v2.12/clBLAS-2.12.0-Linux-x64.tar.gz"
  # URL_HASH             MD5=
  DOWNLOAD_NAME        "clBLAS-2.12.0-Linux-x64.tar.gz"
  DOWNLOAD_DIR         ${ES_DEPENDS_DOWNLOAD_DIR}
  DOWNLOAD_NO_PROGRESS 1
  SOURCE_DIR           "${ES_DEPENDS_DOWNLOAD_DIR}/clBLAS"
  UPDATE_COMMAND       ""
  PATCH_COMMAND        ""
  CONFIGURE_COMMAND    ""
  BUILD_COMMAND        ""
  INSTALL_COMMAND      ""
  TEST_COMMAND         ""
)

ExternalProject_Get_Property(clblas SOURCE_DIR)
message( "clBLAS = ${SOURCE_DIR}")

set(clBLAS_DIR "${SOURCE_DIR}/lib64/cmake/clBLAS" CACHE PATH "clBLAS build directory")
message( "clBLAS build = ${clBLAS_DIR}")


# EOF