assume cs:code, ds:data
data segment
    n   db 5
    res db ?
data ends
code segment
start:
    mov ax, data
    mov ds, ax
    mov ax, n
    call fact
    mov ah, 4ch
    int 21h
fact proc
    cmp ax, 0
    je init
    push ax
    dec ax
    call fact
    pop ax
    mul res
    mov res, ax
    ret
init:
    mov res, 01
    ret
fact endp
code ends
end start
