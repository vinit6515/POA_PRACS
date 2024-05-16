data segment
    num db 05h      ; Number to calculate the factorial of (5 in this case)
    result db ?     ; Variable to store the result
ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data    ; Load the data segment address into AX
    mov ds, ax      ; Initialize DS with the address of the data segment
    mov al, 01h     ; Initialize AL with 1 (starting value for factorial)
    mov ah, num     ; Load the number from memory into AH

    call fact       ; Call the factorial procedure

    mov result, al  ; Store the result of the factorial in the result variable
    hlt             ; Halt the program

fact proc
    mov bl, ah      ; Move the initial number (from AH) into BL
fact_loop:
    mul bl          ; Multiply AL by BL (result in AX, with lower byte in AL)
    dec bl          ; Decrement BL
    jnz fact_loop   ; If BL is not zero, jump to fact_loop to continue
    ret             ; Return from the procedure
fact endp

code ends

end start
