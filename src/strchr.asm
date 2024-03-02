BITS 64

section .text
global strchr

strchr:
search_loop:
    mov al, [rdi]
    cmp al, sil
    je  found
    test al, al
    jz  not_found
    inc rdi
    jmp search_loop

found:
    mov rax, rdi
    ret

not_found:
    xor rax, rax
    ret
