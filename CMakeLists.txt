cmake_minimum_required(VERSION 3.10)
project(simd-8664 VERSION 1.0)

add_library(vec128 128-bit/add.c)

add_executable(add128 src/128_32_add.c)

target_link_libraries(add128 vec128)