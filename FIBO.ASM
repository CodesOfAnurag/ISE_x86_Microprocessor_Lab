assume cs:code, ds:data

data segment
    fibo db 10 dup(?)
    n db fibo-n
data ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov al, 0h
    mov bl, 1h
    lea si, fibo
    mov [si], al
    inc si
    mov [si], bl
    inc si
    mov cx, n
    sub cx, 2
next_num:
    add al, bl
    mov [si], al
    inc si
    xchg al, bl
    loop next_num
    mov ah, 4ch
    int 21h
code ends
end start
