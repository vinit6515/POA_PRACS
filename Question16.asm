DATA SEGMENT
    ARR DB 03H,04H,01H,09H,08H
    DATA ENDS
CODE SEGMENT
    MACRO ASCENDING 
        MOV CH,04H
        FORI:
        MOV CL,CH
        LEA SI,ARR
        FORJ:
        MOV AL,[SI]
        MOV BL,[SI+1]
        CMP AL , BL
        JC NOSWAP
        XCHG AL,BL
        MOV [SI],AL
        MOV [SI+1],BL
        NOSWAP:
        INC SI
        DEC CL
        JNZ FORJ
        DEC CH
        JNZ FORI
    ENDM
    
    ASSUME CS:CODE,DS:DATA 
    START:
    MOV AX,DATA
    MOV DS,AX
    ASCENDING
    HLT
    CODE ENDS
END START