cmake_minimum_required(VERSION 3.10)
project(simd-8664 C ASM)

add_library(vec128 128-bit/add.c)
add_library(arrvec128_lib 128-bit/addmany.S)

add_executable(add128 src/128_32_add.c)
add_executable(arrvec128 src/128_32_sum.c)

target_link_libraries(add128 vec128)
target_link_libraries(arrvec128 arrvec128_lib)