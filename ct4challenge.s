		;		MOV		R1, #0xFF000000
		;		MOV		R2, #0xFF000000
		
		MOV		R3, #0x55
		ADD		R3, R3, #0x5500
		ADD		R3, R3, #0x550000
		ADD		R3, R3, #0x55000000
		
		AND		R0, R1, R3
		AND		R4, R2, R3
		ADD		R0, R0, R4
		AND		R4, R0, R3, lsl #1
		AND		R1, R1, R3, lsl #1
		AND		R2, R2, R3, lsl #1
		EOR		R1, R1, R2
		EOR		R1, R1, R4
		AND		R0, R0, R3
		ADD		R0, R0, R1
