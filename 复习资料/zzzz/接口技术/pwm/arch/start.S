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
_start:
#异常向量表
	#关闭看门狗
	#关闭mmu 内存管理单元 段映射 页映射
	#关cache
	#设置栈
	#清除bss
_bss_start:
	.word _start_bss
_bss_end:
	.word _end_bss
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



