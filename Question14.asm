DATA SEGMENT
    ARR DB 00H,01H,02H,03H,04H
    SUM DB 00H
    AVG DB 00H
    DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE ,DS :DATA
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,0000H 
    MOV CL,05H 
    LEA SI,ARR 
    
    ABC:
    MOV AL,[SI]
    ADD SUM,AL   
    INC SI
    DEC CL
    JNZ ABC   
    MOV AL,SUM
    MOV CL,05H
    DIV CL
    MOV AVG,AL
    HLT 
    
    CODE ENDS
END START
    
    