data segment 
    arr db 04h,03h,05h,09h,01h;  
    min db ?
    max db ?
    
ends
extra segment 
   
ends

code segment
    assume cs:code ds:data
    start:
    mov ax,data
    mov ds,ax
    mov ch , 04h 
    fori:
    lea si, arr
    mov cl,ch
    forj:
    mov al,[si]
    mov bl, [si+1]
    cmp al,bl
    jc noswap
    xchg al,bl
    mov [si],al;
    mov [si+1],bl
    noswap:
    inc si
    dec cl
    jnz forj
    dec ch
    jnz fori
      
    lea si, arr
    mov al, [si]
    mov min, al


    add si, 04h      ; Point to the last element
    mov al, [si]
    mov max, al  
    hlt
    code ends
end start

    