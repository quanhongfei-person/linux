	AREA  RESET,CODE
	ENTRY
start
	bl fun
	mov r0, #3
	mov r1, #4
	b end1
fun
	mov r2, #4
	mov r3, #5
	mov pc, lr
end1

	END