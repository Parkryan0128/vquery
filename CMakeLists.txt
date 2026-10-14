cmake_minimum_required(VERSION 3.25)
project(vquery VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF)
option(VQUERY_BUILD_TESTS "Build tests" ON)
set(VQUERY_SANITIZER "" CACHE STRING "Sanitizer: address-undefined or thread")
if(VQUERY_SANITIZER STREQUAL "address-undefined")
  add_compile_options(-fsanitize=address,undefined -fno-omit-frame-pointer)
  add_link_options(-fsanitize=address,undefined)
elseif(VQUERY_SANITIZER STREQUAL "thread")
  add_compile_options(-fsanitize=thread -fno-omit-frame-pointer)
  add_link_options(-fsanitize=thread)
elseif(NOT VQUERY_SANITIZER STREQUAL "")
  message(FATAL_ERROR "Unknown sanitizer: ${VQUERY_SANITIZER}")
endif()
find_package(Threads REQUIRED)
include(CheckCXXSourceCompiles)
check_cxx_source_compiles("#include <thread>\nint main(){std::jthread t([]{});}" VQUERY_HAS_JTHREAD)
if(NOT VQUERY_HAS_JTHREAD)
  message(FATAL_ERROR "A C++20 standard library with std::jthread is required")
endif()

add_library(vquery_core
  src/common/memory.cpp
  src/storage/tables.cpp
  src/workload/generator.cpp
  src/execution/operators.cpp
  src/execution/execute.cpp)
target_include_directories(vquery_core PUBLIC include)
target_link_libraries(vquery_core PUBLIC Threads::Threads)
target_compile_options(vquery_core PRIVATE -Wall -Wextra -Wpedantic)

add_library(vquery_cli app/options.cpp app/serialization.cpp)
target_include_directories(vquery_cli PUBLIC app)
target_link_libraries(vquery_cli PUBLIC vquery_core)
target_compile_options(vquery_cli PRIVATE -Wall -Wextra -Wpedantic)
add_executable(vquery app/main.cpp)
target_link_libraries(vquery PRIVATE vquery_cli)
target_compile_options(vquery PRIVATE -Wall -Wextra -Wpedantic)
add_executable(vquery_bench bench/main.cpp)
target_link_libraries(vquery_bench PRIVATE vquery_cli)
target_compile_options(vquery_bench PRIVATE -Wall -Wextra -Wpedantic)

if(VQUERY_BUILD_TESTS)
  enable_testing()
  include(cmake/Dependencies.cmake)
  add_executable(vquery_tests tests/core_test.cpp tests/execution_test.cpp tests/benchmark_test.cpp)
  target_link_libraries(vquery_tests PRIVATE vquery_core GTest::gtest_main)
  target_compile_options(vquery_tests PRIVATE -Wall -Wextra -Wpedantic)
  include(GoogleTest)
  gtest_discover_tests(vquery_tests DISCOVERY_MODE PRE_TEST)
  find_package(Python3 3.11 COMPONENTS Interpreter REQUIRED)
  add_test(NAME cli_and_benchmark_contracts
    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/tests/cli_test.py
    $<TARGET_FILE:vquery> $<TARGET_FILE:vquery_bench> ${googletest_SOURCE_DIR})
  add_test(NAME benchmark_runner_contracts
    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/tests/runner_test.py)
  add_test(NAME performance_study_contracts
    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/tests/study_test.py)
endif()
