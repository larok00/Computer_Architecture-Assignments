MUL24X24	STMED	R13!, {R4-R6, R14}
		
		MOV		R4, #0
		MOV		R5, #1
		MOV		R2, #0
		MOV		R3, #0
		
LOOP		TST		R1, R5, lsl R4
		RSBNE	R6, R4, #32
		ADDNE	R3, R3, R0, lsr R6
		ADDSNE	R2, R2, R0, lsl R4
		ADDCS	R3, R3, #1
		ADD		R4, R4, #1
		CMP		R4, #24
		BCC		LOOP
		
		LDMED	R13!, {R4-R6, PC}