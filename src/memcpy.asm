BITS 64
section .text
global memcpy

memcpy:
    mov rax, rdi
    mov rcx, rdx
    test rcx, rcx
    je end

loop:
    mov al, [rsi]
    mov [rdi], al
    inc rdi
    inc rsi
    dec rcx
    jnz loop

end:
    ret