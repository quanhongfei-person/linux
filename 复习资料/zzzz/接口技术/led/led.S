.globl _start  @ .globl 声名全局可见标号
.align 2       @4字节对其
.text          @文本段
_start:        @定义标号
	ldr r0, =0x110002e0 
	mov r1, #0x1<<12
	str r1, [r0] @设置 GPM4[3]为输出状态
	ldr r0, =0x110002e4 
fun:
	mov r1, #0
	str r1, [r0]  @设置GPM4[3]引脚输出低电平，灯亮
	bl delay
	mov r1, #0xf
	str r1, [r0]  @设置GPM4[3]引脚输出高电平，灯灭
	bl delay
	b fun

delay:
	stmfd sp!, {r0,r1,lr}
	ldr r0, =0x2ffffff
	mov r1, #0
	loop:
		add r1, #1
		cmp r1, r0
		bne loop
	ldmfd sp!, {r0,r1,pc}
.end
