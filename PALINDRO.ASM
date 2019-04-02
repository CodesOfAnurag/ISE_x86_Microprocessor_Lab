assume cs:code, ds:data

data segment
    str1    db  "MLAYALAM"
    n       db  n-str1
    str2    db  8 dup(?)
    m1      db  "Palindrome$"
    m2      db  "Not a Palindrome$"
data ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov cl, n
    lea si, n
    dec si
    lea di, str2
nextc:
    mov al, [si]
    mov [di], al
    dec si
    inc di
    loop nextc
    lea si, str1
    lea di, str2
    cld
    mov cl, n
    rep cmpsb
    jnz mis
    lea dx, m1
    jmp disp
mis:
    lea dx, m2
disp:
    mov ah, 9h
    int 21h
    mov ah, 4ch
    int 21h
code ends
end start
