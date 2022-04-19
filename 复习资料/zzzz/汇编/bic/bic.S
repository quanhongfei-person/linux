	AREA RESET,CODE
	ENTRY
start
	mov r3, #1
	mvn  r0, #0  ;r0=0xffffffff
	bic r1, r0, #(0x1<<15)
	bic r2, r0, r3, lsl #15	   ;r2 = r1 & ~(r3<<15)
	END