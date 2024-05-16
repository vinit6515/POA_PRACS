DATA SEGMENT 
    ARR DB 03H,07H,01H,05H,04H;
    DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE DS:DATA
    START:
    
    MOV AX,DATA;
    MOV DS,AX;
    MOV CL, 04H ;  COUNTER FOR I LOOP
    
    
    FORI:  
    MOV CH,04H;   COUNTER FOR J LOOP   FOR(I=0;I<N-1;I++)
    LEA SI,ARR;
    MOV AX,[SI];
    MOV BX,[SI+1];
    FORJ:
    CMP AX,BX;                         FOR(J=I+1;J<N-1;J++)
    JC DOWN;                            IF(ARR[J]>ARR[I+1]){SWAP}
    MOV DL,[SI+1];
    XCHG DL,[SI];
    MOV [SI+1],DL;
    DOWN:
    INC SI;                            J++
    DEC CH;
    JNZ FORI
    DEC CL;
    JNZ FORJ
    HLT
    CODE ENDS
END START

    