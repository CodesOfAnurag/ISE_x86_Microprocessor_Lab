assume cs:code
code segment
start:
    mov ah, 2ch
    int 21h
    mov al, ch
    call h2b
    call disp

    mov dl, ":"
    mov ah, 02h
    int 21h

    mov al, cl
    call h2b
    call disp

    mov ah, 4ch
    int 21h

h2b proc
    push cx
    mov cl, al
    mov ch, 0
    mov al, 0
    cmp cl, 0
    jz stop
next:
    add al, 1
    daa
    loop next
stop:
    pop cx
    ret
h2b endp

disp proc
    push cx
    mov ah, 00h
    mov cx, 4
    temp equ 4
    shl ax, cx
    shr al, cx
    add ax, 3030h
    push ax
    mov dl, ah
    mov ah, 02h
    int 21h
    pop ax
    mov ah, 02h
    mov dl, al
    int 21h

    pop cx
    ret
disp endp

code ends
end start

