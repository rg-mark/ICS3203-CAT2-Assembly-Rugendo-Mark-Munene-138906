; Factorial using Subroutine

section .data
    num db 5        ; Input number(5)
    result db 0     ; Result storage for the factorial

section .text
    global _start

_start:
    ; Load input number into AL
    mov al, [num] 

    ; Call factorial subroutine
    call factorial   

    ; Store the result in the result variable
    mov [result], al

    ; Exit the program
    mov eax, 1          ; syscall number for exit
    xor ebx, ebx        ; exit status (0)
    int 0x80            ; syscall interrupt

factorial:
    ; Base case: factorial(1) = 1
    cmp al, 1           ; Compare AL (n) with 1
    je factorial_done   ; If n=1, jump to factorial_done

    ; Save the current value of AL (n) onto the stack 
    push ax  

    ; Decrement n and call factorial(n-1)
    dec al
    call factorial

    ; Multiply the returned value by the current n
    pop bx              ; Restore the previous value of n
    mul bx              ; Multiply AL by BX (n * (n-1)!)

factorial_done
ret                     ; Return from subroutine 

; When subroutines are called, certain registers may already hold important values. Therefore, the numbers need to be preserved to prevent overwriting.
; Inside the subroutine, the stack temporarily stores register values like the factorial loop for computation
; At the end of the subroutine, the stack restores the saved values.
