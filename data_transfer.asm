DATA SEGMENT 
    S1 DB 01H,02H,03H,04H,05H;This program transfers the data from one string to another
    S2 DB 5 DUP(?);
    DATA ENDS
CODE SEGMENT 
ASSUME CS:CODE SEGMENT DS:DATA
    START:
    MOV AX, DATA ;
    MOV DS,AX;
    MOV ES,AX; 
    LEA SI,S1;
    LEA DI,S2;
    MOV CX,05H;
    LABEL:
    MOV BL,[SI];
    MOV [DI],BL;
    INC SI;
    INC DI;
    DEC CX;
    
    JNZ LABEL;   
    HLT 
    CODE ENDS
END START