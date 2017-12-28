;		MOV		R1, #1
		
		MOV		R2, #0
		
		ADDS	R0, R1, R1
		MOVVS	R2, #1
		
		RRX		R1, R0
		RRX		R1, R1
		ADDS	R1, R1, R0
		MOVVS	R2, #1
		
		LSL		R0, R0, #30
