.globl _start
.align 2
.text
.global bss_start
.global bss_end
_start:b   reset
    ldr pc, _undefined_instruction
    ldr pc, _software_interrupt
    ldr pc, _prefetch_abort
    ldr pc, _data_abort
    ldr pc, _not_used
    ldr pc, _irq
    ldr pc, _fiq

 _undefined_instruction: .word undefined_instruction
 _software_interrupt:    .word software_interrupt
 _prefetch_abort:    .word prefetch_abort
 _data_abort:        .word data_abort
 _not_used:      .word 0x11223344
 _irq:           .word irq
 _fiq:           .word fiq
 _pad:           .word 0x12345678 /* now 16*4=64 */
 .global _end_vect
 _end_vect:

undefined_instruction:
software_interrupt:
	stmfd sp!, {r0-r12, lr}  @异常发生时cpu自动保存返回地址到lr寄存器，保存一场发生时cpu正在执行指令的下一条指令地址
	bl do_svc
	ldmfd sp!, {r0-r12, pc}
prefetch_abort:
data_abort:
irq:
	sub lr, #4  @保证返回断点（返回被打断的代码）
	stmfd sp!, {r0-r12, lr}  @ 保存断点  异常发生时cpu自动保存返回地址到lr寄存器，保存一场发生时cpu正在执行指令的下一条指令地址
	bl do_irq
	ldmfd sp!, {r0-r12, pc}^ @  恢复断点   ^需要模式恢复
fiq:
bss_start:
	.word _start_bss
bss_end:
	.word _end_bss

reset:

	ldr r0, =_start@将_start标号表示的地址给r0
	mcr p15, 0, r0, c12, c0, 0 @将r0的数值赋给cp15协处理器的c12寄存器，设置异常向量表基地值在r0
	mrs r0, cpsr
	bic r0, #(0x1<<7) //使能irq
	msr cpsr, r0

	clear_bss:
		ldr r0, bss_start
		ldr r1, bss_end
		mov r2, #0
		bss_clear:
			str r2, [r0], #4
			cmp r0, r1
			bne bss_clear
	b main

.end
