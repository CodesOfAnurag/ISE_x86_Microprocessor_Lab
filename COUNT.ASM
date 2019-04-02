assume cs:code
code segment
start:
    mov bl, 00
    seconds db 0
    count db 10d
next:
    mov al, bl
    aam
    add ax,3030h
    
    mov dl, ah
    mov ah, 02h
    push ax
    int 21h

    pop ax
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, 0dh
    mov ah, 02h
    int 21h

    call delay
    inc bl
    cmp count, bl
    jae next

    mov ah, 4ch
    int 21h

delay proc
   ; mov ah, 86h
   ; int 15h
   ; ret
again:
   mov ah, 2ch
   int 21h
   shl dh, 1
   cmp dh, seconds
   je again
   mov seconds,dh
   ret
delay endp

code ends
end start

