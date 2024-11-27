; Simulate Data Monitoring and Control

section .data
    sensor db 10        ; Simulated sensor value (10)
    motor_status db 0   ; Motor status (0: off, 1: on)
    alarm_status db 0   ; Alarm status (0: off, 1: on)

section .text
    global _start

_start:
    ; Read sensor value
    mov al, [sensor]    ;Load sensor value into AL register

    ; Check sensor value
    cmp al, 5           ; If sensor value is greater than 5
    jg high_water       ; Jump to high_water if true

    cmp al, 3           ; If sensor value is greater than 3 (but <= 5)
    jg moderate_water   ; Jump to moderate_water if true

    ; Low water level: Turn off motor and alarm
    mov byte [motor_status], 0
    mov byte [alarm_status], 0
    jmp done

high_water:
    ; High water level: Trigger alarm and turn on motor
    mov byte [motor_status], 1
    mov byte [alarm_status], 1
    jmp done

moderate_water:
    ; Moderate water level: Turn on motor, no alarm
    mov byte [motor_status], 1
    mov byte [alarm_status], 0
    jmp done

done:
    ; Exit the program 
    mov eax, 1          ; syscal number for exit
    xor ebx, ebx        ; exit status (0)
    int 0x80            ; syscall interrupt            

    ; The program reads a value from a specific memory location or port designated as the sensor input.
    ; The sensor value is compared against thresholds to determine whether it should 
    ; trigger the alarm, stop the motor, or turn on the motor.
    ; The ports controlling the motor and alarm are updated with specific values to turn it on or off