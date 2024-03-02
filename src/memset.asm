
BITS 64
section .text
  global memset

memset:
    mov rax, rdi
    mov rcx, rdx
    test rcx, rcx
    je end
    mov r8b, sil
loop:
    mov byte [rdi], r8b
    inc rdi
    dec rcx
    jnz loop
end:
    ret