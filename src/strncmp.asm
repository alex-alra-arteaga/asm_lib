BITS 64

section .text
global strncmp

strncmp:
    test    rdx, rdx
    je      equal

loop:
    js      equal
    movzx   eax, byte [rdi]
    movzx   ebx, byte [rsi]
    inc     rdi
    inc     rsi

    cmp     al, bl
    jne     not_equal
    test    al, al
    jz      equal
    jmp     loop
    dec     rdx

not_equal:
    sub     eax, ebx
    js     negative
    jns     positive

equal:
    mov eax, 0
    ret

positive:
    mov eax, 1
    ret

negative:
    mov eax, -1
    ret