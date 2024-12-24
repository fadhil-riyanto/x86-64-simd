
#include <string.h>
#include <emmintrin.h>
#include <stdio.h>
#include <immintrin.h>
// #include "../header/attr.h"

__m128i retq()
{
        __m128i a = _mm_setr_epi32(3, 4, 9, 3);

        return a;
}

static void syscall1(long sysnum, long arg1)
{
        int ret = 0;

        __asm__ (
                "syscall" :
                        /* output section */
                        "=a" (ret),      // eax
                        "+b" (arg1)     // ebx
                           :
                        "a" (sysnum) 
                           : 
                        "memory", "cc"
        );
}

static void inline __attribute__((__always_inline__)) chng_mem(int *ptr_a) 
{
        __asm__ volatile (
                "movl $58, %0"
                : "=r" (*ptr_a) : :
        );
}

int main()
{
        __m128i ret = retq();

        printf("%zu : %d\n", sizeof(int), _mm_extract_epi32(ret, 0));

        int rand = 0;

        chng_mem(&rand);

        printf("%d\n", rand);
        
}