BITS 64

section .text
global strcmp

strcmp:
loop:
    mov al, [rdi]
    mov bl, [rsi]

    cmp al, bl
    jne not_equal

    test al, al
    jz equal
    inc rdi
    inc rsi
    jmp loop

not_equal:
    sub al, bl
    js negative
    jns positive

equal:
    mov rax, 0
    ret

positive:
    mov rax, 1
    ret

negative:
    mov rax, -1
    ret
