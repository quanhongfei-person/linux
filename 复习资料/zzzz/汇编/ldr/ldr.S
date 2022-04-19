	AREA RESET,CODE
	ENTRY
start
	mvn r0, #0
	ldr r3, =0x12345678
	mov r1, #0x40000000
;	str r0, [r1, #4]  ;*£¨r1+4£© = r0
;	ldr r2, [r1, #4]  ;r2 = *(r1+4)
;	str r0, [r1], #4  ; *r1=r0  r1=r1+4
;	ldr r3, [r1], #4   ;r3=*r1  r1=r1+4
	str r3, [r1, #8]
   	str r0, [r1, #4]!  ;*£¨r1+4£© = r0 r1=r1+4
	ldr r2, [r1, #4]!  ;r2 = *(r1+4) r1=r1+4
	END