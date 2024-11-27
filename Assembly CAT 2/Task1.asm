; Control Flow: Classifying numbers as POSITIVE, NEGATIVE, or ZERO

section.data
    msgPos db "POSITIVE", 0 ; Message for positive numbers
    msgNeg db "NEGATIVE", 0 ; Message for negative numbers
    msgZero db "ZERO", 0 ; Message for ZERO

section .bss
num resb 4  ; Reserve 4 bytes for the user input (integer)

section .text 
    global_start

_start:
    ; Prompt user for input
    mov eax, 3          ; syscall number for read (3)
    mov ebx, 0          ; file descriptor for stdin (0)
    mov ecx, num        ; buffer to store input
    mov edx, 4          ; size of the buffer (4 bytes for an integer)
    int 0x80            ; interrupt to invoke the syscall

    ; Convert input to integer and load into EAX register
    mov eax, [num]      ; Load input value into EAX register
    cmp eax, 0          ; Compare input value (EAX) with 0
    je zero_case        ; If EAX is zero, jump to zero_case (conditional jump)
    jg positive_case    ; If EAX is greater than zero, jump to positive_case (conditional jump)
    ; The Jump if Equal instruction (JE) is triggered causing a jump to the zero case portion of the code skipping over the other conditions.

    negative_case:
        ; Print "NEGATIVE"
        mov eax, 4      ; syscall number for write (4)
        mov ebx, 1      ; file descriptor for stdout (1)
        mov ecx, msgNeg ; address of "NEGATIVE" Message
        mov edx, 8      ; length of the Message
        int 0x80        ; interrupt to invoke the syscall
        jmp done        ; Jump to done to exit program
        ; The JMP Done is used unconditionally to the done portion of the program after classifying a negative number.
        
    positive_case:
        ; Print "POSITIVE"
        mov eax, 4      ; syscall number for write
        mov ebx, 1      ; stdout
        mov ecx, msgPos ; address of "POSITIVE" Message
        mov edx, 8      ; message length
        int 0x80        ; syscall interrupt
        jmp done        ; Jump to done   

    zero_case:
        ; Print "ZERO"
        mov eax, 4      ;syscall number for write
        mov ebx, 1      ; stdout
        mov ecx, msgZero; address of "ZERO" message
        mov edx, 4      ; length of the message
        int 0x80        ; syscall interrupt

    done:
        ; Exit the program
        mov eax, 1      ; syscall number for exit (1)
        xor ebx, ebx    ; exit status (0)
        int 0x80        ; interrupt to invoke the syscall