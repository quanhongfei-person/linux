/*
 * start.S
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */

.globl _start
.globl _bss_start
.globl _bss_end
.align 2
.text
@40000000 --- 80000000ton
#异常向量表
_start: b   reset
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

undefined_instruction:
software_interrupt:
	stmfd sp!, {r0-r12, lr}
	bl do_svc
	ldmfd sp!, {r0-r12, pc}
prefetch_abort:
data_abort:
irq:
	ldr sp, =0x51000000
	sub lr, #4  @确保返回断点
	stmfd sp!, {r0-r12, lr}
	bl do_irq
	ldmfd sp!, {r0-r12, pc}^    @ ^  表示恢复模式
fiq:
	#关闭看门狗
	#关闭mmu 内存管理单元 段映射 页映射
	#关cache
	#设置栈
	#清除bss
_bss_start:
	.word _start_bss
_bss_end:
	.word _end_bss
reset:
	ldr r0, =_start
	mcr p15, 0, r0, c12, c0, 0  @ 设置异常向量表基地址到_start
	mrs r0, cpsr
	bic r0, r0, #0x1<<7
	msr cpsr, r0   @使能cpu接收中断
clear_bss:
	mov r0, #0
	ldr r1, _bss_start
	ldr r2, _bss_end
	bss_clear:
		str r0, [r1], #4
		cmp r1, r2
		bne bss_clear
	b main

.end



