#include "../header/add_128bit.h"
#include <emmintrin.h>
#include <immintrin.h>
#include <stdio.h>

i128_32 data = {
        3, 4, 9, 16
};

i128_32 data2 = {
        1, 2, 9, 1
};

int main()
{
        __m128i x = simd_128_arr32_ns(&data);
        __m128i y = simd_128_arr32_ns(&data2);

        __m128i ret = simd_128_add_ns(&x, &y);

        printf("[1] %d\n", _mm_extract_epi32(ret, 0));
        printf("[2] %d\n", _mm_extract_epi32(ret, 1));
        printf("[3] %d\n", _mm_extract_epi32(ret, 2));
        printf("[4] %d\n", _mm_extract_epi32(ret, 3));
        

}