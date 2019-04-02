assume cs:code
code segment
start:
    mov ah, 00h
    mov al, 02h
    int 10h

    mov ah, 02h
    mov dh, 12d
    mov dl, 40d
    int 10h

    mov ah, 09h
    mov al, 01h
    mov bl, 8ch
    mov cl, 2
    int 10h

    mov ah, 07h
    int 21h

    mov ah, 4ch
    int 21h
code ends
end start
