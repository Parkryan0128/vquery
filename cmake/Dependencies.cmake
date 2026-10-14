include(FetchContent)
FetchContent_Declare(googletest
  URL https://codeload.github.com/google/googletest/tar.gz/refs/tags/v1.17.0
  URL_HASH SHA256=65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE)
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
