#include <time.h>
#include <stdio.h>

extern void _start_aligned();
extern void _start_unaligned();

int main()
{
        unsigned long diff = 0;
        int mod_ret = 0;
        struct timespec start1, end1, start2, end2;

        // pastikan
        __asm__ volatile (
                "movl %%rsp, %0" : 
                "=r" (mod_ret) :
                : 
        );

        clock_gettime(CLOCK_MONOTONIC,  &start1);
        _start_aligned();
        clock_gettime(CLOCK_MONOTONIC,  &end1);

        diff = end1.tv_nsec - start1.tv_nsec;

        printf("CLOCK_MONOTONIC aligned %d: %lu \n", mod_ret % 16, diff);

        __asm__ volatile (
                "movq %%rsp, %0" : 
                "=r" (mod_ret) :
                : 
        );

        clock_gettime(CLOCK_MONOTONIC,  &start2);
        _start_unaligned();
        clock_gettime(CLOCK_MONOTONIC,  &end2);

        diff = end2.tv_nsec - start2.tv_nsec;

        printf("CLOCK_MONOTONIC unaligned %d: %lu \n", mod_ret % 16, diff);


        
}
