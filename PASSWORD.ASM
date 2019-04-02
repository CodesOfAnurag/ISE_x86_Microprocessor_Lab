assume cs:code, ds:data
data segment
    pwd1    db  "god123"
    len1    db  len1-pwd1
    pwd2    db  10 dup(?)
    len2    db  ?

    m1  db  0ah,0dh,"Enter Password : $"
    m2  db  0ah,0dh,"Wrong Password $"
    m3  db  0ah,0dh,"Exceeded limit of 3 $"
    m4  db  0ah,0dh,"Password matched $"
data ends

;
disp macro m
    lea dx, m
    mov ah, 9h
    int 21h
endm
;

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    mov bl,0
rpt:
    call readp
    call matchp
    inc bl
    cmp bl, 3
    jb rpt
    disp m3
    mov ah, 4ch
    int 21h

;
readp proc near
    disp m1
    mov bh, 0
    lea si, pwd2
read:
    mov ah, 8h
    int 21h
    cmp al, 0dh
    je done
    mov [si], al
    inc si
    inc bh
    mov dl, "*"
    mov ah, 2
    int 21h
    jmp read
done:
    mov len2, bh
    ret
readp endp
;

;
matchp proc near
    mov cl, len1
    cmp cl, len2
    jnz miss
    lea si, pwd1
    lea di, pwd2
    cld
    mov ch, 0
    rep cmpsb
    jnz miss
    disp m4
    mov ah, 4ch
    int 21h
miss:
    disp m2
    ret
matchp endp
;

code ends
end start
