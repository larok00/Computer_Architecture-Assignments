		MOV		R1, #1
		MOV		R2, R1		; next multiplier
		MOV		R0, R1		; output
		
LOOP		CMP		R2, #1
		BEQ		EXIT
		SUB		R2, R2, #2
		
MULT
		ADD		R3, R0, R0	; temporary variable
		AND		R4, R2, #2	; comparison variable
		CMP		R4, #2
		BNE		AA
		ADD		R0, R0, R3
		
		
AA		ADD		R3, R3, R3
		AND		R4, R2, #4
		CMP		R4, #4
		BNE		AB
		ADD		R0, R0, R3
		
		
AB		ADD		R3, R3, R3
		AND		R4, R2, #8
		CMP		R4, #8
		BNE		AC
		ADD		R0, R0, R3
		
		
AC		ADD		R3, R3, R3
		AND		R4, R2, #16
		CMP		R4, #16
		BNE		AD
		ADD		R0, R0, R3
		
		
AD		ADD		R3, R3, R3
		AND		R4, R2, #32
		CMP		R4, #32
		BNE		AE
		ADD		R0, R0, R3
		
		
AE		SUB		R4, R2, #64
		AND		R4, R4, #0x80000000
		CMP		R4, #0x80000000
		BEQ		DONE
		
		ADD		R3, R3, R3
		AND		R4, R2, #64
		CMP		R4, #64
		BNE		AF
		ADD		R0, R0, R3
		
		
AF		SUB		R4, R2, #128
		AND		R4, R4, #0x80000000
		CMP		R4, #0x80000000
		BEQ		DONE
		
		ADD		R3, R3, R3
		AND		R4, R2, #128
		CMP		R4, #128
		BNE		AG
		ADD		R0, R0, R3
		
		
AG		SUB		R4, R2, #256
		AND		R4, R4, #0x80000000
		CMP		R4, #0x80000000
		BEQ		DONE
		
		ADD		R3, R3, R3
		AND		R4, R2, #256
		CMP		R4, #256
		BNE		AH
		ADD		R0, R0, R3
		
		
AH		SUB		R4, R2, #512
		AND		R4, R4, #0x80000000
		CMP		R4, #0x80000000
		BEQ		DONE
		
		ADD		R3, R3, R3
		AND		R4, R2, #512
		CMP		R4, #512
		BNE		AI
		ADD		R0, R0, R3
		
		
AI		ADD		R3, R3, R3
		AND		R4, R2, #1024
		CMP		R4, #1024
		BNE		DONE
		ADD		R0, R0, R3
		
DONE		B		LOOP
		
		
		
EXIT		AND		R4, R1, #2
		CMP		R4, #2
		BEQ		FINAL
		RSB		R0, R0, #0
FINAL
