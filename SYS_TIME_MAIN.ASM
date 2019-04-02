assume cs:code

code segment

start:
    mov ah, 2ch
    int 21h

    mov ah, ch
    aam
    mov bx, ax
    call disp

    mov dl,":"
    mov ah, 2
    int 21h

    mov ah, cl
    aam
    mov bx, ax
    call disp

    mov dl,":"
    mov ah, 2
    int 21h
    
    mov ah, dh
    aam
    mov bx, ax
    call disp

    mov ah, 4ch
    int 21h
disp proc
    mov dl, 30h
    add dl, bh
    mov ah, 02h
    int 21h
    mov dl, 30h
    add dl, bl
    mov ah, 02h
    int 21h
    ret
disp endp

code ends
end start

