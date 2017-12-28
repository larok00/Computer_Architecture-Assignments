INIT		ADR		R0, BUFFIN1
		ADR		R1, BUFFIN1+16
		ADR		R2, BUFFIN2
		ADR		R3, BUFFIN2+16
		ADR		R4, BUFFTMP
		ADR		R5, BUFFTMP
		
		;		start of real code
		
MLOOP	CMP		R0, R1  ; HS => R0 = R1
		LDRHS	R7, [R2] ; load R7 from IN2
		BHS		M2SEL   ; if IN1 is empty
		CMP		R2, R3     ; HS => R2 = R3
		LDRHS	R6, [R0]   ; load R6 from IN1
		BHS		M1SEL     ; if IN2 is empty
		;		load R6 and R7 from IN1 and IN2 for comparison
		LDR		R6, [R0]
		LDR		R7, [R2]
		CMP		R6, R7   ; LO => select M1, HS => select M2
		BLO		M1SEL
		
M2SEL	ADD		R2, R2, #4
		STR		R7, [R5], #4
		;----------------------------------------------------
		;		work out whether we have finished
MEND		CMP		R0, R1
		CMPEQ	R2, R3
		BNE		MLOOP
		;		copy merged data back to in2 and in1
		;		at end in2 buffer will contain all data
		
CLOOP	LDR		R3, [R4], #4
		ADD		R3, R3, #4
		;----------------------------------------------------
		CMP		R4, R5
		BNE		CLOOP
		;		this is the end of the code
		END
		
M1SEL	ADD		R0, R0, #4
		STR		R6, [R5], #4
		;----------------------------------------------------
		B		MEND
		;		data for testing
BUFFIN1	DCD		3,7,11,20
BUFFIN2	DCD		5,6, 12, 21
BUFFTMP	FILL		32
