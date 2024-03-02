BITS 64
SECTION .text
    global strlen
strlen:
    mov rax,0
next_char:
    cmp byte [rdi+rax],0
    je end
    inc rax
    jmp next_char
end:
    ret
