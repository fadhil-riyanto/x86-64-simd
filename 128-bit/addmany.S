        .globl sum_all

        .text 
_m_128_32_pack:
        push %rbp
        movq %rsp, %rbp

        movd %edi, %xmm0
        movd %esi, %xmm1 

        // nb: xmm2, xmm3 used

        vpunpckldq %xmm1, %xmm0, %xmm2 

        movd %edx, %xmm0
        movd %ecx, %xmm1

        vpunpckldq %xmm1, %xmm0, %xmm3

        punpcklqdq %xmm3, %xmm2
        movups %xmm2, %xmm0

        movq %rbp, %rsp
        pop %rbp
        ret

// sum 16 data, each data 32 bit wide, with vector as big as 128 bit
// rdi,ersi, edx
_m_32fetch:
        push %rbp
        movq %rsp, %rbp

        sub $16, %rsp                    // stack
        movl %edx, 12(%rsp)             // old edx
        movl $0, 8(%rsp)                // as rcx counter
        movl $0, 4(%rsp)                 // as i couter
        movl $0, 0(%rsp)                // curindex
        movq $4, %r10

_m_32fetch_loop:
        // save old edx 
        xor %edx, %edx
        movl 4(%rsp), %eax             
        div %r10                        // result stored in eax, make sure rdx is null and rcx same as indexof

        movl %edx, 0(%rsp)              # move div result to 0(%rsp)

        cmpl $0, 0(%rsp)
        jne _m_32fetch_else_donothing

        // compare rcx counter == indexof

        movl 12(%rsp), %edx
        cmpl 8(%rsp), %edx 
        jne _m_32fetch_else_donothing

        // if block
        movl 8(%rsp), %r9d
        push %rax 

        // multiplication prepare
        movl %r9d, %eax 
        movl $4, %r11d
        mul %r11d
        movl %eax, %r9d
        pop %rax 
        lea (%rdi, %r9, 4), %r8
        xorl %eax, %eax

        // safe return here
        movl 0(%r8), %edi
        movl 4(%r8), %esi
        movl 8(%r8), %edx
        movl 12(%r8), %ecx
        call _m_128_32_pack

        jmp _m_32fetch_exit
_m_32fetch_else_donothing:
        // check whatever 0(%rsp) is zero
        cmpl $0, 0(%rsp)
        je _m_32fetch_increase_rcx
        jne _m_32next_skip
_m_32fetch_increase_rcx:
        incl 8(%rsp)
_m_32next_skip:
        incl 4(%rsp)
        cmpl 4(%rsp), %esi
        jne _m_32fetch_loop
_m_32fetch_exit:
        movq %rbp, %rsp
        pop %rbp
        ret

sum_all:
        push %rbp 
        movq %rsp, %rbp

        // nb: 0 ~ 3 is unused
        sub $8, %rsp

        // tell how many fetch need to taken
        movl %esi, %eax 
        movq $4, %r9
        div %r9 
        movl %eax, 4(%rsp)

        xor %ecx, %ecx
        movl $0, %r9d
        movl %r9d, 0(%rsp)
sum_all_loop:
        // bug: overwrite 8 bytes
        movl 0(%rsp), %ecx
        
        movl %ecx, %edx
        xorps %xmm0, %xmm0
        call _m_32fetch
        // debug here

        movl 0(%rsp), %ecx

        cmpl %ecx, 4(%rsp)
        jne sum_all_inc_loop
        je sum_all_exit_done
sum_all_inc_loop:
        incq 0(%rsp)
        jmp sum_all_loop
sum_all_exit_done:

        movq %rbp, %rsp
        pop %rbp
        ret 