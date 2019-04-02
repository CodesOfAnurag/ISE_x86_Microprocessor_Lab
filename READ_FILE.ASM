assume cs:code, ds:data
data segment
    fname   db  "test.txt"
    buff    db  100 dup(?)
    m1      db  0ah, 0dh,"File Closed $"
    m2      db  0ah, 0dh,"File Not Found$"
data ends
code segment
start:
    mov ax, data
    mov ds, ax

    mov ax,3d00h
    lea dx, fname
    int 21h

    jnc read

    lea dx, m2
    mov ah, 9
    int 21h
    jmp finish

read:
    mov bx, ax
    mov ah, 3fh
    mov cx, 100d
    lea dx, buff
    int 21h
    lea si, buff
    mov cx, 100d
print:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si
    loop print
    mov ah, 3eh
    int 21h
    je finish
    lea dx, m1
    mov ah, 09h
    int 21h
finish:
    mov ah, 4ch
    int 21h
code ends
end start

