DATA SEGMENT
    NUM DB 05H
    RES DB ?
    DATA ENDS
CODE SEGMENT
    MACRO FACT NUM
        ABC:
        MUL NUM
        DEC NUM
        JNZ ABC
    ENDM
    
    ASSUME CS:CODE,DS:DATA
    START:
    MOV AX,DATA
    MOV DS,AX 
    MOV AX,0001H
    FACT NUM  
    MOV RES,AL
    HLT   
    
    CODE ENDS
END START