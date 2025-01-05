        .globl _start_unaligned

        .text 

_start_unaligned:
        push %rbp
        movq %rsp, %rbp 
        
        
        // sub $8, %rsp
        // and $-16, %rsp
        subq $32, %rsp  

        // prepare data, seq: 9, 2, 12, 92
        movl $9, %edi
        movl $2, %esi 
        movl $12, %edx 
        movl $92, %ecx 

        call _mm_pack_32_128_diy_u

        // sub $8, %rsp
        movups %xmm0, 16(%rsp)
        // add $8, %rsp

        movl $4, %edi
        movl $72, %esi 
        movl $22, %edx 
        movl $100, %ecx

        call _mm_pack_32_128_diy_u

        // sub $8, %rsp
        movups %xmm0, 0(%rsp)
        // add $8, %rsp

        // null
        xorps %xmm0, %xmm0
        xorps %xmm1, %xmm1
        
        // load
        // sub $8, %rsp
        movups 16(%rsp), %xmm0
        movups 0(%rsp), %xmm1
        // add $8, %rsp

        call _mm_add_32_128_diy_u

        movq %rbp, %rsp
        pop %rbp

_mm_pack_32_128_diy_u:
        pushq %rbp
        movq %rsp, %rbp 

        movd %edi, %xmm0
        movd %esi, %xmm1

        punpckldq %xmm1, %xmm0

        movaps %xmm0, %xmm2 

        movd %edx, %xmm0
        movd %ecx, %xmm1

        punpckldq %xmm1, %xmm0
        
        punpcklqdq %xmm0, %xmm2

        movaps %xmm2, %xmm0

        movq %rbp, %rsp
        popq %rbp
        ret


_mm_add_32_128_diy_u:
        push %rbp
        movq %rsp, %rbp 

        //  __m128 _mm_add_ps(__m128 a, __m128 b)
        addps %xmm1, %xmm0

        movq %rbp, %rsp
        pop %rbp
        ret
