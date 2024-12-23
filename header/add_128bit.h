#ifndef ADD_128BIT_H
#define ADD_128BIT_H

#include "../header/attr.h"
#include <immintrin.h>

typedef struct _i128_32 {
        int a;
        int b;
        int c;
        int d;
} i128_32;

/* pack 32 bit int into 128 bit long vector */
__m128i __hot simd_128_arr32_ns(struct _i128_32 *ptr);
__m128i __hot simd_128_add_ns(__m128i *a_ptr, __m128i *b_ptr);

#endif