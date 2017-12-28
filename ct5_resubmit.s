		MOV		R1, #0 ; error output for when input is out of range
		CMP		R0, #15
		BHI		DONE
		ADR		R1, BALANCED
		LDRB		R1, [R1, R0]
DONE
		
BALANCED	DCD		0x5A595655, 0x6A696665, 0x9A999695, 0xAAA9A6A5
