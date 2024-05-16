data segment 
    num1 db 0005h;
    num2 db 0004h;
    res db ? 
    ;
    data ends
code segment 
    assume cs: code segment ds: data
        start:
        mov ax,data;
        mov ds,ax;
        lea SI,num1;
        mov ax,[SI];
        lea SI , num2;
        mov bx , [SI];
        sub ax ,bx
        lea SI, res;
        mov [SI],ax;
        hlt
        code ends
    end start