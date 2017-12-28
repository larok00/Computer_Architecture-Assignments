		MOV		R2, R1	; next multiplier
		MOV		R0, R1	; output
		
LOOP		CMP		R2, #1
		BEQ		EXIT
		SUB		R2, R2, #2
		MOV		R3, #0	; adding counter
		MOV		R4, R0	; temporary variable
		
MULT
		
		ADD		R3, R3, #1
		CMP		R3, R2
		BEQ		LOOP
		ADD		R0, R0, R4
		
		B		MULT
		
EXIT		AND		R4, R1, #2
		CMP		R4, #2
		BEQ		FINAL
		RSB		R0, R0, #0
FINAL
