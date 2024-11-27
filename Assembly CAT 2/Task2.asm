; Array Reversal: Reverse the array in place

section .data
    arr db 1, 2, 3, 4, 5    ; Array of integers (5 values)
    arr_size equ 5          ; Array size

section .text
    global_start

_start:
    ; Initialize the loop variables
    mov esi, 0              ; ESI = start index (0)
    mov edi, arr_size -1    ; EDI = end index (4, since array has 5 elements)

reverse_loop:
cmp esi, edi                ; Compare the start and end indices
jge done                    ; If start index >= end index, jump to done

    ; Swap arr[esi] and arr[edi]
    mov al, [arr + esi]     ; Load arr[esi] into AL
    mov bl, [arr + edi]     ; Load arr[edi] into BL
    mov [arr + esi], bl     ; Store BL in arr[esi]
    mov [arr + edi], al     ; Store AL in arr[edi]

    ;Update indices
    inc esi                 ; Increment start index (esi++)
    dec edi                 ; Decrement end index (edi--)
    jmp reverse_loop        ; Repeat the loop

done:
    ; Exit the program
    mov eax 1               ; syscall number for exit
    xor ebx, ebx            ; exit status (0)
    int 0x80                ; syscall interrupt

;Challenges:
    ; Since the program accesses the memory directly, careful pointer management is required to avoid overwriting data.
    ; Ensuring that the pointers do not cross or access memory outside the bounds of the array could be tricky.