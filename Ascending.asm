DATA SEGMENT
    ARR DB 03H, 07H, 01H, 05H, 04H ;We are basically doing bubble sort here 
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX
    MOV CL, 04H ; cl i loop ka counter hai joh (N-1) times jaata hai

FORI:           ; for(i=0(int this case is source index);i<n-1(joh apne case mein cl hai);i++)
    MOV CH, CL  ; j loop ka  counter (CH = CL = 4)
    LEA SI, ARR ; SI mein arr ka address 

FORJ:                 ;for(j=i+1(si+1);j<n-i-1;j++)
    MOV AL, [SI]      ;
    MOV BL, [SI+1]    ; 
    CMP AL, BL        ; if(ARR[SI] < ARR[SI+1]) then swap
    JC NOSWAP         ; If AL <= BL, no swap needed, jump to NOSWAP
    XCHG AL, BL       ; Swap AL and BL
    MOV [SI], AL      ; 
    MOV [SI+1], BL    ; 

NOSWAP:
    INC SI            ; Increment SI 
    DEC CH            ; ensure ki j --
    JNZ FORJ          ; j loop khatam

    DEC CL            ; i--
    JNZ FORI          ; j loop khatam 
    LEA SI,ARR;
    MOV AX,[SI+1];    ;apan yaha pe second element ke liye i+1 hota hai toh si apna i hai toh yaha pe second element si+1 hoga 

    HLT               
CODE ENDS
END START
