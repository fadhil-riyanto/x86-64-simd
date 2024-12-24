
#include <stdlib.h>
#include <string.h>
#include <emmintrin.h>
#include <stdio.h>
#include <immintrin.h>
#include <time.h>
// #include "../header/attr.h"



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

__m128i retq()
{
        __m128i a = _mm_setr_epi32(3, 4, 9, 3);

        return a;
}

static inline int* __attribute__((__always_inline__)) incint(int *ptr_a, int *ptr_b) 
{
        int *ret = (int*)malloc(sizeof(int));
        __asm__ volatile (
                "add %%ebx, %%eax"
                : "=a" (*ret) : "b" (*ptr_a), "a" (*ptr_b) :
        );

        return ret;
}

static inline long gen_64int_hw()
{
        int ret = 0;
        __asm__ volatile (
                "rdrand %%rax"
                : "=a" (ret) : : 
        );

        return ret;
}

int main()
{
        __m128i ret = retq();


        int rand = 2;
        int rand1 = gen_64int_hw();
        int *retl = NULL;

        // incint(&rand);
        retl = incint(&rand, &rand1);

        printf("%d\n", *retl);

        free(retl);
        
}