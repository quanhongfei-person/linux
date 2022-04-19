
arm:     file format elf32-littlearm


Disassembly of section .text:

40008000 <_start>:
40008000:	ea000017 	b	40008064 <reset>
40008004:	e59ff014 	ldr	pc, [pc, #20]	; 40008020 <_undefined_instruction>
40008008:	e59ff014 	ldr	pc, [pc, #20]	; 40008024 <_software_interrupt>
4000800c:	e59ff014 	ldr	pc, [pc, #20]	; 40008028 <_prefetch_abort>
40008010:	e59ff014 	ldr	pc, [pc, #20]	; 4000802c <_data_abort>
40008014:	e59ff014 	ldr	pc, [pc, #20]	; 40008030 <_not_used>
40008018:	e59ff014 	ldr	pc, [pc, #20]	; 40008034 <_irq>
4000801c:	e59ff014 	ldr	pc, [pc, #20]	; 40008038 <_fiq>

40008020 <_undefined_instruction>:
40008020:	4000803c 	.word	0x4000803c

40008024 <_software_interrupt>:
40008024:	4000803c 	.word	0x4000803c

40008028 <_prefetch_abort>:
40008028:	40008048 	.word	0x40008048

4000802c <_data_abort>:
4000802c:	40008048 	.word	0x40008048

40008030 <_not_used>:
40008030:	11223344 	.word	0x11223344

40008034 <_irq>:
40008034:	40008048 	.word	0x40008048

40008038 <_fiq>:
40008038:	4000805c 	.word	0x4000805c

4000803c <software_interrupt>:
4000803c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008040:	eb000026 	bl	400080e0 <do_svc>
40008044:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

40008048 <data_abort>:
40008048:	e3a0d451 	mov	sp, #1358954496	; 0x51000000
4000804c:	e24ee004 	sub	lr, lr, #4
40008050:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008054:	eb00029e 	bl	40008ad4 <do_irq>
40008058:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

4000805c <_bss_start>:
4000805c:	40008e0c 	.word	0x40008e0c

40008060 <_bss_end>:
40008060:	40009090 	.word	0x40009090

40008064 <reset>:
40008064:	e59f0028 	ldr	r0, [pc, #40]	; 40008094 <bss_clear+0x10>
40008068:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
4000806c:	e10f0000 	mrs	r0, CPSR
40008070:	e3c00080 	bic	r0, r0, #128	; 0x80
40008074:	e129f000 	msr	CPSR_fc, r0

40008078 <clear_bss>:
40008078:	e3a00000 	mov	r0, #0
4000807c:	e51f1028 	ldr	r1, [pc, #-40]	; 4000805c <_bss_start>
40008080:	e51f2028 	ldr	r2, [pc, #-40]	; 40008060 <_bss_end>

40008084 <bss_clear>:
40008084:	e4810004 	str	r0, [r1], #4
40008088:	e1510002 	cmp	r1, r2
4000808c:	1afffffc 	bne	40008084 <bss_clear>
40008090:	ea000018 	b	400080f8 <main>
40008094:	40008000 	.word	0x40008000

40008098 <delay>:
40008098:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000809c:	e28db000 	add	fp, sp, #0
400080a0:	e24dd00c 	sub	sp, sp, #12
400080a4:	e50b0008 	str	r0, [fp, #-8]
400080a8:	e1a00000 	nop			; (mov r0, r0)
400080ac:	e51b3008 	ldr	r3, [fp, #-8]
400080b0:	e3530000 	cmp	r3, #0
400080b4:	03a03000 	moveq	r3, #0
400080b8:	13a03001 	movne	r3, #1
400080bc:	e6ef3073 	uxtb	r3, r3
400080c0:	e51b2008 	ldr	r2, [fp, #-8]
400080c4:	e2422001 	sub	r2, r2, #1
400080c8:	e50b2008 	str	r2, [fp, #-8]
400080cc:	e3530000 	cmp	r3, #0
400080d0:	1afffff5 	bne	400080ac <delay+0x14>
400080d4:	e28bd000 	add	sp, fp, #0
400080d8:	e8bd0800 	pop	{fp}
400080dc:	e12fff1e 	bx	lr

400080e0 <do_svc>:
400080e0:	e92d4800 	push	{fp, lr}
400080e4:	e28db004 	add	fp, sp, #4
400080e8:	e59f0004 	ldr	r0, [pc, #4]	; 400080f4 <do_svc+0x14>
400080ec:	eb00013e 	bl	400085ec <uprintf>
400080f0:	e8bd8800 	pop	{fp, pc}
400080f4:	40008dc0 	.word	0x40008dc0

400080f8 <main>:
400080f8:	e92d4800 	push	{fp, lr}
400080fc:	e28db004 	add	fp, sp, #4
40008100:	eb00004f 	bl	40008244 <uart_init>
40008104:	eb00028c 	bl	40008b3c <gic_init>
40008108:	eb00024c 	bl	40008a40 <eint_init>
4000810c:	eb000201 	bl	40008918 <timer_init>
40008110:	eafffffe 	b	40008110 <main+0x18>

40008114 <beep_init>:
40008114:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008118:	e28db000 	add	fp, sp, #0
4000811c:	e59f302c 	ldr	r3, [pc, #44]	; 40008150 <beep_init+0x3c>
40008120:	e59f2028 	ldr	r2, [pc, #40]	; 40008150 <beep_init+0x3c>
40008124:	e5922000 	ldr	r2, [r2]
40008128:	e3c2200f 	bic	r2, r2, #15
4000812c:	e5832000 	str	r2, [r3]
40008130:	e59f3018 	ldr	r3, [pc, #24]	; 40008150 <beep_init+0x3c>
40008134:	e59f2014 	ldr	r2, [pc, #20]	; 40008150 <beep_init+0x3c>
40008138:	e5922000 	ldr	r2, [r2]
4000813c:	e3822001 	orr	r2, r2, #1
40008140:	e5832000 	str	r2, [r3]
40008144:	e28bd000 	add	sp, fp, #0
40008148:	e8bd0800 	pop	{fp}
4000814c:	e12fff1e 	bx	lr
40008150:	114000a0 	.word	0x114000a0

40008154 <beep_on>:
40008154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008158:	e28db000 	add	fp, sp, #0
4000815c:	e59f3018 	ldr	r3, [pc, #24]	; 4000817c <beep_on+0x28>
40008160:	e59f2014 	ldr	r2, [pc, #20]	; 4000817c <beep_on+0x28>
40008164:	e5922000 	ldr	r2, [r2]
40008168:	e3822001 	orr	r2, r2, #1
4000816c:	e5832000 	str	r2, [r3]
40008170:	e28bd000 	add	sp, fp, #0
40008174:	e8bd0800 	pop	{fp}
40008178:	e12fff1e 	bx	lr
4000817c:	114000a4 	.word	0x114000a4

40008180 <beep_off>:
40008180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008184:	e28db000 	add	fp, sp, #0
40008188:	e59f3018 	ldr	r3, [pc, #24]	; 400081a8 <beep_off+0x28>
4000818c:	e59f2014 	ldr	r2, [pc, #20]	; 400081a8 <beep_off+0x28>
40008190:	e5922000 	ldr	r2, [r2]
40008194:	e3c22001 	bic	r2, r2, #1
40008198:	e5832000 	str	r2, [r3]
4000819c:	e28bd000 	add	sp, fp, #0
400081a0:	e8bd0800 	pop	{fp}
400081a4:	e12fff1e 	bx	lr
400081a8:	114000a4 	.word	0x114000a4

400081ac <led_init>:
400081ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081b0:	e28db000 	add	fp, sp, #0
400081b4:	e59f302c 	ldr	r3, [pc, #44]	; 400081e8 <led_init+0x3c>
400081b8:	e59f2028 	ldr	r2, [pc, #40]	; 400081e8 <led_init+0x3c>
400081bc:	e5922000 	ldr	r2, [r2]
400081c0:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
400081c4:	e5832000 	str	r2, [r3]
400081c8:	e59f3018 	ldr	r3, [pc, #24]	; 400081e8 <led_init+0x3c>
400081cc:	e59f2014 	ldr	r2, [pc, #20]	; 400081e8 <led_init+0x3c>
400081d0:	e5922000 	ldr	r2, [r2]
400081d4:	e3822a01 	orr	r2, r2, #4096	; 0x1000
400081d8:	e5832000 	str	r2, [r3]
400081dc:	e28bd000 	add	sp, fp, #0
400081e0:	e8bd0800 	pop	{fp}
400081e4:	e12fff1e 	bx	lr
400081e8:	110002e0 	.word	0x110002e0

400081ec <led_on>:
400081ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081f0:	e28db000 	add	fp, sp, #0
400081f4:	e59f3018 	ldr	r3, [pc, #24]	; 40008214 <led_on+0x28>
400081f8:	e59f2014 	ldr	r2, [pc, #20]	; 40008214 <led_on+0x28>
400081fc:	e5922000 	ldr	r2, [r2]
40008200:	e3c22008 	bic	r2, r2, #8
40008204:	e5832000 	str	r2, [r3]
40008208:	e28bd000 	add	sp, fp, #0
4000820c:	e8bd0800 	pop	{fp}
40008210:	e12fff1e 	bx	lr
40008214:	110002e4 	.word	0x110002e4

40008218 <led_off>:
40008218:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000821c:	e28db000 	add	fp, sp, #0
40008220:	e59f3018 	ldr	r3, [pc, #24]	; 40008240 <led_off+0x28>
40008224:	e59f2014 	ldr	r2, [pc, #20]	; 40008240 <led_off+0x28>
40008228:	e5922000 	ldr	r2, [r2]
4000822c:	e3822008 	orr	r2, r2, #8
40008230:	e5832000 	str	r2, [r3]
40008234:	e28bd000 	add	sp, fp, #0
40008238:	e8bd0800 	pop	{fp}
4000823c:	e12fff1e 	bx	lr
40008240:	110002e4 	.word	0x110002e4

40008244 <uart_init>:
40008244:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008248:	e28db000 	add	fp, sp, #0
4000824c:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008250:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008254:	e5922000 	ldr	r2, [r2]
40008258:	e3c220ff 	bic	r2, r2, #255	; 0xff
4000825c:	e5832000 	str	r2, [r3]
40008260:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008264:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008268:	e5922000 	ldr	r2, [r2]
4000826c:	e3822022 	orr	r2, r2, #34	; 0x22
40008270:	e5832000 	str	r2, [r3]
40008274:	e3a0354e 	mov	r3, #327155712	; 0x13800000
40008278:	e3a02003 	mov	r2, #3
4000827c:	e5832000 	str	r2, [r3]
40008280:	e59f3028 	ldr	r3, [pc, #40]	; 400082b0 <uart_init+0x6c>
40008284:	e3a02005 	mov	r2, #5
40008288:	e5832000 	str	r2, [r3]
4000828c:	e59f3020 	ldr	r3, [pc, #32]	; 400082b4 <uart_init+0x70>
40008290:	e3a02035 	mov	r2, #53	; 0x35
40008294:	e5832000 	str	r2, [r3]
40008298:	e59f3018 	ldr	r3, [pc, #24]	; 400082b8 <uart_init+0x74>
4000829c:	e3a02004 	mov	r2, #4
400082a0:	e5832000 	str	r2, [r3]
400082a4:	e28bd000 	add	sp, fp, #0
400082a8:	e8bd0800 	pop	{fp}
400082ac:	e12fff1e 	bx	lr
400082b0:	13800004 	.word	0x13800004
400082b4:	13800028 	.word	0x13800028
400082b8:	1380002c 	.word	0x1380002c

400082bc <uart_send>:
400082bc:	e92d4800 	push	{fp, lr}
400082c0:	e28db004 	add	fp, sp, #4
400082c4:	e24dd008 	sub	sp, sp, #8
400082c8:	e1a03000 	mov	r3, r0
400082cc:	e54b3005 	strb	r3, [fp, #-5]
400082d0:	e1a00000 	nop			; (mov r0, r0)
400082d4:	e59f3034 	ldr	r3, [pc, #52]	; 40008310 <uart_send+0x54>
400082d8:	e5933000 	ldr	r3, [r3]
400082dc:	e2033002 	and	r3, r3, #2
400082e0:	e3530000 	cmp	r3, #0
400082e4:	0afffffa 	beq	400082d4 <uart_send+0x18>
400082e8:	e59f3024 	ldr	r3, [pc, #36]	; 40008314 <uart_send+0x58>
400082ec:	e55b2005 	ldrb	r2, [fp, #-5]
400082f0:	e5832000 	str	r2, [r3]
400082f4:	e55b3005 	ldrb	r3, [fp, #-5]
400082f8:	e353000a 	cmp	r3, #10
400082fc:	1a000001 	bne	40008308 <uart_send+0x4c>
40008300:	e3a0000d 	mov	r0, #13
40008304:	ebffffec 	bl	400082bc <uart_send>
40008308:	e24bd004 	sub	sp, fp, #4
4000830c:	e8bd8800 	pop	{fp, pc}
40008310:	13800010 	.word	0x13800010
40008314:	13800020 	.word	0x13800020

40008318 <puts_>:
40008318:	e92d4800 	push	{fp, lr}
4000831c:	e28db004 	add	fp, sp, #4
40008320:	e24dd008 	sub	sp, sp, #8
40008324:	e50b0008 	str	r0, [fp, #-8]
40008328:	ea000006 	b	40008348 <puts_+0x30>
4000832c:	e51b3008 	ldr	r3, [fp, #-8]
40008330:	e5d33000 	ldrb	r3, [r3]
40008334:	e1a00003 	mov	r0, r3
40008338:	ebffffdf 	bl	400082bc <uart_send>
4000833c:	e51b3008 	ldr	r3, [fp, #-8]
40008340:	e2833001 	add	r3, r3, #1
40008344:	e50b3008 	str	r3, [fp, #-8]
40008348:	e51b3008 	ldr	r3, [fp, #-8]
4000834c:	e5d33000 	ldrb	r3, [r3]
40008350:	e3530000 	cmp	r3, #0
40008354:	1afffff4 	bne	4000832c <puts_+0x14>
40008358:	e24bd004 	sub	sp, fp, #4
4000835c:	e8bd8800 	pop	{fp, pc}

40008360 <uart_rev>:
40008360:	e92d4800 	push	{fp, lr}
40008364:	e28db004 	add	fp, sp, #4
40008368:	e24dd008 	sub	sp, sp, #8
4000836c:	e1a00000 	nop			; (mov r0, r0)
40008370:	e59f3034 	ldr	r3, [pc, #52]	; 400083ac <uart_rev+0x4c>
40008374:	e5933000 	ldr	r3, [r3]
40008378:	e2033001 	and	r3, r3, #1
4000837c:	e3530000 	cmp	r3, #0
40008380:	0afffffa 	beq	40008370 <uart_rev+0x10>
40008384:	e59f3024 	ldr	r3, [pc, #36]	; 400083b0 <uart_rev+0x50>
40008388:	e5933000 	ldr	r3, [r3]
4000838c:	e54b3005 	strb	r3, [fp, #-5]
40008390:	e55b3005 	ldrb	r3, [fp, #-5]
40008394:	e1a00003 	mov	r0, r3
40008398:	ebffffc7 	bl	400082bc <uart_send>
4000839c:	e55b3005 	ldrb	r3, [fp, #-5]
400083a0:	e1a00003 	mov	r0, r3
400083a4:	e24bd004 	sub	sp, fp, #4
400083a8:	e8bd8800 	pop	{fp, pc}
400083ac:	13800010 	.word	0x13800010
400083b0:	13800024 	.word	0x13800024

400083b4 <itod>:
400083b4:	e92d4800 	push	{fp, lr}
400083b8:	e28db004 	add	fp, sp, #4
400083bc:	e24dd010 	sub	sp, sp, #16
400083c0:	e50b0010 	str	r0, [fp, #-16]
400083c4:	e50b1014 	str	r1, [fp, #-20]
400083c8:	e51b3010 	ldr	r3, [fp, #-16]
400083cc:	e3530009 	cmp	r3, #9
400083d0:	8a00000a 	bhi	40008400 <itod+0x4c>
400083d4:	e51b3010 	ldr	r3, [fp, #-16]
400083d8:	e6ef3073 	uxtb	r3, r3
400083dc:	e2833030 	add	r3, r3, #48	; 0x30
400083e0:	e6ef2073 	uxtb	r2, r3
400083e4:	e51b3014 	ldr	r3, [fp, #-20]
400083e8:	e5c32000 	strb	r2, [r3]
400083ec:	e51b3014 	ldr	r3, [fp, #-20]
400083f0:	e2833001 	add	r3, r3, #1
400083f4:	e3a02000 	mov	r2, #0
400083f8:	e5c32000 	strb	r2, [r3]
400083fc:	ea000028 	b	400084a4 <itod+0xf0>
40008400:	e51b2010 	ldr	r2, [fp, #-16]
40008404:	e59f30a0 	ldr	r3, [pc, #160]	; 400084ac <itod+0xf8>
40008408:	e0831293 	umull	r1, r3, r3, r2
4000840c:	e1a031a3 	lsr	r3, r3, #3
40008410:	e1a00003 	mov	r0, r3
40008414:	e51b1014 	ldr	r1, [fp, #-20]
40008418:	ebffffe5 	bl	400083b4 <itod>
4000841c:	e3a03000 	mov	r3, #0
40008420:	e50b3008 	str	r3, [fp, #-8]
40008424:	ea000002 	b	40008434 <itod+0x80>
40008428:	e51b3008 	ldr	r3, [fp, #-8]
4000842c:	e2833001 	add	r3, r3, #1
40008430:	e50b3008 	str	r3, [fp, #-8]
40008434:	e51b3008 	ldr	r3, [fp, #-8]
40008438:	e51b2014 	ldr	r2, [fp, #-20]
4000843c:	e0823003 	add	r3, r2, r3
40008440:	e5d33000 	ldrb	r3, [r3]
40008444:	e3530000 	cmp	r3, #0
40008448:	1afffff6 	bne	40008428 <itod+0x74>
4000844c:	e51b3008 	ldr	r3, [fp, #-8]
40008450:	e51b2014 	ldr	r2, [fp, #-20]
40008454:	e0820003 	add	r0, r2, r3
40008458:	e51b1010 	ldr	r1, [fp, #-16]
4000845c:	e59f3048 	ldr	r3, [pc, #72]	; 400084ac <itod+0xf8>
40008460:	e0832193 	umull	r2, r3, r3, r1
40008464:	e1a021a3 	lsr	r2, r3, #3
40008468:	e1a03002 	mov	r3, r2
4000846c:	e1a03103 	lsl	r3, r3, #2
40008470:	e0833002 	add	r3, r3, r2
40008474:	e1a03083 	lsl	r3, r3, #1
40008478:	e0632001 	rsb	r2, r3, r1
4000847c:	e6ef3072 	uxtb	r3, r2
40008480:	e2833030 	add	r3, r3, #48	; 0x30
40008484:	e6ef3073 	uxtb	r3, r3
40008488:	e5c03000 	strb	r3, [r0]
4000848c:	e51b3008 	ldr	r3, [fp, #-8]
40008490:	e2833001 	add	r3, r3, #1
40008494:	e51b2014 	ldr	r2, [fp, #-20]
40008498:	e0823003 	add	r3, r2, r3
4000849c:	e3a02000 	mov	r2, #0
400084a0:	e5c32000 	strb	r2, [r3]
400084a4:	e24bd004 	sub	sp, fp, #4
400084a8:	e8bd8800 	pop	{fp, pc}
400084ac:	cccccccd 	.word	0xcccccccd

400084b0 <itox>:
400084b0:	e92d4800 	push	{fp, lr}
400084b4:	e28db004 	add	fp, sp, #4
400084b8:	e24dd010 	sub	sp, sp, #16
400084bc:	e50b0010 	str	r0, [fp, #-16]
400084c0:	e50b1014 	str	r1, [fp, #-20]
400084c4:	e51b3010 	ldr	r3, [fp, #-16]
400084c8:	e353000f 	cmp	r3, #15
400084cc:	8a000014 	bhi	40008524 <itox+0x74>
400084d0:	e51b3010 	ldr	r3, [fp, #-16]
400084d4:	e3530009 	cmp	r3, #9
400084d8:	9a000006 	bls	400084f8 <itox+0x48>
400084dc:	e51b3010 	ldr	r3, [fp, #-16]
400084e0:	e6ef3073 	uxtb	r3, r3
400084e4:	e2833057 	add	r3, r3, #87	; 0x57
400084e8:	e6ef2073 	uxtb	r2, r3
400084ec:	e51b3014 	ldr	r3, [fp, #-20]
400084f0:	e5c32000 	strb	r2, [r3]
400084f4:	ea000005 	b	40008510 <itox+0x60>
400084f8:	e51b3010 	ldr	r3, [fp, #-16]
400084fc:	e6ef3073 	uxtb	r3, r3
40008500:	e2833030 	add	r3, r3, #48	; 0x30
40008504:	e6ef2073 	uxtb	r2, r3
40008508:	e51b3014 	ldr	r3, [fp, #-20]
4000850c:	e5c32000 	strb	r2, [r3]
40008510:	e51b3014 	ldr	r3, [fp, #-20]
40008514:	e2833001 	add	r3, r3, #1
40008518:	e3a02000 	mov	r2, #0
4000851c:	e5c32000 	strb	r2, [r3]
40008520:	ea00002f 	b	400085e4 <itox+0x134>
40008524:	e51b3010 	ldr	r3, [fp, #-16]
40008528:	e1a03223 	lsr	r3, r3, #4
4000852c:	e1a00003 	mov	r0, r3
40008530:	e51b1014 	ldr	r1, [fp, #-20]
40008534:	ebffffdd 	bl	400084b0 <itox>
40008538:	e3a03000 	mov	r3, #0
4000853c:	e50b3008 	str	r3, [fp, #-8]
40008540:	ea000002 	b	40008550 <itox+0xa0>
40008544:	e51b3008 	ldr	r3, [fp, #-8]
40008548:	e2833001 	add	r3, r3, #1
4000854c:	e50b3008 	str	r3, [fp, #-8]
40008550:	e51b3008 	ldr	r3, [fp, #-8]
40008554:	e51b2014 	ldr	r2, [fp, #-20]
40008558:	e0823003 	add	r3, r2, r3
4000855c:	e5d33000 	ldrb	r3, [r3]
40008560:	e3530000 	cmp	r3, #0
40008564:	1afffff6 	bne	40008544 <itox+0x94>
40008568:	e51b3010 	ldr	r3, [fp, #-16]
4000856c:	e203300f 	and	r3, r3, #15
40008570:	e3530009 	cmp	r3, #9
40008574:	9a00000a 	bls	400085a4 <itox+0xf4>
40008578:	e51b3008 	ldr	r3, [fp, #-8]
4000857c:	e51b2014 	ldr	r2, [fp, #-20]
40008580:	e0823003 	add	r3, r2, r3
40008584:	e51b2010 	ldr	r2, [fp, #-16]
40008588:	e6ef2072 	uxtb	r2, r2
4000858c:	e202200f 	and	r2, r2, #15
40008590:	e6ef2072 	uxtb	r2, r2
40008594:	e2822057 	add	r2, r2, #87	; 0x57
40008598:	e6ef2072 	uxtb	r2, r2
4000859c:	e5c32000 	strb	r2, [r3]
400085a0:	ea000009 	b	400085cc <itox+0x11c>
400085a4:	e51b3008 	ldr	r3, [fp, #-8]
400085a8:	e51b2014 	ldr	r2, [fp, #-20]
400085ac:	e0823003 	add	r3, r2, r3
400085b0:	e51b2010 	ldr	r2, [fp, #-16]
400085b4:	e6ef2072 	uxtb	r2, r2
400085b8:	e202200f 	and	r2, r2, #15
400085bc:	e6ef2072 	uxtb	r2, r2
400085c0:	e2822030 	add	r2, r2, #48	; 0x30
400085c4:	e6ef2072 	uxtb	r2, r2
400085c8:	e5c32000 	strb	r2, [r3]
400085cc:	e51b3008 	ldr	r3, [fp, #-8]
400085d0:	e2833001 	add	r3, r3, #1
400085d4:	e51b2014 	ldr	r2, [fp, #-20]
400085d8:	e0823003 	add	r3, r2, r3
400085dc:	e3a02000 	mov	r2, #0
400085e0:	e5c32000 	strb	r2, [r3]
400085e4:	e24bd004 	sub	sp, fp, #4
400085e8:	e8bd8800 	pop	{fp, pc}

400085ec <uprintf>:
400085ec:	e92d000f 	push	{r0, r1, r2, r3}
400085f0:	e92d4800 	push	{fp, lr}
400085f4:	e28db004 	add	fp, sp, #4
400085f8:	e24dd028 	sub	sp, sp, #40	; 0x28
400085fc:	e28b3004 	add	r3, fp, #4
40008600:	e2833004 	add	r3, r3, #4
40008604:	e50b300c 	str	r3, [fp, #-12]
40008608:	ea00006a 	b	400087b8 <uprintf+0x1cc>
4000860c:	e59b3004 	ldr	r3, [fp, #4]
40008610:	e5d33000 	ldrb	r3, [r3]
40008614:	e3530025 	cmp	r3, #37	; 0x25
40008618:	0a000004 	beq	40008630 <uprintf+0x44>
4000861c:	e59b3004 	ldr	r3, [fp, #4]
40008620:	e5d33000 	ldrb	r3, [r3]
40008624:	e1a00003 	mov	r0, r3
40008628:	ebffff23 	bl	400082bc <uart_send>
4000862c:	ea00005e 	b	400087ac <uprintf+0x1c0>
40008630:	e59b3004 	ldr	r3, [fp, #4]
40008634:	e2833001 	add	r3, r3, #1
40008638:	e58b3004 	str	r3, [fp, #4]
4000863c:	e59b3004 	ldr	r3, [fp, #4]
40008640:	e5d33000 	ldrb	r3, [r3]
40008644:	e2433063 	sub	r3, r3, #99	; 0x63
40008648:	e3530015 	cmp	r3, #21
4000864c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
40008650:	ea000054 	b	400087a8 <uprintf+0x1bc>
40008654:	400086ac 	.word	0x400086ac
40008658:	40008700 	.word	0x40008700
4000865c:	400087a8 	.word	0x400087a8
40008660:	400087a8 	.word	0x400087a8
40008664:	400087a8 	.word	0x400087a8
40008668:	400087a8 	.word	0x400087a8
4000866c:	400087a8 	.word	0x400087a8
40008670:	400087a8 	.word	0x400087a8
40008674:	400087a8 	.word	0x400087a8
40008678:	400087a8 	.word	0x400087a8
4000867c:	400087a8 	.word	0x400087a8
40008680:	400087a8 	.word	0x400087a8
40008684:	400087a8 	.word	0x400087a8
40008688:	400087a8 	.word	0x400087a8
4000868c:	400087a8 	.word	0x400087a8
40008690:	400087a8 	.word	0x400087a8
40008694:	400086d8 	.word	0x400086d8
40008698:	400087a8 	.word	0x400087a8
4000869c:	400087a8 	.word	0x400087a8
400086a0:	400087a8 	.word	0x400087a8
400086a4:	400087a8 	.word	0x400087a8
400086a8:	40008764 	.word	0x40008764
400086ac:	e51b300c 	ldr	r3, [fp, #-12]
400086b0:	e5933000 	ldr	r3, [r3]
400086b4:	e50b3010 	str	r3, [fp, #-16]
400086b8:	e51b300c 	ldr	r3, [fp, #-12]
400086bc:	e2833004 	add	r3, r3, #4
400086c0:	e50b300c 	str	r3, [fp, #-12]
400086c4:	e51b3010 	ldr	r3, [fp, #-16]
400086c8:	e6ef3073 	uxtb	r3, r3
400086cc:	e1a00003 	mov	r0, r3
400086d0:	ebfffef9 	bl	400082bc <uart_send>
400086d4:	ea000034 	b	400087ac <uprintf+0x1c0>
400086d8:	e51b300c 	ldr	r3, [fp, #-12]
400086dc:	e5933000 	ldr	r3, [r3]
400086e0:	e50b3014 	str	r3, [fp, #-20]
400086e4:	e51b300c 	ldr	r3, [fp, #-12]
400086e8:	e2833004 	add	r3, r3, #4
400086ec:	e50b300c 	str	r3, [fp, #-12]
400086f0:	e51b3014 	ldr	r3, [fp, #-20]
400086f4:	e1a00003 	mov	r0, r3
400086f8:	ebffff06 	bl	40008318 <puts_>
400086fc:	ea00002a 	b	400087ac <uprintf+0x1c0>
40008700:	e51b300c 	ldr	r3, [fp, #-12]
40008704:	e5933000 	ldr	r3, [r3]
40008708:	e50b3018 	str	r3, [fp, #-24]
4000870c:	e51b300c 	ldr	r3, [fp, #-12]
40008710:	e2833004 	add	r3, r3, #4
40008714:	e50b300c 	str	r3, [fp, #-12]
40008718:	e51b3018 	ldr	r3, [fp, #-24]
4000871c:	e50b3008 	str	r3, [fp, #-8]
40008720:	e51b3008 	ldr	r3, [fp, #-8]
40008724:	e3530000 	cmp	r3, #0
40008728:	aa000004 	bge	40008740 <uprintf+0x154>
4000872c:	e3a0002d 	mov	r0, #45	; 0x2d
40008730:	ebfffee1 	bl	400082bc <uart_send>
40008734:	e51b3008 	ldr	r3, [fp, #-8]
40008738:	e2633000 	rsb	r3, r3, #0
4000873c:	e50b3008 	str	r3, [fp, #-8]
40008740:	e51b2008 	ldr	r2, [fp, #-8]
40008744:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008748:	e1a00002 	mov	r0, r2
4000874c:	e1a01003 	mov	r1, r3
40008750:	ebffff17 	bl	400083b4 <itod>
40008754:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008758:	e1a00003 	mov	r0, r3
4000875c:	ebfffeed 	bl	40008318 <puts_>
40008760:	ea000011 	b	400087ac <uprintf+0x1c0>
40008764:	e51b300c 	ldr	r3, [fp, #-12]
40008768:	e5933000 	ldr	r3, [r3]
4000876c:	e50b301c 	str	r3, [fp, #-28]
40008770:	e51b300c 	ldr	r3, [fp, #-12]
40008774:	e2833004 	add	r3, r3, #4
40008778:	e50b300c 	str	r3, [fp, #-12]
4000877c:	e51b301c 	ldr	r3, [fp, #-28]
40008780:	e50b3008 	str	r3, [fp, #-8]
40008784:	e51b2008 	ldr	r2, [fp, #-8]
40008788:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000878c:	e1a00002 	mov	r0, r2
40008790:	e1a01003 	mov	r1, r3
40008794:	ebffff45 	bl	400084b0 <itox>
40008798:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000879c:	e1a00003 	mov	r0, r3
400087a0:	ebfffedc 	bl	40008318 <puts_>
400087a4:	ea000000 	b	400087ac <uprintf+0x1c0>
400087a8:	e1a00000 	nop			; (mov r0, r0)
400087ac:	e59b3004 	ldr	r3, [fp, #4]
400087b0:	e2833001 	add	r3, r3, #1
400087b4:	e58b3004 	str	r3, [fp, #4]
400087b8:	e59b3004 	ldr	r3, [fp, #4]
400087bc:	e5d33000 	ldrb	r3, [r3]
400087c0:	e3530000 	cmp	r3, #0
400087c4:	1affff90 	bne	4000860c <uprintf+0x20>
400087c8:	e3a03000 	mov	r3, #0
400087cc:	e50b300c 	str	r3, [fp, #-12]
400087d0:	e3a03000 	mov	r3, #0
400087d4:	e1a00003 	mov	r0, r3
400087d8:	e24bd004 	sub	sp, fp, #4
400087dc:	e8bd4800 	pop	{fp, lr}
400087e0:	e28dd010 	add	sp, sp, #16
400087e4:	e12fff1e 	bx	lr

400087e8 <pwm0_init>:
400087e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400087ec:	e28db000 	add	fp, sp, #0
400087f0:	e59f30d8 	ldr	r3, [pc, #216]	; 400088d0 <pwm0_init+0xe8>
400087f4:	e59f20d4 	ldr	r2, [pc, #212]	; 400088d0 <pwm0_init+0xe8>
400087f8:	e5922000 	ldr	r2, [r2]
400087fc:	e3c2200f 	bic	r2, r2, #15
40008800:	e5832000 	str	r2, [r3]
40008804:	e59f30c4 	ldr	r3, [pc, #196]	; 400088d0 <pwm0_init+0xe8>
40008808:	e59f20c0 	ldr	r2, [pc, #192]	; 400088d0 <pwm0_init+0xe8>
4000880c:	e5922000 	ldr	r2, [r2]
40008810:	e3822002 	orr	r2, r2, #2
40008814:	e5832000 	str	r2, [r3]
40008818:	e59f30b4 	ldr	r3, [pc, #180]	; 400088d4 <pwm0_init+0xec>
4000881c:	e59f20b0 	ldr	r2, [pc, #176]	; 400088d4 <pwm0_init+0xec>
40008820:	e5922000 	ldr	r2, [r2]
40008824:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008828:	e5832000 	str	r2, [r3]
4000882c:	e59f30a0 	ldr	r3, [pc, #160]	; 400088d4 <pwm0_init+0xec>
40008830:	e59f209c 	ldr	r2, [pc, #156]	; 400088d4 <pwm0_init+0xec>
40008834:	e5922000 	ldr	r2, [r2]
40008838:	e3822031 	orr	r2, r2, #49	; 0x31
4000883c:	e5832000 	str	r2, [r3]
40008840:	e59f3090 	ldr	r3, [pc, #144]	; 400088d8 <pwm0_init+0xf0>
40008844:	e59f208c 	ldr	r2, [pc, #140]	; 400088d8 <pwm0_init+0xf0>
40008848:	e5922000 	ldr	r2, [r2]
4000884c:	e3c2200f 	bic	r2, r2, #15
40008850:	e5832000 	str	r2, [r3]
40008854:	e59f307c 	ldr	r3, [pc, #124]	; 400088d8 <pwm0_init+0xf0>
40008858:	e59f2078 	ldr	r2, [pc, #120]	; 400088d8 <pwm0_init+0xf0>
4000885c:	e5922000 	ldr	r2, [r2]
40008860:	e3822001 	orr	r2, r2, #1
40008864:	e5832000 	str	r2, [r3]
40008868:	e59f306c 	ldr	r3, [pc, #108]	; 400088dc <pwm0_init+0xf4>
4000886c:	e3a02ffa 	mov	r2, #1000	; 0x3e8
40008870:	e5832000 	str	r2, [r3]
40008874:	e59f3064 	ldr	r3, [pc, #100]	; 400088e0 <pwm0_init+0xf8>
40008878:	e59f205c 	ldr	r2, [pc, #92]	; 400088dc <pwm0_init+0xf4>
4000887c:	e5922000 	ldr	r2, [r2]
40008880:	e1a020a2 	lsr	r2, r2, #1
40008884:	e5832000 	str	r2, [r3]
40008888:	e59f3054 	ldr	r3, [pc, #84]	; 400088e4 <pwm0_init+0xfc>
4000888c:	e59f2050 	ldr	r2, [pc, #80]	; 400088e4 <pwm0_init+0xfc>
40008890:	e5922000 	ldr	r2, [r2]
40008894:	e3822002 	orr	r2, r2, #2
40008898:	e5832000 	str	r2, [r3]
4000889c:	e59f3040 	ldr	r3, [pc, #64]	; 400088e4 <pwm0_init+0xfc>
400088a0:	e59f203c 	ldr	r2, [pc, #60]	; 400088e4 <pwm0_init+0xfc>
400088a4:	e5922000 	ldr	r2, [r2]
400088a8:	e3c22002 	bic	r2, r2, #2
400088ac:	e5832000 	str	r2, [r3]
400088b0:	e59f302c 	ldr	r3, [pc, #44]	; 400088e4 <pwm0_init+0xfc>
400088b4:	e59f2028 	ldr	r2, [pc, #40]	; 400088e4 <pwm0_init+0xfc>
400088b8:	e5922000 	ldr	r2, [r2]
400088bc:	e3822009 	orr	r2, r2, #9
400088c0:	e5832000 	str	r2, [r3]
400088c4:	e28bd000 	add	sp, fp, #0
400088c8:	e8bd0800 	pop	{fp}
400088cc:	e12fff1e 	bx	lr
400088d0:	114000a0 	.word	0x114000a0
400088d4:	139d0000 	.word	0x139d0000
400088d8:	139d0004 	.word	0x139d0004
400088dc:	139d000c 	.word	0x139d000c
400088e0:	139d0010 	.word	0x139d0010
400088e4:	139d0008 	.word	0x139d0008

400088e8 <do_timer>:
400088e8:	e92d4800 	push	{fp, lr}
400088ec:	e28db004 	add	fp, sp, #4
400088f0:	e59f3018 	ldr	r3, [pc, #24]	; 40008910 <do_timer+0x28>
400088f4:	e59f2014 	ldr	r2, [pc, #20]	; 40008910 <do_timer+0x28>
400088f8:	e5922000 	ldr	r2, [r2]
400088fc:	e3822020 	orr	r2, r2, #32
40008900:	e5832000 	str	r2, [r3]
40008904:	e59f0008 	ldr	r0, [pc, #8]	; 40008914 <do_timer+0x2c>
40008908:	ebffff37 	bl	400085ec <uprintf>
4000890c:	e8bd8800 	pop	{fp, pc}
40008910:	139d0044 	.word	0x139d0044
40008914:	40008dd0 	.word	0x40008dd0

40008918 <timer_init>:
40008918:	e92d4800 	push	{fp, lr}
4000891c:	e28db004 	add	fp, sp, #4
40008920:	e59f30b8 	ldr	r3, [pc, #184]	; 400089e0 <timer_init+0xc8>
40008924:	e59f20b4 	ldr	r2, [pc, #180]	; 400089e0 <timer_init+0xc8>
40008928:	e5922000 	ldr	r2, [r2]
4000892c:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008930:	e5832000 	str	r2, [r3]
40008934:	e59f30a4 	ldr	r3, [pc, #164]	; 400089e0 <timer_init+0xc8>
40008938:	e59f20a0 	ldr	r2, [pc, #160]	; 400089e0 <timer_init+0xc8>
4000893c:	e5922000 	ldr	r2, [r2]
40008940:	e3822031 	orr	r2, r2, #49	; 0x31
40008944:	e5832000 	str	r2, [r3]
40008948:	e59f3094 	ldr	r3, [pc, #148]	; 400089e4 <timer_init+0xcc>
4000894c:	e59f2090 	ldr	r2, [pc, #144]	; 400089e4 <timer_init+0xcc>
40008950:	e5922000 	ldr	r2, [r2]
40008954:	e3c2200f 	bic	r2, r2, #15
40008958:	e5832000 	str	r2, [r3]
4000895c:	e59f3080 	ldr	r3, [pc, #128]	; 400089e4 <timer_init+0xcc>
40008960:	e59f207c 	ldr	r2, [pc, #124]	; 400089e4 <timer_init+0xcc>
40008964:	e5922000 	ldr	r2, [r2]
40008968:	e3822001 	orr	r2, r2, #1
4000896c:	e5832000 	str	r2, [r3]
40008970:	e59f3070 	ldr	r3, [pc, #112]	; 400089e8 <timer_init+0xd0>
40008974:	e59f2070 	ldr	r2, [pc, #112]	; 400089ec <timer_init+0xd4>
40008978:	e5832000 	str	r2, [r3]
4000897c:	e59f306c 	ldr	r3, [pc, #108]	; 400089f0 <timer_init+0xd8>
40008980:	e59f2068 	ldr	r2, [pc, #104]	; 400089f0 <timer_init+0xd8>
40008984:	e5922000 	ldr	r2, [r2]
40008988:	e3822002 	orr	r2, r2, #2
4000898c:	e5832000 	str	r2, [r3]
40008990:	e59f3058 	ldr	r3, [pc, #88]	; 400089f0 <timer_init+0xd8>
40008994:	e59f2054 	ldr	r2, [pc, #84]	; 400089f0 <timer_init+0xd8>
40008998:	e5922000 	ldr	r2, [r2]
4000899c:	e3c22002 	bic	r2, r2, #2
400089a0:	e5832000 	str	r2, [r3]
400089a4:	e59f3048 	ldr	r3, [pc, #72]	; 400089f4 <timer_init+0xdc>
400089a8:	e59f2044 	ldr	r2, [pc, #68]	; 400089f4 <timer_init+0xdc>
400089ac:	e5922000 	ldr	r2, [r2]
400089b0:	e3822001 	orr	r2, r2, #1
400089b4:	e5832000 	str	r2, [r3]
400089b8:	e59f3030 	ldr	r3, [pc, #48]	; 400089f0 <timer_init+0xd8>
400089bc:	e59f202c 	ldr	r2, [pc, #44]	; 400089f0 <timer_init+0xd8>
400089c0:	e5922000 	ldr	r2, [r2]
400089c4:	e3822009 	orr	r2, r2, #9
400089c8:	e5832000 	str	r2, [r3]
400089cc:	e3a00045 	mov	r0, #69	; 0x45
400089d0:	e3a01013 	mov	r1, #19
400089d4:	e59f201c 	ldr	r2, [pc, #28]	; 400089f8 <timer_init+0xe0>
400089d8:	eb000068 	bl	40008b80 <request_irq>
400089dc:	e8bd8800 	pop	{fp, pc}
400089e0:	139d0000 	.word	0x139d0000
400089e4:	139d0004 	.word	0x139d0004
400089e8:	139d000c 	.word	0x139d000c
400089ec:	001e8480 	.word	0x001e8480
400089f0:	139d0008 	.word	0x139d0008
400089f4:	139d0044 	.word	0x139d0044
400089f8:	400088e8 	.word	0x400088e8

400089fc <do_eint>:
400089fc:	e92d4800 	push	{fp, lr}
40008a00:	e28db004 	add	fp, sp, #4
40008a04:	e59f302c 	ldr	r3, [pc, #44]	; 40008a38 <do_eint+0x3c>
40008a08:	e5933000 	ldr	r3, [r3]
40008a0c:	e2033004 	and	r3, r3, #4
40008a10:	e3530000 	cmp	r3, #0
40008a14:	0a000006 	beq	40008a34 <do_eint+0x38>
40008a18:	e59f001c 	ldr	r0, [pc, #28]	; 40008a3c <do_eint+0x40>
40008a1c:	ebfffef2 	bl	400085ec <uprintf>
40008a20:	e59f3010 	ldr	r3, [pc, #16]	; 40008a38 <do_eint+0x3c>
40008a24:	e59f200c 	ldr	r2, [pc, #12]	; 40008a38 <do_eint+0x3c>
40008a28:	e5922000 	ldr	r2, [r2]
40008a2c:	e3822004 	orr	r2, r2, #4
40008a30:	e5832000 	str	r2, [r3]
40008a34:	e8bd8800 	pop	{fp, pc}
40008a38:	11000f4c 	.word	0x11000f4c
40008a3c:	40008de4 	.word	0x40008de4

40008a40 <eint_init>:
40008a40:	e92d4800 	push	{fp, lr}
40008a44:	e28db004 	add	fp, sp, #4
40008a48:	e59f3070 	ldr	r3, [pc, #112]	; 40008ac0 <eint_init+0x80>
40008a4c:	e59f206c 	ldr	r2, [pc, #108]	; 40008ac0 <eint_init+0x80>
40008a50:	e5922000 	ldr	r2, [r2]
40008a54:	e3822c0f 	orr	r2, r2, #3840	; 0xf00
40008a58:	e5832000 	str	r2, [r3]
40008a5c:	e59f3060 	ldr	r3, [pc, #96]	; 40008ac4 <eint_init+0x84>
40008a60:	e59f205c 	ldr	r2, [pc, #92]	; 40008ac4 <eint_init+0x84>
40008a64:	e5922000 	ldr	r2, [r2]
40008a68:	e3c22c07 	bic	r2, r2, #1792	; 0x700
40008a6c:	e5832000 	str	r2, [r3]
40008a70:	e59f304c 	ldr	r3, [pc, #76]	; 40008ac4 <eint_init+0x84>
40008a74:	e59f2048 	ldr	r2, [pc, #72]	; 40008ac4 <eint_init+0x84>
40008a78:	e5922000 	ldr	r2, [r2]
40008a7c:	e3822c02 	orr	r2, r2, #512	; 0x200
40008a80:	e5832000 	str	r2, [r3]
40008a84:	e59f303c 	ldr	r3, [pc, #60]	; 40008ac8 <eint_init+0x88>
40008a88:	e59f2038 	ldr	r2, [pc, #56]	; 40008ac8 <eint_init+0x88>
40008a8c:	e5922000 	ldr	r2, [r2]
40008a90:	e3822503 	orr	r2, r2, #12582912	; 0xc00000
40008a94:	e5832000 	str	r2, [r3]
40008a98:	e59f302c 	ldr	r3, [pc, #44]	; 40008acc <eint_init+0x8c>
40008a9c:	e59f2028 	ldr	r2, [pc, #40]	; 40008acc <eint_init+0x8c>
40008aa0:	e5922000 	ldr	r2, [r2]
40008aa4:	e3c22004 	bic	r2, r2, #4
40008aa8:	e5832000 	str	r2, [r3]
40008aac:	e3a00040 	mov	r0, #64	; 0x40
40008ab0:	e3a01012 	mov	r1, #18
40008ab4:	e59f2014 	ldr	r2, [pc, #20]	; 40008ad0 <eint_init+0x90>
40008ab8:	eb000030 	bl	40008b80 <request_irq>
40008abc:	e8bd8800 	pop	{fp, pc}
40008ac0:	11000c60 	.word	0x11000c60
40008ac4:	11000e0c 	.word	0x11000e0c
40008ac8:	11000e98 	.word	0x11000e98
40008acc:	11000f0c 	.word	0x11000f0c
40008ad0:	400089fc 	.word	0x400089fc

40008ad4 <do_irq>:
40008ad4:	e92d4800 	push	{fp, lr}
40008ad8:	e28db004 	add	fp, sp, #4
40008adc:	e24dd008 	sub	sp, sp, #8
40008ae0:	e59f3044 	ldr	r3, [pc, #68]	; 40008b2c <do_irq+0x58>
40008ae4:	e5933000 	ldr	r3, [r3]
40008ae8:	e1a03b03 	lsl	r3, r3, #22
40008aec:	e1a03b23 	lsr	r3, r3, #22
40008af0:	e50b3008 	str	r3, [fp, #-8]
40008af4:	e59f3034 	ldr	r3, [pc, #52]	; 40008b30 <do_irq+0x5c>
40008af8:	e51b2008 	ldr	r2, [fp, #-8]
40008afc:	e5832000 	str	r2, [r3]
40008b00:	e59f002c 	ldr	r0, [pc, #44]	; 40008b34 <do_irq+0x60>
40008b04:	e51b1008 	ldr	r1, [fp, #-8]
40008b08:	ebfffeb7 	bl	400085ec <uprintf>
40008b0c:	e59f3024 	ldr	r3, [pc, #36]	; 40008b38 <do_irq+0x64>
40008b10:	e51b2008 	ldr	r2, [fp, #-8]
40008b14:	e7933102 	ldr	r3, [r3, r2, lsl #2]
40008b18:	e50b300c 	str	r3, [fp, #-12]
40008b1c:	e51b300c 	ldr	r3, [fp, #-12]
40008b20:	e12fff33 	blx	r3
40008b24:	e24bd004 	sub	sp, fp, #4
40008b28:	e8bd8800 	pop	{fp, pc}
40008b2c:	1048000c 	.word	0x1048000c
40008b30:	10480010 	.word	0x10480010
40008b34:	40008dfc 	.word	0x40008dfc
40008b38:	40008e10 	.word	0x40008e10

40008b3c <gic_init>:
40008b3c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008b40:	e28db000 	add	fp, sp, #0
40008b44:	e59f3028 	ldr	r3, [pc, #40]	; 40008b74 <gic_init+0x38>
40008b48:	e3a02001 	mov	r2, #1
40008b4c:	e5832000 	str	r2, [r3]
40008b50:	e59f3020 	ldr	r3, [pc, #32]	; 40008b78 <gic_init+0x3c>
40008b54:	e3a02001 	mov	r2, #1
40008b58:	e5832000 	str	r2, [r3]
40008b5c:	e59f3018 	ldr	r3, [pc, #24]	; 40008b7c <gic_init+0x40>
40008b60:	e3a020ff 	mov	r2, #255	; 0xff
40008b64:	e5832000 	str	r2, [r3]
40008b68:	e28bd000 	add	sp, fp, #0
40008b6c:	e8bd0800 	pop	{fp}
40008b70:	e12fff1e 	bx	lr
40008b74:	10490000 	.word	0x10490000
40008b78:	10480000 	.word	0x10480000
40008b7c:	10480004 	.word	0x10480004

40008b80 <request_irq>:
40008b80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008b84:	e28db000 	add	fp, sp, #0
40008b88:	e24dd014 	sub	sp, sp, #20
40008b8c:	e50b0008 	str	r0, [fp, #-8]
40008b90:	e1a03001 	mov	r3, r1
40008b94:	e50b2010 	str	r2, [fp, #-16]
40008b98:	e54b3009 	strb	r3, [fp, #-9]
40008b9c:	e51b3008 	ldr	r3, [fp, #-8]
40008ba0:	e283201f 	add	r2, r3, #31
40008ba4:	e3530000 	cmp	r3, #0
40008ba8:	b1a03002 	movlt	r3, r2
40008bac:	e1a032c3 	asr	r3, r3, #5
40008bb0:	e1a02003 	mov	r2, r3
40008bb4:	e1a03002 	mov	r3, r2
40008bb8:	e1a01103 	lsl	r1, r3, #2
40008bbc:	e59f31ec 	ldr	r3, [pc, #492]	; 40008db0 <request_irq+0x230>
40008bc0:	e0813003 	add	r3, r1, r3
40008bc4:	e1a01102 	lsl	r1, r2, #2
40008bc8:	e59f21e0 	ldr	r2, [pc, #480]	; 40008db0 <request_irq+0x230>
40008bcc:	e0812002 	add	r2, r1, r2
40008bd0:	e5920000 	ldr	r0, [r2]
40008bd4:	e51b1008 	ldr	r1, [fp, #-8]
40008bd8:	e1a02fc1 	asr	r2, r1, #31
40008bdc:	e1a02da2 	lsr	r2, r2, #27
40008be0:	e0811002 	add	r1, r1, r2
40008be4:	e201101f 	and	r1, r1, #31
40008be8:	e0622001 	rsb	r2, r2, r1
40008bec:	e3a01001 	mov	r1, #1
40008bf0:	e1a02211 	lsl	r2, r1, r2
40008bf4:	e1802002 	orr	r2, r0, r2
40008bf8:	e5832000 	str	r2, [r3]
40008bfc:	e51b3008 	ldr	r3, [fp, #-8]
40008c00:	e2832003 	add	r2, r3, #3
40008c04:	e3530000 	cmp	r3, #0
40008c08:	b1a03002 	movlt	r3, r2
40008c0c:	e1a03143 	asr	r3, r3, #2
40008c10:	e1a02003 	mov	r2, r3
40008c14:	e1a03002 	mov	r3, r2
40008c18:	e1a01103 	lsl	r1, r3, #2
40008c1c:	e59f3190 	ldr	r3, [pc, #400]	; 40008db4 <request_irq+0x234>
40008c20:	e0813003 	add	r3, r1, r3
40008c24:	e1a01102 	lsl	r1, r2, #2
40008c28:	e59f2184 	ldr	r2, [pc, #388]	; 40008db4 <request_irq+0x234>
40008c2c:	e0812002 	add	r2, r1, r2
40008c30:	e5920000 	ldr	r0, [r2]
40008c34:	e51b1008 	ldr	r1, [fp, #-8]
40008c38:	e1a02fc1 	asr	r2, r1, #31
40008c3c:	e1a02f22 	lsr	r2, r2, #30
40008c40:	e0811002 	add	r1, r1, r2
40008c44:	e2011003 	and	r1, r1, #3
40008c48:	e0622001 	rsb	r2, r2, r1
40008c4c:	e1a02182 	lsl	r2, r2, #3
40008c50:	e3a010ff 	mov	r1, #255	; 0xff
40008c54:	e1a02211 	lsl	r2, r1, r2
40008c58:	e1e02002 	mvn	r2, r2
40008c5c:	e0002002 	and	r2, r0, r2
40008c60:	e5832000 	str	r2, [r3]
40008c64:	e51b3008 	ldr	r3, [fp, #-8]
40008c68:	e2832003 	add	r2, r3, #3
40008c6c:	e3530000 	cmp	r3, #0
40008c70:	b1a03002 	movlt	r3, r2
40008c74:	e1a03143 	asr	r3, r3, #2
40008c78:	e1a02003 	mov	r2, r3
40008c7c:	e1a03002 	mov	r3, r2
40008c80:	e1a01103 	lsl	r1, r3, #2
40008c84:	e59f3128 	ldr	r3, [pc, #296]	; 40008db4 <request_irq+0x234>
40008c88:	e0813003 	add	r3, r1, r3
40008c8c:	e1a01102 	lsl	r1, r2, #2
40008c90:	e59f211c 	ldr	r2, [pc, #284]	; 40008db4 <request_irq+0x234>
40008c94:	e0812002 	add	r2, r1, r2
40008c98:	e5920000 	ldr	r0, [r2]
40008c9c:	e55bc009 	ldrb	ip, [fp, #-9]
40008ca0:	e51b1008 	ldr	r1, [fp, #-8]
40008ca4:	e1a02fc1 	asr	r2, r1, #31
40008ca8:	e1a02f22 	lsr	r2, r2, #30
40008cac:	e0811002 	add	r1, r1, r2
40008cb0:	e2011003 	and	r1, r1, #3
40008cb4:	e0622001 	rsb	r2, r2, r1
40008cb8:	e1a02182 	lsl	r2, r2, #3
40008cbc:	e1a0221c 	lsl	r2, ip, r2
40008cc0:	e1802002 	orr	r2, r0, r2
40008cc4:	e5832000 	str	r2, [r3]
40008cc8:	e51b3008 	ldr	r3, [fp, #-8]
40008ccc:	e2832003 	add	r2, r3, #3
40008cd0:	e3530000 	cmp	r3, #0
40008cd4:	b1a03002 	movlt	r3, r2
40008cd8:	e1a03143 	asr	r3, r3, #2
40008cdc:	e1a02003 	mov	r2, r3
40008ce0:	e1a03002 	mov	r3, r2
40008ce4:	e1a01103 	lsl	r1, r3, #2
40008ce8:	e59f30c8 	ldr	r3, [pc, #200]	; 40008db8 <request_irq+0x238>
40008cec:	e0813003 	add	r3, r1, r3
40008cf0:	e1a01102 	lsl	r1, r2, #2
40008cf4:	e59f20bc 	ldr	r2, [pc, #188]	; 40008db8 <request_irq+0x238>
40008cf8:	e0812002 	add	r2, r1, r2
40008cfc:	e5920000 	ldr	r0, [r2]
40008d00:	e51b1008 	ldr	r1, [fp, #-8]
40008d04:	e1a02fc1 	asr	r2, r1, #31
40008d08:	e1a02f22 	lsr	r2, r2, #30
40008d0c:	e0811002 	add	r1, r1, r2
40008d10:	e2011003 	and	r1, r1, #3
40008d14:	e0622001 	rsb	r2, r2, r1
40008d18:	e1a02182 	lsl	r2, r2, #3
40008d1c:	e3a010ff 	mov	r1, #255	; 0xff
40008d20:	e1a02211 	lsl	r2, r1, r2
40008d24:	e1e02002 	mvn	r2, r2
40008d28:	e0002002 	and	r2, r0, r2
40008d2c:	e5832000 	str	r2, [r3]
40008d30:	e51b3008 	ldr	r3, [fp, #-8]
40008d34:	e2832003 	add	r2, r3, #3
40008d38:	e3530000 	cmp	r3, #0
40008d3c:	b1a03002 	movlt	r3, r2
40008d40:	e1a03143 	asr	r3, r3, #2
40008d44:	e1a02003 	mov	r2, r3
40008d48:	e1a03002 	mov	r3, r2
40008d4c:	e1a01103 	lsl	r1, r3, #2
40008d50:	e59f3060 	ldr	r3, [pc, #96]	; 40008db8 <request_irq+0x238>
40008d54:	e0813003 	add	r3, r1, r3
40008d58:	e1a01102 	lsl	r1, r2, #2
40008d5c:	e59f2054 	ldr	r2, [pc, #84]	; 40008db8 <request_irq+0x238>
40008d60:	e0812002 	add	r2, r1, r2
40008d64:	e5920000 	ldr	r0, [r2]
40008d68:	e51b1008 	ldr	r1, [fp, #-8]
40008d6c:	e1a02fc1 	asr	r2, r1, #31
40008d70:	e1a02f22 	lsr	r2, r2, #30
40008d74:	e0811002 	add	r1, r1, r2
40008d78:	e2011003 	and	r1, r1, #3
40008d7c:	e0622001 	rsb	r2, r2, r1
40008d80:	e1a02182 	lsl	r2, r2, #3
40008d84:	e3a01001 	mov	r1, #1
40008d88:	e1a02211 	lsl	r2, r1, r2
40008d8c:	e1802002 	orr	r2, r0, r2
40008d90:	e5832000 	str	r2, [r3]
40008d94:	e59f3020 	ldr	r3, [pc, #32]	; 40008dbc <request_irq+0x23c>
40008d98:	e51b2008 	ldr	r2, [fp, #-8]
40008d9c:	e51b1010 	ldr	r1, [fp, #-16]
40008da0:	e7831102 	str	r1, [r3, r2, lsl #2]
40008da4:	e28bd000 	add	sp, fp, #0
40008da8:	e8bd0800 	pop	{fp}
40008dac:	e12fff1e 	bx	lr
40008db0:	10490100 	.word	0x10490100
40008db4:	10490400 	.word	0x10490400
40008db8:	10490800 	.word	0x10490800
40008dbc:	40008e10 	.word	0x40008e10
