	AREA RESET,CODE
	ENTRY
start
	mov r0, #0x40000000
	ldr r1, =0x11111111
	ldr r2, =0x22222222
	ldr r3, =0x33333333
	ldr r4, =0x44444444
	stm r0, {r1,r2,r3,r4}
	ldm r0, {r5,r6,r7,r9}
	END