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


/* 
   0x0000555555555242 <+0>:     push   %rbp                 // buat stack frame
   0x0000555555555243 <+1>:     mov    %rsp,%rbp
   0x0000555555555246 <+4>:     mov    %rdi,-0x38(%rbp)         // ptr

   0x000055555555524a <+8>:     mov    -0x38(%rbp),%rax         // rax = -0x38(%rbp)
=> 0x000055555555524e <+12>:    mov    0xc(%rax),%eax           // eax = *rax + 12    (d first)
   0x0000555555555251 <+15>:    mov    -0x38(%rbp),%rdx         // rdx = -0x38(%rbp)
   0x0000555555555255 <+19>:    mov    0x8(%rdx),%edx           // edx = *rdx + 0x8   (c)
   0x0000555555555258 <+22>:    mov    -0x38(%rbp),%rcx         
   0x000055555555525c <+26>:    mov    0x4(%rcx),%ecx                                 (b)
   0x000055555555525f <+29>:    mov    -0x38(%rbp),%rsi
   0x0000555555555263 <+33>:    mov    (%rsi),%esi                                    (a)

   0x0000555555555265 <+35>:    mov    %esi,-0x30(%rbp)         // store to stack       a
   0x0000555555555268 <+38>:    mov    %ecx,-0x2c(%rbp)         // b
   0x000055555555526b <+41>:    mov    %edx,-0x28(%rbp)         // c
   0x000055555555526e <+44>:    mov    %eax,-0x24(%rbp)         // d
   
   0x0000555555555271 <+47>:    mov    -0x24(%rbp),%eax               
   0x0000555555555274 <+50>:    mov    %eax,-0x20(%rbp)         // -0x20 = d
   0x0000555555555277 <+53>:    mov    -0x28(%rbp),%eax
   0x000055555555527a <+56>:    mov    %eax,-0x1c(%rbp)         // -0x1c = c
   0x000055555555527d <+59>:    mov    -0x2c(%rbp),%eax
   0x0000555555555280 <+62>:    mov    %eax,-0x18(%rbp)         // -0x18 = b
   0x0000555555555283 <+65>:    mov    -0x30(%rbp),%eax
   0x0000555555555286 <+68>:    mov    %eax,-0x14(%rbp)         // -0x14 = a
   0x0000555555555289 <+71>:    movd   -0x20(%rbp),%xmm0        // xmm0 = 0x20 (32 bit)
   0x000055555555528e <+76>:    movd   -0x1c(%rbp),%xmm1        // xmm1 = 0x1c  
   
                                                                // Move Aligned Packed Integer Values
   0x0000555555555293 <+81>:    movdqa %xmm1,%xmm2              // xmm2 = xmm1  
   
   xmm0 = d
   xmm1 = c (also known as xmm2)

   // consider AT&T syntax of PUNPCKLDQ xmm1, xmm2
   // PUNPCKLDQ xmm2, xmm1 (end in xmm1) 

   0x0000555555555297 <+85>:    punpckldq %xmm0,%xmm2           // pack op2, to op1
   
                                                                // current layout 
                                                                // {0, 0, d, c}

   
   0x000055555555529b <+89>:    movd   -0x18(%rbp),%xmm1        // load 0x18 to xmm1 aka b
   0x00005555555552a0 <+94>:    movd   -0x14(%rbp),%xmm0        // load 0x14 to xmm0 aka a

   0x00005555555552a5 <+99>:    punpckldq %xmm1,%xmm0           // state (0, 0, b, a)
   0x00005555555552a9 <+103>:   punpcklqdq %xmm2,%xmm0          // state (b, a, d, c)
   0x00005555555552ad <+107>:   nop                             // unused
   0x00005555555552ae <+108>:   movaps %xmm0,-0x10(%rbp)        // store back to 0x10
   0x00005555555552b2 <+112>:   movdqa -0x10(%rbp),%xmm0
   0x00005555555552b7 <+117>:   pop    %rbp
   0x00005555555552b8 <+118>:   ret
*/
