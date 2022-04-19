	AREA RESET,CODE
	ENTRY
start
	mov sp, #0x40000000
	mrs r0, cpsr
   	;10010
	bic r0, r0, #0x1f
	orr r0, r0, #0x12
	msr cpsr_c, r0
	mrs r0, cpsr
   	;10011
	bic r0, r0, #0x1f
	orr r0, r0, #0x13
	msr cpsr_c, r0
	END