     ; Set up initial values
     MOV R0, #0x100
     MOV R1, #201
     ; Swap the R0, R1 values
    MOV R3, R0
    MOV R0, R1
    MOV R1, R3