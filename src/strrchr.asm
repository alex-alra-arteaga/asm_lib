BITS 64

section .text
global strrchr

strrchr:
    mov rcx,0
next_char:
    cmp byte [rdi+rcx],0
    je end
    inc rcx
    jmp next_char
search_loop:
    mov al, [rdi+rcx]
    cmp al, sil
    je  found
    test al, al
    jz  not_found
    dec rcx
    jmp search_loop

found:
    mov rax, rdi
    ret

not_found:
    xor rax, rax
    ret
end:
    ret