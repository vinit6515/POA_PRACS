DATA SEGMENT
    NUM DB 05H
    RESULT DB ?
    DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV AL,01H
    
    ABC:
    MUL NUM
    DEC NUM
    JNZ abc
    MOV RESULT,AL
    HLT
    CODE ENDS
END START
    
    