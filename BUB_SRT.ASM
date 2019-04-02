assume cs:code, ds:data

data segment
    a db 10h, 01h, 03h, 17h, 04h
    n dw n-a
data ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov bx, n
    dec bx
next_pass:
    mov cx, bx
    mov ah, 00h
    lea si, a
next_cmp:
    mov al,[si]
    cmp al,[si+1]
    jle do_nothing
    xchg al,[si+1]
    mov [si], al
    mov ah, 1
do_nothing:
    inc si
    loop next_cmp
    cmp ah, 00h
    je finish
    dec bx
    jnz next_pass
finish:
    mov ah, 4ch
    int 21h
code ends
end start

