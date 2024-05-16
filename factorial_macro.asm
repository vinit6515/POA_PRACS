fact macro num:
    back:mul num;
    dec num
    jnz back;
endm
data segment 
    num db 05h;
    result dw ?
ends
code segment
    assume ds:data, cs:code
    start:
    mov ax,data;
    mov ds, ax;
    mov cl,num;   
    mov  ax,0001h; Basically just to multiply 5 by1 else it will be multiplied by 0 or some random value
    fact num;
    mov result,ax;
    hlt
ends
end start
