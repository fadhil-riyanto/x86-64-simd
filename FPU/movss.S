        .globl _start 

        .data 
        aa: .float 7.94

        .text 
        // 0 10000001 1111110 = positive + exp (129)  + 

_do_sse_float_st:
        pushq %rbp 
        movq %rsp, %rbp

        movss aa(%rip), %xmm0

        movq %rbp, %rsp
        popq %rbp
        ret

_start:

        call _do_sse_float_st
        movl $60, %eax
        movl $100, %edi
        syscall
