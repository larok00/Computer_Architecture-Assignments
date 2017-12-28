		MOV		R0, #3
		MOV		R1, #3
		BL		MUL24X24
		END
		
MUL24X24	STMED	R13!, {R0, R1, R4-R6, R14}
		
		
		MOV		R4, #0
		MOV		R5, #1
		MOV		R2, #0
		MOV		R3, #0
		
LOOP		TST		R1, R5, lsl R4
		ADDNE	R2, R2, R0, lsl R4
		ADD		R4, R4, #1
		CMP		R4, #8
		BCC		LOOP
		
SECOND	TST		R1, R5, lsl R4
		BNE		BIGNUMBER
GOBACK	ADD		R4, R4, #1
		CMP		R4, #32
		BCC		SECOND
		
		
		LDMED	R13!, {R0, R1, R4-R6, PC}
		
		
BIGNUMBER	RSB		R6, R4, #32
		ADD		R3, R3, R0, lsr R6
		ADDS		R2, R2, R0, lsl R4
		ADDCS	R3, R3, #1
		B		GOBACK
