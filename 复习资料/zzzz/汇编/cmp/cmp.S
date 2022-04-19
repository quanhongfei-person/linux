	AREA RESET,CODE
	ENTRY
start
	mov r0, #2
	cmp r0, #1
	movlt r1, #4
	movgt r1, #2
	movne r1, #5
	moveq r1, #6
	END