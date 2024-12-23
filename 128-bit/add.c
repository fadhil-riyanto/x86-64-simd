#include <emmintrin.h>
#include <immintrin.h>
#include "../header/add_128bit.h"
#include "../header/attr.h"

__m128i __hot simd_128_arr32_ns(struct _i128_32 *ptr)
{
        __m128i ret = _mm_setr_epi32(
                ptr->a, 
                ptr->b, 
                ptr->c, 
                ptr->d
        );

        return ret;
}

__m128i __hot simd_128_add_ns(__m128i *a_ptr, __m128i *b_ptr)
{
        __m128i ret = _mm_add_epi32(*a_ptr, *b_ptr);
        return ret;
}

