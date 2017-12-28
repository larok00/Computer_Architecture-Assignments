;---------    sample code to test our subroutine   ----------
    ADR    r0, BUFFIN1 ; in1ps
    ADR    r1, BUFFIN1 + 16 ; in1pe
    ADR    r2, BUFFIN2 + 16 ; in2pe
    ADR    r3, BUFFTMP ; tmpps
    BL    MERGE
    END
    ;    data to test subroutine
BUFFIN1  DCD    3, 7, 11, 20
BUFFIN2  DCD    5, 6, 12, 21
BUFFTMP  FILL    32
;------------------end of test code---------------------------
;
; MERGE Subroutine
; INPUTS
; r0,r1 = in1 buffer start, end
; r1, r2 = in2 buffer start, end
; r3 = tmp buffer start
; OUTPUTS
; r0, r1 = outps, outpe
; NB the merge is in-place, so outps = in1ps, outpe = in2pe
MERGE
    STMED  R13!, {R4-R7, R14} ; save registers on stack
    ;    set up registers to conform with the original merge code
    MOV    R4, R3
    MOV    R5, R3
    MOV    R3, R2
    MOV    R2, R1

MLOOP  CMP    R0, R1  ; HS => R0 = R1
    LDRHS  R7, [R2] ; load R7 from IN2
    BHS    M2SEL   ; if IN1 is empty
    CMP    R2, R3 ; HS => R2 = R3
    LDRHS  R6, [R0] ; load R6 from IN1
    BHS    M1SEL ; if IN2 is empty
    ;    load R6 and R7 from IN1 and IN2 for comparison
    LDR    R6, [R0]
    LDR    R7, [R2]
    CMP    R6, R7 ; LO => select M1, HS => select M2
    BLO    M1SEL
M2SEL  ADDHS  R2, R2, #4
    STRHS  R7, [R5],#4
    ;    work out whether we have finished
MEND    CMP    R0, R1
    CMPEQ  R2, R3
    BNE    MLOOP
    ;    copy merged data back to in2 and in1
    ;    at end in2 buffer (expanded to cover in1) will contain all data
CLOOP  LDR    R6, [R5, #-4]!
    STR    R6, [R2, #-4]!
    CMP    R4, R5
    BNE    CLOOP
    ;    this is the end of the code
    ;    final pointers (to out buffer which occupies space used by in1 and in2) are stored in r0, r1
    MOV    R0, R2 ; R2 is used as outps in CLOOP as the data is copied back to the out
    MOV    R1, R3 ; R3 was set to in2pe (which is also outpe) initially and never changes
    LDMED  R13!, {R4-R7, PC}  ; this returns restores regs and  from subroutine

M1SEL  ADD    R0, R0, #4 ; move item from IN1 to OUT
    STR    R6, [R5],#4
    B    MEND