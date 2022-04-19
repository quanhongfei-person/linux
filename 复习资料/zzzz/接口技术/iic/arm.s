
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
40008054:	eb0002b6 	bl	40008b34 <do_irq>
40008058:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

4000805c <_bss_start>:
4000805c:	40009558 	.word	0x40009558

40008060 <_bss_end>:
40008060:	400097dc 	.word	0x400097dc

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
400080ec:	eb000156 	bl	4000864c <uprintf>
400080f0:	e8bd8800 	pop	{fp, pc}
400080f4:	400094dc 	.word	0x400094dc

400080f8 <main>:
400080f8:	e92d4800 	push	{fp, lr}
400080fc:	e28db004 	add	fp, sp, #4
40008100:	e24dd008 	sub	sp, sp, #8
40008104:	e3a03000 	mov	r3, #0
40008108:	e54b3005 	strb	r3, [fp, #-5]
4000810c:	eb000064 	bl	400082a4 <uart_init>
40008110:	eb0003e2 	bl	400090a0 <iic_init>
40008114:	e1a00000 	nop			; (mov r0, r0)
40008118:	e3a00050 	mov	r0, #80	; 0x50
4000811c:	e3a01001 	mov	r1, #1
40008120:	e3a02012 	mov	r2, #18
40008124:	eb000435 	bl	40009200 <iic_write>
40008128:	e1a03000 	mov	r3, r0
4000812c:	e3530000 	cmp	r3, #0
40008130:	bafffff8 	blt	40008118 <main+0x20>
40008134:	e1a00000 	nop			; (mov r0, r0)
40008138:	e24b3005 	sub	r3, fp, #5
4000813c:	e3a00050 	mov	r0, #80	; 0x50
40008140:	e3a01001 	mov	r1, #1
40008144:	e1a02003 	mov	r2, r3
40008148:	eb00047e 	bl	40009348 <iic_read>
4000814c:	e1a03000 	mov	r3, r0
40008150:	e3530000 	cmp	r3, #0
40008154:	bafffff7 	blt	40008138 <main+0x40>
40008158:	e55b3005 	ldrb	r3, [fp, #-5]
4000815c:	e59f000c 	ldr	r0, [pc, #12]	; 40008170 <main+0x78>
40008160:	e1a01003 	mov	r1, r3
40008164:	eb000138 	bl	4000864c <uprintf>
40008168:	e24bd004 	sub	sp, fp, #4
4000816c:	e8bd8800 	pop	{fp, pc}
40008170:	400094ec 	.word	0x400094ec

40008174 <beep_init>:
40008174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008178:	e28db000 	add	fp, sp, #0
4000817c:	e59f302c 	ldr	r3, [pc, #44]	; 400081b0 <beep_init+0x3c>
40008180:	e59f2028 	ldr	r2, [pc, #40]	; 400081b0 <beep_init+0x3c>
40008184:	e5922000 	ldr	r2, [r2]
40008188:	e3c2200f 	bic	r2, r2, #15
4000818c:	e5832000 	str	r2, [r3]
40008190:	e59f3018 	ldr	r3, [pc, #24]	; 400081b0 <beep_init+0x3c>
40008194:	e59f2014 	ldr	r2, [pc, #20]	; 400081b0 <beep_init+0x3c>
40008198:	e5922000 	ldr	r2, [r2]
4000819c:	e3822001 	orr	r2, r2, #1
400081a0:	e5832000 	str	r2, [r3]
400081a4:	e28bd000 	add	sp, fp, #0
400081a8:	e8bd0800 	pop	{fp}
400081ac:	e12fff1e 	bx	lr
400081b0:	114000a0 	.word	0x114000a0

400081b4 <beep_on>:
400081b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081b8:	e28db000 	add	fp, sp, #0
400081bc:	e59f3018 	ldr	r3, [pc, #24]	; 400081dc <beep_on+0x28>
400081c0:	e59f2014 	ldr	r2, [pc, #20]	; 400081dc <beep_on+0x28>
400081c4:	e5922000 	ldr	r2, [r2]
400081c8:	e3822001 	orr	r2, r2, #1
400081cc:	e5832000 	str	r2, [r3]
400081d0:	e28bd000 	add	sp, fp, #0
400081d4:	e8bd0800 	pop	{fp}
400081d8:	e12fff1e 	bx	lr
400081dc:	114000a4 	.word	0x114000a4

400081e0 <beep_off>:
400081e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081e4:	e28db000 	add	fp, sp, #0
400081e8:	e59f3018 	ldr	r3, [pc, #24]	; 40008208 <beep_off+0x28>
400081ec:	e59f2014 	ldr	r2, [pc, #20]	; 40008208 <beep_off+0x28>
400081f0:	e5922000 	ldr	r2, [r2]
400081f4:	e3c22001 	bic	r2, r2, #1
400081f8:	e5832000 	str	r2, [r3]
400081fc:	e28bd000 	add	sp, fp, #0
40008200:	e8bd0800 	pop	{fp}
40008204:	e12fff1e 	bx	lr
40008208:	114000a4 	.word	0x114000a4

4000820c <led_init>:
4000820c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008210:	e28db000 	add	fp, sp, #0
40008214:	e59f302c 	ldr	r3, [pc, #44]	; 40008248 <led_init+0x3c>
40008218:	e59f2028 	ldr	r2, [pc, #40]	; 40008248 <led_init+0x3c>
4000821c:	e5922000 	ldr	r2, [r2]
40008220:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
40008224:	e5832000 	str	r2, [r3]
40008228:	e59f3018 	ldr	r3, [pc, #24]	; 40008248 <led_init+0x3c>
4000822c:	e59f2014 	ldr	r2, [pc, #20]	; 40008248 <led_init+0x3c>
40008230:	e5922000 	ldr	r2, [r2]
40008234:	e3822a01 	orr	r2, r2, #4096	; 0x1000
40008238:	e5832000 	str	r2, [r3]
4000823c:	e28bd000 	add	sp, fp, #0
40008240:	e8bd0800 	pop	{fp}
40008244:	e12fff1e 	bx	lr
40008248:	110002e0 	.word	0x110002e0

4000824c <led_on>:
4000824c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008250:	e28db000 	add	fp, sp, #0
40008254:	e59f3018 	ldr	r3, [pc, #24]	; 40008274 <led_on+0x28>
40008258:	e59f2014 	ldr	r2, [pc, #20]	; 40008274 <led_on+0x28>
4000825c:	e5922000 	ldr	r2, [r2]
40008260:	e3c22008 	bic	r2, r2, #8
40008264:	e5832000 	str	r2, [r3]
40008268:	e28bd000 	add	sp, fp, #0
4000826c:	e8bd0800 	pop	{fp}
40008270:	e12fff1e 	bx	lr
40008274:	110002e4 	.word	0x110002e4

40008278 <led_off>:
40008278:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000827c:	e28db000 	add	fp, sp, #0
40008280:	e59f3018 	ldr	r3, [pc, #24]	; 400082a0 <led_off+0x28>
40008284:	e59f2014 	ldr	r2, [pc, #20]	; 400082a0 <led_off+0x28>
40008288:	e5922000 	ldr	r2, [r2]
4000828c:	e3822008 	orr	r2, r2, #8
40008290:	e5832000 	str	r2, [r3]
40008294:	e28bd000 	add	sp, fp, #0
40008298:	e8bd0800 	pop	{fp}
4000829c:	e12fff1e 	bx	lr
400082a0:	110002e4 	.word	0x110002e4

400082a4 <uart_init>:
400082a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400082a8:	e28db000 	add	fp, sp, #0
400082ac:	e3a03545 	mov	r3, #289406976	; 0x11400000
400082b0:	e3a02545 	mov	r2, #289406976	; 0x11400000
400082b4:	e5922000 	ldr	r2, [r2]
400082b8:	e3c220ff 	bic	r2, r2, #255	; 0xff
400082bc:	e5832000 	str	r2, [r3]
400082c0:	e3a03545 	mov	r3, #289406976	; 0x11400000
400082c4:	e3a02545 	mov	r2, #289406976	; 0x11400000
400082c8:	e5922000 	ldr	r2, [r2]
400082cc:	e3822022 	orr	r2, r2, #34	; 0x22
400082d0:	e5832000 	str	r2, [r3]
400082d4:	e3a0354e 	mov	r3, #327155712	; 0x13800000
400082d8:	e3a02003 	mov	r2, #3
400082dc:	e5832000 	str	r2, [r3]
400082e0:	e59f3028 	ldr	r3, [pc, #40]	; 40008310 <uart_init+0x6c>
400082e4:	e3a02005 	mov	r2, #5
400082e8:	e5832000 	str	r2, [r3]
400082ec:	e59f3020 	ldr	r3, [pc, #32]	; 40008314 <uart_init+0x70>
400082f0:	e3a02035 	mov	r2, #53	; 0x35
400082f4:	e5832000 	str	r2, [r3]
400082f8:	e59f3018 	ldr	r3, [pc, #24]	; 40008318 <uart_init+0x74>
400082fc:	e3a02004 	mov	r2, #4
40008300:	e5832000 	str	r2, [r3]
40008304:	e28bd000 	add	sp, fp, #0
40008308:	e8bd0800 	pop	{fp}
4000830c:	e12fff1e 	bx	lr
40008310:	13800004 	.word	0x13800004
40008314:	13800028 	.word	0x13800028
40008318:	1380002c 	.word	0x1380002c

4000831c <uart_send>:
4000831c:	e92d4800 	push	{fp, lr}
40008320:	e28db004 	add	fp, sp, #4
40008324:	e24dd008 	sub	sp, sp, #8
40008328:	e1a03000 	mov	r3, r0
4000832c:	e54b3005 	strb	r3, [fp, #-5]
40008330:	e1a00000 	nop			; (mov r0, r0)
40008334:	e59f3034 	ldr	r3, [pc, #52]	; 40008370 <uart_send+0x54>
40008338:	e5933000 	ldr	r3, [r3]
4000833c:	e2033002 	and	r3, r3, #2
40008340:	e3530000 	cmp	r3, #0
40008344:	0afffffa 	beq	40008334 <uart_send+0x18>
40008348:	e59f3024 	ldr	r3, [pc, #36]	; 40008374 <uart_send+0x58>
4000834c:	e55b2005 	ldrb	r2, [fp, #-5]
40008350:	e5832000 	str	r2, [r3]
40008354:	e55b3005 	ldrb	r3, [fp, #-5]
40008358:	e353000a 	cmp	r3, #10
4000835c:	1a000001 	bne	40008368 <uart_send+0x4c>
40008360:	e3a0000d 	mov	r0, #13
40008364:	ebffffec 	bl	4000831c <uart_send>
40008368:	e24bd004 	sub	sp, fp, #4
4000836c:	e8bd8800 	pop	{fp, pc}
40008370:	13800010 	.word	0x13800010
40008374:	13800020 	.word	0x13800020

40008378 <puts_>:
40008378:	e92d4800 	push	{fp, lr}
4000837c:	e28db004 	add	fp, sp, #4
40008380:	e24dd008 	sub	sp, sp, #8
40008384:	e50b0008 	str	r0, [fp, #-8]
40008388:	ea000006 	b	400083a8 <puts_+0x30>
4000838c:	e51b3008 	ldr	r3, [fp, #-8]
40008390:	e5d33000 	ldrb	r3, [r3]
40008394:	e1a00003 	mov	r0, r3
40008398:	ebffffdf 	bl	4000831c <uart_send>
4000839c:	e51b3008 	ldr	r3, [fp, #-8]
400083a0:	e2833001 	add	r3, r3, #1
400083a4:	e50b3008 	str	r3, [fp, #-8]
400083a8:	e51b3008 	ldr	r3, [fp, #-8]
400083ac:	e5d33000 	ldrb	r3, [r3]
400083b0:	e3530000 	cmp	r3, #0
400083b4:	1afffff4 	bne	4000838c <puts_+0x14>
400083b8:	e24bd004 	sub	sp, fp, #4
400083bc:	e8bd8800 	pop	{fp, pc}

400083c0 <uart_rev>:
400083c0:	e92d4800 	push	{fp, lr}
400083c4:	e28db004 	add	fp, sp, #4
400083c8:	e24dd008 	sub	sp, sp, #8
400083cc:	e1a00000 	nop			; (mov r0, r0)
400083d0:	e59f3034 	ldr	r3, [pc, #52]	; 4000840c <uart_rev+0x4c>
400083d4:	e5933000 	ldr	r3, [r3]
400083d8:	e2033001 	and	r3, r3, #1
400083dc:	e3530000 	cmp	r3, #0
400083e0:	0afffffa 	beq	400083d0 <uart_rev+0x10>
400083e4:	e59f3024 	ldr	r3, [pc, #36]	; 40008410 <uart_rev+0x50>
400083e8:	e5933000 	ldr	r3, [r3]
400083ec:	e54b3005 	strb	r3, [fp, #-5]
400083f0:	e55b3005 	ldrb	r3, [fp, #-5]
400083f4:	e1a00003 	mov	r0, r3
400083f8:	ebffffc7 	bl	4000831c <uart_send>
400083fc:	e55b3005 	ldrb	r3, [fp, #-5]
40008400:	e1a00003 	mov	r0, r3
40008404:	e24bd004 	sub	sp, fp, #4
40008408:	e8bd8800 	pop	{fp, pc}
4000840c:	13800010 	.word	0x13800010
40008410:	13800024 	.word	0x13800024

40008414 <itod>:
40008414:	e92d4800 	push	{fp, lr}
40008418:	e28db004 	add	fp, sp, #4
4000841c:	e24dd010 	sub	sp, sp, #16
40008420:	e50b0010 	str	r0, [fp, #-16]
40008424:	e50b1014 	str	r1, [fp, #-20]
40008428:	e51b3010 	ldr	r3, [fp, #-16]
4000842c:	e3530009 	cmp	r3, #9
40008430:	8a00000a 	bhi	40008460 <itod+0x4c>
40008434:	e51b3010 	ldr	r3, [fp, #-16]
40008438:	e6ef3073 	uxtb	r3, r3
4000843c:	e2833030 	add	r3, r3, #48	; 0x30
40008440:	e6ef2073 	uxtb	r2, r3
40008444:	e51b3014 	ldr	r3, [fp, #-20]
40008448:	e5c32000 	strb	r2, [r3]
4000844c:	e51b3014 	ldr	r3, [fp, #-20]
40008450:	e2833001 	add	r3, r3, #1
40008454:	e3a02000 	mov	r2, #0
40008458:	e5c32000 	strb	r2, [r3]
4000845c:	ea000028 	b	40008504 <itod+0xf0>
40008460:	e51b2010 	ldr	r2, [fp, #-16]
40008464:	e59f30a0 	ldr	r3, [pc, #160]	; 4000850c <itod+0xf8>
40008468:	e0831293 	umull	r1, r3, r3, r2
4000846c:	e1a031a3 	lsr	r3, r3, #3
40008470:	e1a00003 	mov	r0, r3
40008474:	e51b1014 	ldr	r1, [fp, #-20]
40008478:	ebffffe5 	bl	40008414 <itod>
4000847c:	e3a03000 	mov	r3, #0
40008480:	e50b3008 	str	r3, [fp, #-8]
40008484:	ea000002 	b	40008494 <itod+0x80>
40008488:	e51b3008 	ldr	r3, [fp, #-8]
4000848c:	e2833001 	add	r3, r3, #1
40008490:	e50b3008 	str	r3, [fp, #-8]
40008494:	e51b3008 	ldr	r3, [fp, #-8]
40008498:	e51b2014 	ldr	r2, [fp, #-20]
4000849c:	e0823003 	add	r3, r2, r3
400084a0:	e5d33000 	ldrb	r3, [r3]
400084a4:	e3530000 	cmp	r3, #0
400084a8:	1afffff6 	bne	40008488 <itod+0x74>
400084ac:	e51b3008 	ldr	r3, [fp, #-8]
400084b0:	e51b2014 	ldr	r2, [fp, #-20]
400084b4:	e0820003 	add	r0, r2, r3
400084b8:	e51b1010 	ldr	r1, [fp, #-16]
400084bc:	e59f3048 	ldr	r3, [pc, #72]	; 4000850c <itod+0xf8>
400084c0:	e0832193 	umull	r2, r3, r3, r1
400084c4:	e1a021a3 	lsr	r2, r3, #3
400084c8:	e1a03002 	mov	r3, r2
400084cc:	e1a03103 	lsl	r3, r3, #2
400084d0:	e0833002 	add	r3, r3, r2
400084d4:	e1a03083 	lsl	r3, r3, #1
400084d8:	e0632001 	rsb	r2, r3, r1
400084dc:	e6ef3072 	uxtb	r3, r2
400084e0:	e2833030 	add	r3, r3, #48	; 0x30
400084e4:	e6ef3073 	uxtb	r3, r3
400084e8:	e5c03000 	strb	r3, [r0]
400084ec:	e51b3008 	ldr	r3, [fp, #-8]
400084f0:	e2833001 	add	r3, r3, #1
400084f4:	e51b2014 	ldr	r2, [fp, #-20]
400084f8:	e0823003 	add	r3, r2, r3
400084fc:	e3a02000 	mov	r2, #0
40008500:	e5c32000 	strb	r2, [r3]
40008504:	e24bd004 	sub	sp, fp, #4
40008508:	e8bd8800 	pop	{fp, pc}
4000850c:	cccccccd 	.word	0xcccccccd

40008510 <itox>:
40008510:	e92d4800 	push	{fp, lr}
40008514:	e28db004 	add	fp, sp, #4
40008518:	e24dd010 	sub	sp, sp, #16
4000851c:	e50b0010 	str	r0, [fp, #-16]
40008520:	e50b1014 	str	r1, [fp, #-20]
40008524:	e51b3010 	ldr	r3, [fp, #-16]
40008528:	e353000f 	cmp	r3, #15
4000852c:	8a000014 	bhi	40008584 <itox+0x74>
40008530:	e51b3010 	ldr	r3, [fp, #-16]
40008534:	e3530009 	cmp	r3, #9
40008538:	9a000006 	bls	40008558 <itox+0x48>
4000853c:	e51b3010 	ldr	r3, [fp, #-16]
40008540:	e6ef3073 	uxtb	r3, r3
40008544:	e2833057 	add	r3, r3, #87	; 0x57
40008548:	e6ef2073 	uxtb	r2, r3
4000854c:	e51b3014 	ldr	r3, [fp, #-20]
40008550:	e5c32000 	strb	r2, [r3]
40008554:	ea000005 	b	40008570 <itox+0x60>
40008558:	e51b3010 	ldr	r3, [fp, #-16]
4000855c:	e6ef3073 	uxtb	r3, r3
40008560:	e2833030 	add	r3, r3, #48	; 0x30
40008564:	e6ef2073 	uxtb	r2, r3
40008568:	e51b3014 	ldr	r3, [fp, #-20]
4000856c:	e5c32000 	strb	r2, [r3]
40008570:	e51b3014 	ldr	r3, [fp, #-20]
40008574:	e2833001 	add	r3, r3, #1
40008578:	e3a02000 	mov	r2, #0
4000857c:	e5c32000 	strb	r2, [r3]
40008580:	ea00002f 	b	40008644 <itox+0x134>
40008584:	e51b3010 	ldr	r3, [fp, #-16]
40008588:	e1a03223 	lsr	r3, r3, #4
4000858c:	e1a00003 	mov	r0, r3
40008590:	e51b1014 	ldr	r1, [fp, #-20]
40008594:	ebffffdd 	bl	40008510 <itox>
40008598:	e3a03000 	mov	r3, #0
4000859c:	e50b3008 	str	r3, [fp, #-8]
400085a0:	ea000002 	b	400085b0 <itox+0xa0>
400085a4:	e51b3008 	ldr	r3, [fp, #-8]
400085a8:	e2833001 	add	r3, r3, #1
400085ac:	e50b3008 	str	r3, [fp, #-8]
400085b0:	e51b3008 	ldr	r3, [fp, #-8]
400085b4:	e51b2014 	ldr	r2, [fp, #-20]
400085b8:	e0823003 	add	r3, r2, r3
400085bc:	e5d33000 	ldrb	r3, [r3]
400085c0:	e3530000 	cmp	r3, #0
400085c4:	1afffff6 	bne	400085a4 <itox+0x94>
400085c8:	e51b3010 	ldr	r3, [fp, #-16]
400085cc:	e203300f 	and	r3, r3, #15
400085d0:	e3530009 	cmp	r3, #9
400085d4:	9a00000a 	bls	40008604 <itox+0xf4>
400085d8:	e51b3008 	ldr	r3, [fp, #-8]
400085dc:	e51b2014 	ldr	r2, [fp, #-20]
400085e0:	e0823003 	add	r3, r2, r3
400085e4:	e51b2010 	ldr	r2, [fp, #-16]
400085e8:	e6ef2072 	uxtb	r2, r2
400085ec:	e202200f 	and	r2, r2, #15
400085f0:	e6ef2072 	uxtb	r2, r2
400085f4:	e2822057 	add	r2, r2, #87	; 0x57
400085f8:	e6ef2072 	uxtb	r2, r2
400085fc:	e5c32000 	strb	r2, [r3]
40008600:	ea000009 	b	4000862c <itox+0x11c>
40008604:	e51b3008 	ldr	r3, [fp, #-8]
40008608:	e51b2014 	ldr	r2, [fp, #-20]
4000860c:	e0823003 	add	r3, r2, r3
40008610:	e51b2010 	ldr	r2, [fp, #-16]
40008614:	e6ef2072 	uxtb	r2, r2
40008618:	e202200f 	and	r2, r2, #15
4000861c:	e6ef2072 	uxtb	r2, r2
40008620:	e2822030 	add	r2, r2, #48	; 0x30
40008624:	e6ef2072 	uxtb	r2, r2
40008628:	e5c32000 	strb	r2, [r3]
4000862c:	e51b3008 	ldr	r3, [fp, #-8]
40008630:	e2833001 	add	r3, r3, #1
40008634:	e51b2014 	ldr	r2, [fp, #-20]
40008638:	e0823003 	add	r3, r2, r3
4000863c:	e3a02000 	mov	r2, #0
40008640:	e5c32000 	strb	r2, [r3]
40008644:	e24bd004 	sub	sp, fp, #4
40008648:	e8bd8800 	pop	{fp, pc}

4000864c <uprintf>:
4000864c:	e92d000f 	push	{r0, r1, r2, r3}
40008650:	e92d4800 	push	{fp, lr}
40008654:	e28db004 	add	fp, sp, #4
40008658:	e24dd028 	sub	sp, sp, #40	; 0x28
4000865c:	e28b3004 	add	r3, fp, #4
40008660:	e2833004 	add	r3, r3, #4
40008664:	e50b300c 	str	r3, [fp, #-12]
40008668:	ea00006a 	b	40008818 <uprintf+0x1cc>
4000866c:	e59b3004 	ldr	r3, [fp, #4]
40008670:	e5d33000 	ldrb	r3, [r3]
40008674:	e3530025 	cmp	r3, #37	; 0x25
40008678:	0a000004 	beq	40008690 <uprintf+0x44>
4000867c:	e59b3004 	ldr	r3, [fp, #4]
40008680:	e5d33000 	ldrb	r3, [r3]
40008684:	e1a00003 	mov	r0, r3
40008688:	ebffff23 	bl	4000831c <uart_send>
4000868c:	ea00005e 	b	4000880c <uprintf+0x1c0>
40008690:	e59b3004 	ldr	r3, [fp, #4]
40008694:	e2833001 	add	r3, r3, #1
40008698:	e58b3004 	str	r3, [fp, #4]
4000869c:	e59b3004 	ldr	r3, [fp, #4]
400086a0:	e5d33000 	ldrb	r3, [r3]
400086a4:	e2433063 	sub	r3, r3, #99	; 0x63
400086a8:	e3530015 	cmp	r3, #21
400086ac:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
400086b0:	ea000054 	b	40008808 <uprintf+0x1bc>
400086b4:	4000870c 	.word	0x4000870c
400086b8:	40008760 	.word	0x40008760
400086bc:	40008808 	.word	0x40008808
400086c0:	40008808 	.word	0x40008808
400086c4:	40008808 	.word	0x40008808
400086c8:	40008808 	.word	0x40008808
400086cc:	40008808 	.word	0x40008808
400086d0:	40008808 	.word	0x40008808
400086d4:	40008808 	.word	0x40008808
400086d8:	40008808 	.word	0x40008808
400086dc:	40008808 	.word	0x40008808
400086e0:	40008808 	.word	0x40008808
400086e4:	40008808 	.word	0x40008808
400086e8:	40008808 	.word	0x40008808
400086ec:	40008808 	.word	0x40008808
400086f0:	40008808 	.word	0x40008808
400086f4:	40008738 	.word	0x40008738
400086f8:	40008808 	.word	0x40008808
400086fc:	40008808 	.word	0x40008808
40008700:	40008808 	.word	0x40008808
40008704:	40008808 	.word	0x40008808
40008708:	400087c4 	.word	0x400087c4
4000870c:	e51b300c 	ldr	r3, [fp, #-12]
40008710:	e5933000 	ldr	r3, [r3]
40008714:	e50b3010 	str	r3, [fp, #-16]
40008718:	e51b300c 	ldr	r3, [fp, #-12]
4000871c:	e2833004 	add	r3, r3, #4
40008720:	e50b300c 	str	r3, [fp, #-12]
40008724:	e51b3010 	ldr	r3, [fp, #-16]
40008728:	e6ef3073 	uxtb	r3, r3
4000872c:	e1a00003 	mov	r0, r3
40008730:	ebfffef9 	bl	4000831c <uart_send>
40008734:	ea000034 	b	4000880c <uprintf+0x1c0>
40008738:	e51b300c 	ldr	r3, [fp, #-12]
4000873c:	e5933000 	ldr	r3, [r3]
40008740:	e50b3014 	str	r3, [fp, #-20]
40008744:	e51b300c 	ldr	r3, [fp, #-12]
40008748:	e2833004 	add	r3, r3, #4
4000874c:	e50b300c 	str	r3, [fp, #-12]
40008750:	e51b3014 	ldr	r3, [fp, #-20]
40008754:	e1a00003 	mov	r0, r3
40008758:	ebffff06 	bl	40008378 <puts_>
4000875c:	ea00002a 	b	4000880c <uprintf+0x1c0>
40008760:	e51b300c 	ldr	r3, [fp, #-12]
40008764:	e5933000 	ldr	r3, [r3]
40008768:	e50b3018 	str	r3, [fp, #-24]
4000876c:	e51b300c 	ldr	r3, [fp, #-12]
40008770:	e2833004 	add	r3, r3, #4
40008774:	e50b300c 	str	r3, [fp, #-12]
40008778:	e51b3018 	ldr	r3, [fp, #-24]
4000877c:	e50b3008 	str	r3, [fp, #-8]
40008780:	e51b3008 	ldr	r3, [fp, #-8]
40008784:	e3530000 	cmp	r3, #0
40008788:	aa000004 	bge	400087a0 <uprintf+0x154>
4000878c:	e3a0002d 	mov	r0, #45	; 0x2d
40008790:	ebfffee1 	bl	4000831c <uart_send>
40008794:	e51b3008 	ldr	r3, [fp, #-8]
40008798:	e2633000 	rsb	r3, r3, #0
4000879c:	e50b3008 	str	r3, [fp, #-8]
400087a0:	e51b2008 	ldr	r2, [fp, #-8]
400087a4:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087a8:	e1a00002 	mov	r0, r2
400087ac:	e1a01003 	mov	r1, r3
400087b0:	ebffff17 	bl	40008414 <itod>
400087b4:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087b8:	e1a00003 	mov	r0, r3
400087bc:	ebfffeed 	bl	40008378 <puts_>
400087c0:	ea000011 	b	4000880c <uprintf+0x1c0>
400087c4:	e51b300c 	ldr	r3, [fp, #-12]
400087c8:	e5933000 	ldr	r3, [r3]
400087cc:	e50b301c 	str	r3, [fp, #-28]
400087d0:	e51b300c 	ldr	r3, [fp, #-12]
400087d4:	e2833004 	add	r3, r3, #4
400087d8:	e50b300c 	str	r3, [fp, #-12]
400087dc:	e51b301c 	ldr	r3, [fp, #-28]
400087e0:	e50b3008 	str	r3, [fp, #-8]
400087e4:	e51b2008 	ldr	r2, [fp, #-8]
400087e8:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087ec:	e1a00002 	mov	r0, r2
400087f0:	e1a01003 	mov	r1, r3
400087f4:	ebffff45 	bl	40008510 <itox>
400087f8:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087fc:	e1a00003 	mov	r0, r3
40008800:	ebfffedc 	bl	40008378 <puts_>
40008804:	ea000000 	b	4000880c <uprintf+0x1c0>
40008808:	e1a00000 	nop			; (mov r0, r0)
4000880c:	e59b3004 	ldr	r3, [fp, #4]
40008810:	e2833001 	add	r3, r3, #1
40008814:	e58b3004 	str	r3, [fp, #4]
40008818:	e59b3004 	ldr	r3, [fp, #4]
4000881c:	e5d33000 	ldrb	r3, [r3]
40008820:	e3530000 	cmp	r3, #0
40008824:	1affff90 	bne	4000866c <uprintf+0x20>
40008828:	e3a03000 	mov	r3, #0
4000882c:	e50b300c 	str	r3, [fp, #-12]
40008830:	e3a03000 	mov	r3, #0
40008834:	e1a00003 	mov	r0, r3
40008838:	e24bd004 	sub	sp, fp, #4
4000883c:	e8bd4800 	pop	{fp, lr}
40008840:	e28dd010 	add	sp, sp, #16
40008844:	e12fff1e 	bx	lr

40008848 <pwm0_init>:
40008848:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000884c:	e28db000 	add	fp, sp, #0
40008850:	e59f30d8 	ldr	r3, [pc, #216]	; 40008930 <pwm0_init+0xe8>
40008854:	e59f20d4 	ldr	r2, [pc, #212]	; 40008930 <pwm0_init+0xe8>
40008858:	e5922000 	ldr	r2, [r2]
4000885c:	e3c2200f 	bic	r2, r2, #15
40008860:	e5832000 	str	r2, [r3]
40008864:	e59f30c4 	ldr	r3, [pc, #196]	; 40008930 <pwm0_init+0xe8>
40008868:	e59f20c0 	ldr	r2, [pc, #192]	; 40008930 <pwm0_init+0xe8>
4000886c:	e5922000 	ldr	r2, [r2]
40008870:	e3822002 	orr	r2, r2, #2
40008874:	e5832000 	str	r2, [r3]
40008878:	e59f30b4 	ldr	r3, [pc, #180]	; 40008934 <pwm0_init+0xec>
4000887c:	e59f20b0 	ldr	r2, [pc, #176]	; 40008934 <pwm0_init+0xec>
40008880:	e5922000 	ldr	r2, [r2]
40008884:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008888:	e5832000 	str	r2, [r3]
4000888c:	e59f30a0 	ldr	r3, [pc, #160]	; 40008934 <pwm0_init+0xec>
40008890:	e59f209c 	ldr	r2, [pc, #156]	; 40008934 <pwm0_init+0xec>
40008894:	e5922000 	ldr	r2, [r2]
40008898:	e3822031 	orr	r2, r2, #49	; 0x31
4000889c:	e5832000 	str	r2, [r3]
400088a0:	e59f3090 	ldr	r3, [pc, #144]	; 40008938 <pwm0_init+0xf0>
400088a4:	e59f208c 	ldr	r2, [pc, #140]	; 40008938 <pwm0_init+0xf0>
400088a8:	e5922000 	ldr	r2, [r2]
400088ac:	e3c2200f 	bic	r2, r2, #15
400088b0:	e5832000 	str	r2, [r3]
400088b4:	e59f307c 	ldr	r3, [pc, #124]	; 40008938 <pwm0_init+0xf0>
400088b8:	e59f2078 	ldr	r2, [pc, #120]	; 40008938 <pwm0_init+0xf0>
400088bc:	e5922000 	ldr	r2, [r2]
400088c0:	e3822001 	orr	r2, r2, #1
400088c4:	e5832000 	str	r2, [r3]
400088c8:	e59f306c 	ldr	r3, [pc, #108]	; 4000893c <pwm0_init+0xf4>
400088cc:	e3a02ffa 	mov	r2, #1000	; 0x3e8
400088d0:	e5832000 	str	r2, [r3]
400088d4:	e59f3064 	ldr	r3, [pc, #100]	; 40008940 <pwm0_init+0xf8>
400088d8:	e59f205c 	ldr	r2, [pc, #92]	; 4000893c <pwm0_init+0xf4>
400088dc:	e5922000 	ldr	r2, [r2]
400088e0:	e1a020a2 	lsr	r2, r2, #1
400088e4:	e5832000 	str	r2, [r3]
400088e8:	e59f3054 	ldr	r3, [pc, #84]	; 40008944 <pwm0_init+0xfc>
400088ec:	e59f2050 	ldr	r2, [pc, #80]	; 40008944 <pwm0_init+0xfc>
400088f0:	e5922000 	ldr	r2, [r2]
400088f4:	e3822002 	orr	r2, r2, #2
400088f8:	e5832000 	str	r2, [r3]
400088fc:	e59f3040 	ldr	r3, [pc, #64]	; 40008944 <pwm0_init+0xfc>
40008900:	e59f203c 	ldr	r2, [pc, #60]	; 40008944 <pwm0_init+0xfc>
40008904:	e5922000 	ldr	r2, [r2]
40008908:	e3c22002 	bic	r2, r2, #2
4000890c:	e5832000 	str	r2, [r3]
40008910:	e59f302c 	ldr	r3, [pc, #44]	; 40008944 <pwm0_init+0xfc>
40008914:	e59f2028 	ldr	r2, [pc, #40]	; 40008944 <pwm0_init+0xfc>
40008918:	e5922000 	ldr	r2, [r2]
4000891c:	e3822009 	orr	r2, r2, #9
40008920:	e5832000 	str	r2, [r3]
40008924:	e28bd000 	add	sp, fp, #0
40008928:	e8bd0800 	pop	{fp}
4000892c:	e12fff1e 	bx	lr
40008930:	114000a0 	.word	0x114000a0
40008934:	139d0000 	.word	0x139d0000
40008938:	139d0004 	.word	0x139d0004
4000893c:	139d000c 	.word	0x139d000c
40008940:	139d0010 	.word	0x139d0010
40008944:	139d0008 	.word	0x139d0008

40008948 <do_timer>:
40008948:	e92d4800 	push	{fp, lr}
4000894c:	e28db004 	add	fp, sp, #4
40008950:	e59f3018 	ldr	r3, [pc, #24]	; 40008970 <do_timer+0x28>
40008954:	e59f2014 	ldr	r2, [pc, #20]	; 40008970 <do_timer+0x28>
40008958:	e5922000 	ldr	r2, [r2]
4000895c:	e3822020 	orr	r2, r2, #32
40008960:	e5832000 	str	r2, [r3]
40008964:	e59f0008 	ldr	r0, [pc, #8]	; 40008974 <do_timer+0x2c>
40008968:	ebffff37 	bl	4000864c <uprintf>
4000896c:	e8bd8800 	pop	{fp, pc}
40008970:	139d0044 	.word	0x139d0044
40008974:	400094fc 	.word	0x400094fc

40008978 <timer_init>:
40008978:	e92d4800 	push	{fp, lr}
4000897c:	e28db004 	add	fp, sp, #4
40008980:	e59f30b8 	ldr	r3, [pc, #184]	; 40008a40 <timer_init+0xc8>
40008984:	e59f20b4 	ldr	r2, [pc, #180]	; 40008a40 <timer_init+0xc8>
40008988:	e5922000 	ldr	r2, [r2]
4000898c:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008990:	e5832000 	str	r2, [r3]
40008994:	e59f30a4 	ldr	r3, [pc, #164]	; 40008a40 <timer_init+0xc8>
40008998:	e59f20a0 	ldr	r2, [pc, #160]	; 40008a40 <timer_init+0xc8>
4000899c:	e5922000 	ldr	r2, [r2]
400089a0:	e3822031 	orr	r2, r2, #49	; 0x31
400089a4:	e5832000 	str	r2, [r3]
400089a8:	e59f3094 	ldr	r3, [pc, #148]	; 40008a44 <timer_init+0xcc>
400089ac:	e59f2090 	ldr	r2, [pc, #144]	; 40008a44 <timer_init+0xcc>
400089b0:	e5922000 	ldr	r2, [r2]
400089b4:	e3c2200f 	bic	r2, r2, #15
400089b8:	e5832000 	str	r2, [r3]
400089bc:	e59f3080 	ldr	r3, [pc, #128]	; 40008a44 <timer_init+0xcc>
400089c0:	e59f207c 	ldr	r2, [pc, #124]	; 40008a44 <timer_init+0xcc>
400089c4:	e5922000 	ldr	r2, [r2]
400089c8:	e3822001 	orr	r2, r2, #1
400089cc:	e5832000 	str	r2, [r3]
400089d0:	e59f3070 	ldr	r3, [pc, #112]	; 40008a48 <timer_init+0xd0>
400089d4:	e59f2070 	ldr	r2, [pc, #112]	; 40008a4c <timer_init+0xd4>
400089d8:	e5832000 	str	r2, [r3]
400089dc:	e59f306c 	ldr	r3, [pc, #108]	; 40008a50 <timer_init+0xd8>
400089e0:	e59f2068 	ldr	r2, [pc, #104]	; 40008a50 <timer_init+0xd8>
400089e4:	e5922000 	ldr	r2, [r2]
400089e8:	e3822002 	orr	r2, r2, #2
400089ec:	e5832000 	str	r2, [r3]
400089f0:	e59f3058 	ldr	r3, [pc, #88]	; 40008a50 <timer_init+0xd8>
400089f4:	e59f2054 	ldr	r2, [pc, #84]	; 40008a50 <timer_init+0xd8>
400089f8:	e5922000 	ldr	r2, [r2]
400089fc:	e3c22002 	bic	r2, r2, #2
40008a00:	e5832000 	str	r2, [r3]
40008a04:	e59f3048 	ldr	r3, [pc, #72]	; 40008a54 <timer_init+0xdc>
40008a08:	e59f2044 	ldr	r2, [pc, #68]	; 40008a54 <timer_init+0xdc>
40008a0c:	e5922000 	ldr	r2, [r2]
40008a10:	e3822001 	orr	r2, r2, #1
40008a14:	e5832000 	str	r2, [r3]
40008a18:	e59f3030 	ldr	r3, [pc, #48]	; 40008a50 <timer_init+0xd8>
40008a1c:	e59f202c 	ldr	r2, [pc, #44]	; 40008a50 <timer_init+0xd8>
40008a20:	e5922000 	ldr	r2, [r2]
40008a24:	e3822009 	orr	r2, r2, #9
40008a28:	e5832000 	str	r2, [r3]
40008a2c:	e3a00045 	mov	r0, #69	; 0x45
40008a30:	e3a01013 	mov	r1, #19
40008a34:	e59f201c 	ldr	r2, [pc, #28]	; 40008a58 <timer_init+0xe0>
40008a38:	eb000068 	bl	40008be0 <request_irq>
40008a3c:	e8bd8800 	pop	{fp, pc}
40008a40:	139d0000 	.word	0x139d0000
40008a44:	139d0004 	.word	0x139d0004
40008a48:	139d000c 	.word	0x139d000c
40008a4c:	001e8480 	.word	0x001e8480
40008a50:	139d0008 	.word	0x139d0008
40008a54:	139d0044 	.word	0x139d0044
40008a58:	40008948 	.word	0x40008948

40008a5c <do_eint>:
40008a5c:	e92d4800 	push	{fp, lr}
40008a60:	e28db004 	add	fp, sp, #4
40008a64:	e59f302c 	ldr	r3, [pc, #44]	; 40008a98 <do_eint+0x3c>
40008a68:	e5933000 	ldr	r3, [r3]
40008a6c:	e2033004 	and	r3, r3, #4
40008a70:	e3530000 	cmp	r3, #0
40008a74:	0a000006 	beq	40008a94 <do_eint+0x38>
40008a78:	e59f001c 	ldr	r0, [pc, #28]	; 40008a9c <do_eint+0x40>
40008a7c:	ebfffef2 	bl	4000864c <uprintf>
40008a80:	e59f3010 	ldr	r3, [pc, #16]	; 40008a98 <do_eint+0x3c>
40008a84:	e59f200c 	ldr	r2, [pc, #12]	; 40008a98 <do_eint+0x3c>
40008a88:	e5922000 	ldr	r2, [r2]
40008a8c:	e3822004 	orr	r2, r2, #4
40008a90:	e5832000 	str	r2, [r3]
40008a94:	e8bd8800 	pop	{fp, pc}
40008a98:	11000f4c 	.word	0x11000f4c
40008a9c:	40009510 	.word	0x40009510

40008aa0 <eint_init>:
40008aa0:	e92d4800 	push	{fp, lr}
40008aa4:	e28db004 	add	fp, sp, #4
40008aa8:	e59f3070 	ldr	r3, [pc, #112]	; 40008b20 <eint_init+0x80>
40008aac:	e59f206c 	ldr	r2, [pc, #108]	; 40008b20 <eint_init+0x80>
40008ab0:	e5922000 	ldr	r2, [r2]
40008ab4:	e3822c0f 	orr	r2, r2, #3840	; 0xf00
40008ab8:	e5832000 	str	r2, [r3]
40008abc:	e59f3060 	ldr	r3, [pc, #96]	; 40008b24 <eint_init+0x84>
40008ac0:	e59f205c 	ldr	r2, [pc, #92]	; 40008b24 <eint_init+0x84>
40008ac4:	e5922000 	ldr	r2, [r2]
40008ac8:	e3c22c07 	bic	r2, r2, #1792	; 0x700
40008acc:	e5832000 	str	r2, [r3]
40008ad0:	e59f304c 	ldr	r3, [pc, #76]	; 40008b24 <eint_init+0x84>
40008ad4:	e59f2048 	ldr	r2, [pc, #72]	; 40008b24 <eint_init+0x84>
40008ad8:	e5922000 	ldr	r2, [r2]
40008adc:	e3822c02 	orr	r2, r2, #512	; 0x200
40008ae0:	e5832000 	str	r2, [r3]
40008ae4:	e59f303c 	ldr	r3, [pc, #60]	; 40008b28 <eint_init+0x88>
40008ae8:	e59f2038 	ldr	r2, [pc, #56]	; 40008b28 <eint_init+0x88>
40008aec:	e5922000 	ldr	r2, [r2]
40008af0:	e3822503 	orr	r2, r2, #12582912	; 0xc00000
40008af4:	e5832000 	str	r2, [r3]
40008af8:	e59f302c 	ldr	r3, [pc, #44]	; 40008b2c <eint_init+0x8c>
40008afc:	e59f2028 	ldr	r2, [pc, #40]	; 40008b2c <eint_init+0x8c>
40008b00:	e5922000 	ldr	r2, [r2]
40008b04:	e3c22004 	bic	r2, r2, #4
40008b08:	e5832000 	str	r2, [r3]
40008b0c:	e3a00040 	mov	r0, #64	; 0x40
40008b10:	e3a01012 	mov	r1, #18
40008b14:	e59f2014 	ldr	r2, [pc, #20]	; 40008b30 <eint_init+0x90>
40008b18:	eb000030 	bl	40008be0 <request_irq>
40008b1c:	e8bd8800 	pop	{fp, pc}
40008b20:	11000c60 	.word	0x11000c60
40008b24:	11000e0c 	.word	0x11000e0c
40008b28:	11000e98 	.word	0x11000e98
40008b2c:	11000f0c 	.word	0x11000f0c
40008b30:	40008a5c 	.word	0x40008a5c

40008b34 <do_irq>:
40008b34:	e92d4800 	push	{fp, lr}
40008b38:	e28db004 	add	fp, sp, #4
40008b3c:	e24dd008 	sub	sp, sp, #8
40008b40:	e59f3044 	ldr	r3, [pc, #68]	; 40008b8c <do_irq+0x58>
40008b44:	e5933000 	ldr	r3, [r3]
40008b48:	e1a03b03 	lsl	r3, r3, #22
40008b4c:	e1a03b23 	lsr	r3, r3, #22
40008b50:	e50b3008 	str	r3, [fp, #-8]
40008b54:	e59f3034 	ldr	r3, [pc, #52]	; 40008b90 <do_irq+0x5c>
40008b58:	e51b2008 	ldr	r2, [fp, #-8]
40008b5c:	e5832000 	str	r2, [r3]
40008b60:	e59f002c 	ldr	r0, [pc, #44]	; 40008b94 <do_irq+0x60>
40008b64:	e51b1008 	ldr	r1, [fp, #-8]
40008b68:	ebfffeb7 	bl	4000864c <uprintf>
40008b6c:	e59f3024 	ldr	r3, [pc, #36]	; 40008b98 <do_irq+0x64>
40008b70:	e51b2008 	ldr	r2, [fp, #-8]
40008b74:	e7933102 	ldr	r3, [r3, r2, lsl #2]
40008b78:	e50b300c 	str	r3, [fp, #-12]
40008b7c:	e51b300c 	ldr	r3, [fp, #-12]
40008b80:	e12fff33 	blx	r3
40008b84:	e24bd004 	sub	sp, fp, #4
40008b88:	e8bd8800 	pop	{fp, pc}
40008b8c:	1048000c 	.word	0x1048000c
40008b90:	10480010 	.word	0x10480010
40008b94:	40009528 	.word	0x40009528
40008b98:	4000955c 	.word	0x4000955c

40008b9c <gic_init>:
40008b9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008ba0:	e28db000 	add	fp, sp, #0
40008ba4:	e59f3028 	ldr	r3, [pc, #40]	; 40008bd4 <gic_init+0x38>
40008ba8:	e3a02001 	mov	r2, #1
40008bac:	e5832000 	str	r2, [r3]
40008bb0:	e59f3020 	ldr	r3, [pc, #32]	; 40008bd8 <gic_init+0x3c>
40008bb4:	e3a02001 	mov	r2, #1
40008bb8:	e5832000 	str	r2, [r3]
40008bbc:	e59f3018 	ldr	r3, [pc, #24]	; 40008bdc <gic_init+0x40>
40008bc0:	e3a020ff 	mov	r2, #255	; 0xff
40008bc4:	e5832000 	str	r2, [r3]
40008bc8:	e28bd000 	add	sp, fp, #0
40008bcc:	e8bd0800 	pop	{fp}
40008bd0:	e12fff1e 	bx	lr
40008bd4:	10490000 	.word	0x10490000
40008bd8:	10480000 	.word	0x10480000
40008bdc:	10480004 	.word	0x10480004

40008be0 <request_irq>:
40008be0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008be4:	e28db000 	add	fp, sp, #0
40008be8:	e24dd014 	sub	sp, sp, #20
40008bec:	e50b0008 	str	r0, [fp, #-8]
40008bf0:	e1a03001 	mov	r3, r1
40008bf4:	e50b2010 	str	r2, [fp, #-16]
40008bf8:	e54b3009 	strb	r3, [fp, #-9]
40008bfc:	e51b3008 	ldr	r3, [fp, #-8]
40008c00:	e283201f 	add	r2, r3, #31
40008c04:	e3530000 	cmp	r3, #0
40008c08:	b1a03002 	movlt	r3, r2
40008c0c:	e1a032c3 	asr	r3, r3, #5
40008c10:	e1a02003 	mov	r2, r3
40008c14:	e1a03002 	mov	r3, r2
40008c18:	e1a01103 	lsl	r1, r3, #2
40008c1c:	e59f31ec 	ldr	r3, [pc, #492]	; 40008e10 <request_irq+0x230>
40008c20:	e0813003 	add	r3, r1, r3
40008c24:	e1a01102 	lsl	r1, r2, #2
40008c28:	e59f21e0 	ldr	r2, [pc, #480]	; 40008e10 <request_irq+0x230>
40008c2c:	e0812002 	add	r2, r1, r2
40008c30:	e5920000 	ldr	r0, [r2]
40008c34:	e51b1008 	ldr	r1, [fp, #-8]
40008c38:	e1a02fc1 	asr	r2, r1, #31
40008c3c:	e1a02da2 	lsr	r2, r2, #27
40008c40:	e0811002 	add	r1, r1, r2
40008c44:	e201101f 	and	r1, r1, #31
40008c48:	e0622001 	rsb	r2, r2, r1
40008c4c:	e3a01001 	mov	r1, #1
40008c50:	e1a02211 	lsl	r2, r1, r2
40008c54:	e1802002 	orr	r2, r0, r2
40008c58:	e5832000 	str	r2, [r3]
40008c5c:	e51b3008 	ldr	r3, [fp, #-8]
40008c60:	e2832003 	add	r2, r3, #3
40008c64:	e3530000 	cmp	r3, #0
40008c68:	b1a03002 	movlt	r3, r2
40008c6c:	e1a03143 	asr	r3, r3, #2
40008c70:	e1a02003 	mov	r2, r3
40008c74:	e1a03002 	mov	r3, r2
40008c78:	e1a01103 	lsl	r1, r3, #2
40008c7c:	e59f3190 	ldr	r3, [pc, #400]	; 40008e14 <request_irq+0x234>
40008c80:	e0813003 	add	r3, r1, r3
40008c84:	e1a01102 	lsl	r1, r2, #2
40008c88:	e59f2184 	ldr	r2, [pc, #388]	; 40008e14 <request_irq+0x234>
40008c8c:	e0812002 	add	r2, r1, r2
40008c90:	e5920000 	ldr	r0, [r2]
40008c94:	e51b1008 	ldr	r1, [fp, #-8]
40008c98:	e1a02fc1 	asr	r2, r1, #31
40008c9c:	e1a02f22 	lsr	r2, r2, #30
40008ca0:	e0811002 	add	r1, r1, r2
40008ca4:	e2011003 	and	r1, r1, #3
40008ca8:	e0622001 	rsb	r2, r2, r1
40008cac:	e1a02182 	lsl	r2, r2, #3
40008cb0:	e3a010ff 	mov	r1, #255	; 0xff
40008cb4:	e1a02211 	lsl	r2, r1, r2
40008cb8:	e1e02002 	mvn	r2, r2
40008cbc:	e0002002 	and	r2, r0, r2
40008cc0:	e5832000 	str	r2, [r3]
40008cc4:	e51b3008 	ldr	r3, [fp, #-8]
40008cc8:	e2832003 	add	r2, r3, #3
40008ccc:	e3530000 	cmp	r3, #0
40008cd0:	b1a03002 	movlt	r3, r2
40008cd4:	e1a03143 	asr	r3, r3, #2
40008cd8:	e1a02003 	mov	r2, r3
40008cdc:	e1a03002 	mov	r3, r2
40008ce0:	e1a01103 	lsl	r1, r3, #2
40008ce4:	e59f3128 	ldr	r3, [pc, #296]	; 40008e14 <request_irq+0x234>
40008ce8:	e0813003 	add	r3, r1, r3
40008cec:	e1a01102 	lsl	r1, r2, #2
40008cf0:	e59f211c 	ldr	r2, [pc, #284]	; 40008e14 <request_irq+0x234>
40008cf4:	e0812002 	add	r2, r1, r2
40008cf8:	e5920000 	ldr	r0, [r2]
40008cfc:	e55bc009 	ldrb	ip, [fp, #-9]
40008d00:	e51b1008 	ldr	r1, [fp, #-8]
40008d04:	e1a02fc1 	asr	r2, r1, #31
40008d08:	e1a02f22 	lsr	r2, r2, #30
40008d0c:	e0811002 	add	r1, r1, r2
40008d10:	e2011003 	and	r1, r1, #3
40008d14:	e0622001 	rsb	r2, r2, r1
40008d18:	e1a02182 	lsl	r2, r2, #3
40008d1c:	e1a0221c 	lsl	r2, ip, r2
40008d20:	e1802002 	orr	r2, r0, r2
40008d24:	e5832000 	str	r2, [r3]
40008d28:	e51b3008 	ldr	r3, [fp, #-8]
40008d2c:	e2832003 	add	r2, r3, #3
40008d30:	e3530000 	cmp	r3, #0
40008d34:	b1a03002 	movlt	r3, r2
40008d38:	e1a03143 	asr	r3, r3, #2
40008d3c:	e1a02003 	mov	r2, r3
40008d40:	e1a03002 	mov	r3, r2
40008d44:	e1a01103 	lsl	r1, r3, #2
40008d48:	e59f30c8 	ldr	r3, [pc, #200]	; 40008e18 <request_irq+0x238>
40008d4c:	e0813003 	add	r3, r1, r3
40008d50:	e1a01102 	lsl	r1, r2, #2
40008d54:	e59f20bc 	ldr	r2, [pc, #188]	; 40008e18 <request_irq+0x238>
40008d58:	e0812002 	add	r2, r1, r2
40008d5c:	e5920000 	ldr	r0, [r2]
40008d60:	e51b1008 	ldr	r1, [fp, #-8]
40008d64:	e1a02fc1 	asr	r2, r1, #31
40008d68:	e1a02f22 	lsr	r2, r2, #30
40008d6c:	e0811002 	add	r1, r1, r2
40008d70:	e2011003 	and	r1, r1, #3
40008d74:	e0622001 	rsb	r2, r2, r1
40008d78:	e1a02182 	lsl	r2, r2, #3
40008d7c:	e3a010ff 	mov	r1, #255	; 0xff
40008d80:	e1a02211 	lsl	r2, r1, r2
40008d84:	e1e02002 	mvn	r2, r2
40008d88:	e0002002 	and	r2, r0, r2
40008d8c:	e5832000 	str	r2, [r3]
40008d90:	e51b3008 	ldr	r3, [fp, #-8]
40008d94:	e2832003 	add	r2, r3, #3
40008d98:	e3530000 	cmp	r3, #0
40008d9c:	b1a03002 	movlt	r3, r2
40008da0:	e1a03143 	asr	r3, r3, #2
40008da4:	e1a02003 	mov	r2, r3
40008da8:	e1a03002 	mov	r3, r2
40008dac:	e1a01103 	lsl	r1, r3, #2
40008db0:	e59f3060 	ldr	r3, [pc, #96]	; 40008e18 <request_irq+0x238>
40008db4:	e0813003 	add	r3, r1, r3
40008db8:	e1a01102 	lsl	r1, r2, #2
40008dbc:	e59f2054 	ldr	r2, [pc, #84]	; 40008e18 <request_irq+0x238>
40008dc0:	e0812002 	add	r2, r1, r2
40008dc4:	e5920000 	ldr	r0, [r2]
40008dc8:	e51b1008 	ldr	r1, [fp, #-8]
40008dcc:	e1a02fc1 	asr	r2, r1, #31
40008dd0:	e1a02f22 	lsr	r2, r2, #30
40008dd4:	e0811002 	add	r1, r1, r2
40008dd8:	e2011003 	and	r1, r1, #3
40008ddc:	e0622001 	rsb	r2, r2, r1
40008de0:	e1a02182 	lsl	r2, r2, #3
40008de4:	e3a01001 	mov	r1, #1
40008de8:	e1a02211 	lsl	r2, r1, r2
40008dec:	e1802002 	orr	r2, r0, r2
40008df0:	e5832000 	str	r2, [r3]
40008df4:	e59f3020 	ldr	r3, [pc, #32]	; 40008e1c <request_irq+0x23c>
40008df8:	e51b2008 	ldr	r2, [fp, #-8]
40008dfc:	e51b1010 	ldr	r1, [fp, #-16]
40008e00:	e7831102 	str	r1, [r3, r2, lsl #2]
40008e04:	e28bd000 	add	sp, fp, #0
40008e08:	e8bd0800 	pop	{fp}
40008e0c:	e12fff1e 	bx	lr
40008e10:	10490100 	.word	0x10490100
40008e14:	10490400 	.word	0x10490400
40008e18:	10490800 	.word	0x10490800
40008e1c:	4000955c 	.word	0x4000955c

40008e20 <wdt_init>:
40008e20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008e24:	e28db000 	add	fp, sp, #0
40008e28:	e59f3034 	ldr	r3, [pc, #52]	; 40008e64 <wdt_init+0x44>
40008e2c:	e3a02000 	mov	r2, #0
40008e30:	e5832000 	str	r2, [r3]
40008e34:	e59f302c 	ldr	r3, [pc, #44]	; 40008e68 <wdt_init+0x48>
40008e38:	e3a02000 	mov	r2, #0
40008e3c:	e5832000 	str	r2, [r3]
40008e40:	e59f3024 	ldr	r3, [pc, #36]	; 40008e6c <wdt_init+0x4c>
40008e44:	e59f2024 	ldr	r2, [pc, #36]	; 40008e70 <wdt_init+0x50>
40008e48:	e5832000 	str	r2, [r3]
40008e4c:	e59f3020 	ldr	r3, [pc, #32]	; 40008e74 <wdt_init+0x54>
40008e50:	e59f2020 	ldr	r2, [pc, #32]	; 40008e78 <wdt_init+0x58>
40008e54:	e5832000 	str	r2, [r3]
40008e58:	e28bd000 	add	sp, fp, #0
40008e5c:	e8bd0800 	pop	{fp}
40008e60:	e12fff1e 	bx	lr
40008e64:	10020408 	.word	0x10020408
40008e68:	1002040c 	.word	0x1002040c
40008e6c:	10060008 	.word	0x10060008
40008e70:	000023c4 	.word	0x000023c4
40008e74:	10060000 	.word	0x10060000
40008e78:	0000ff39 	.word	0x0000ff39

40008e7c <do_wdt>:
40008e7c:	e92d4800 	push	{fp, lr}
40008e80:	e28db004 	add	fp, sp, #4
40008e84:	e59f3010 	ldr	r3, [pc, #16]	; 40008e9c <do_wdt+0x20>
40008e88:	e3a02001 	mov	r2, #1
40008e8c:	e5832000 	str	r2, [r3]
40008e90:	e59f0008 	ldr	r0, [pc, #8]	; 40008ea0 <do_wdt+0x24>
40008e94:	ebfffdec 	bl	4000864c <uprintf>
40008e98:	e8bd8800 	pop	{fp, pc}
40008e9c:	1006000c 	.word	0x1006000c
40008ea0:	40009538 	.word	0x40009538

40008ea4 <wdt_timer>:
40008ea4:	e92d4800 	push	{fp, lr}
40008ea8:	e28db004 	add	fp, sp, #4
40008eac:	e59f2030 	ldr	r2, [pc, #48]	; 40008ee4 <wdt_timer+0x40>
40008eb0:	e59f3030 	ldr	r3, [pc, #48]	; 40008ee8 <wdt_timer+0x44>
40008eb4:	e59f1030 	ldr	r1, [pc, #48]	; 40008eec <wdt_timer+0x48>
40008eb8:	e5831000 	str	r1, [r3]
40008ebc:	e5933000 	ldr	r3, [r3]
40008ec0:	e5823000 	str	r3, [r2]
40008ec4:	e59f3024 	ldr	r3, [pc, #36]	; 40008ef0 <wdt_timer+0x4c>
40008ec8:	e59f2024 	ldr	r2, [pc, #36]	; 40008ef4 <wdt_timer+0x50>
40008ecc:	e5832000 	str	r2, [r3]
40008ed0:	e3a0004b 	mov	r0, #75	; 0x4b
40008ed4:	e3a01013 	mov	r1, #19
40008ed8:	e59f2018 	ldr	r2, [pc, #24]	; 40008ef8 <wdt_timer+0x54>
40008edc:	ebffff3f 	bl	40008be0 <request_irq>
40008ee0:	e8bd8800 	pop	{fp, pc}
40008ee4:	10060004 	.word	0x10060004
40008ee8:	10060008 	.word	0x10060008
40008eec:	000023c4 	.word	0x000023c4
40008ef0:	10060000 	.word	0x10060000
40008ef4:	0000ff3c 	.word	0x0000ff3c
40008ef8:	40008e7c 	.word	0x40008e7c

40008efc <do_adc>:
40008efc:	e92d4800 	push	{fp, lr}
40008f00:	e28db004 	add	fp, sp, #4
40008f04:	e24dd008 	sub	sp, sp, #8
40008f08:	e59f3040 	ldr	r3, [pc, #64]	; 40008f50 <do_adc+0x54>
40008f0c:	e5933000 	ldr	r3, [r3]
40008f10:	e2033702 	and	r3, r3, #524288	; 0x80000
40008f14:	e3530000 	cmp	r3, #0
40008f18:	0a00000a 	beq	40008f48 <do_adc+0x4c>
40008f1c:	e59f3030 	ldr	r3, [pc, #48]	; 40008f54 <do_adc+0x58>
40008f20:	e3a02001 	mov	r2, #1
40008f24:	e5832000 	str	r2, [r3]
40008f28:	e59f3028 	ldr	r3, [pc, #40]	; 40008f58 <do_adc+0x5c>
40008f2c:	e5933000 	ldr	r3, [r3]
40008f30:	e1a03a03 	lsl	r3, r3, #20
40008f34:	e1a03a23 	lsr	r3, r3, #20
40008f38:	e50b3008 	str	r3, [fp, #-8]
40008f3c:	e59f0018 	ldr	r0, [pc, #24]	; 40008f5c <do_adc+0x60>
40008f40:	e51b1008 	ldr	r1, [fp, #-8]
40008f44:	ebfffdc0 	bl	4000864c <uprintf>
40008f48:	e24bd004 	sub	sp, fp, #4
40008f4c:	e8bd8800 	pop	{fp, pc}
40008f50:	10440028 	.word	0x10440028
40008f54:	126c0018 	.word	0x126c0018
40008f58:	126c000c 	.word	0x126c000c
40008f5c:	4000954c 	.word	0x4000954c

40008f60 <adc_init>:
40008f60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008f64:	e28db000 	add	fp, sp, #0
40008f68:	e59f301c 	ldr	r3, [pc, #28]	; 40008f8c <adc_init+0x2c>
40008f6c:	e3a02000 	mov	r2, #0
40008f70:	e5832000 	str	r2, [r3]
40008f74:	e59f3014 	ldr	r3, [pc, #20]	; 40008f90 <adc_init+0x30>
40008f78:	e59f2014 	ldr	r2, [pc, #20]	; 40008f94 <adc_init+0x34>
40008f7c:	e5832000 	str	r2, [r3]
40008f80:	e28bd000 	add	sp, fp, #0
40008f84:	e8bd0800 	pop	{fp}
40008f88:	e12fff1e 	bx	lr
40008f8c:	126c001c 	.word	0x126c001c
40008f90:	126c0000 	.word	0x126c0000
40008f94:	00016102 	.word	0x00016102

40008f98 <adc_start_init>:
40008f98:	e92d4800 	push	{fp, lr}
40008f9c:	e28db004 	add	fp, sp, #4
40008fa0:	e59f3038 	ldr	r3, [pc, #56]	; 40008fe0 <adc_start_init+0x48>
40008fa4:	e3a02000 	mov	r2, #0
40008fa8:	e5832000 	str	r2, [r3]
40008fac:	e59f3030 	ldr	r3, [pc, #48]	; 40008fe4 <adc_start_init+0x4c>
40008fb0:	e59f2030 	ldr	r2, [pc, #48]	; 40008fe8 <adc_start_init+0x50>
40008fb4:	e5832000 	str	r2, [r3]
40008fb8:	e59f302c 	ldr	r3, [pc, #44]	; 40008fec <adc_start_init+0x54>
40008fbc:	e59f2028 	ldr	r2, [pc, #40]	; 40008fec <adc_start_init+0x54>
40008fc0:	e5922000 	ldr	r2, [r2]
40008fc4:	e3822702 	orr	r2, r2, #524288	; 0x80000
40008fc8:	e5832000 	str	r2, [r3]
40008fcc:	e3a0002a 	mov	r0, #42	; 0x2a
40008fd0:	e3a01023 	mov	r1, #35	; 0x23
40008fd4:	e59f2014 	ldr	r2, [pc, #20]	; 40008ff0 <adc_start_init+0x58>
40008fd8:	ebffff00 	bl	40008be0 <request_irq>
40008fdc:	e8bd8800 	pop	{fp, pc}
40008fe0:	126c001c 	.word	0x126c001c
40008fe4:	126c0000 	.word	0x126c0000
40008fe8:	00016100 	.word	0x00016100
40008fec:	10440020 	.word	0x10440020
40008ff0:	40008efc 	.word	0x40008efc

40008ff4 <read_start>:
40008ff4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008ff8:	e28db000 	add	fp, sp, #0
40008ffc:	e24dd00c 	sub	sp, sp, #12
40009000:	e59f3010 	ldr	r3, [pc, #16]	; 40009018 <read_start+0x24>
40009004:	e5933000 	ldr	r3, [r3]
40009008:	e50b3008 	str	r3, [fp, #-8]
4000900c:	e28bd000 	add	sp, fp, #0
40009010:	e8bd0800 	pop	{fp}
40009014:	e12fff1e 	bx	lr
40009018:	126c000c 	.word	0x126c000c

4000901c <start>:
4000901c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40009020:	e28db000 	add	fp, sp, #0
40009024:	e59f3018 	ldr	r3, [pc, #24]	; 40009044 <start+0x28>
40009028:	e59f2014 	ldr	r2, [pc, #20]	; 40009044 <start+0x28>
4000902c:	e5922000 	ldr	r2, [r2]
40009030:	e3822001 	orr	r2, r2, #1
40009034:	e5832000 	str	r2, [r3]
40009038:	e28bd000 	add	sp, fp, #0
4000903c:	e8bd0800 	pop	{fp}
40009040:	e12fff1e 	bx	lr
40009044:	126c0000 	.word	0x126c0000

40009048 <read_data>:
40009048:	e92d4800 	push	{fp, lr}
4000904c:	e28db004 	add	fp, sp, #4
40009050:	e24dd008 	sub	sp, sp, #8
40009054:	e1a00000 	nop			; (mov r0, r0)
40009058:	e59f3034 	ldr	r3, [pc, #52]	; 40009094 <read_data+0x4c>
4000905c:	e5933000 	ldr	r3, [r3]
40009060:	e2033902 	and	r3, r3, #32768	; 0x8000
40009064:	e3530000 	cmp	r3, #0
40009068:	0afffffa 	beq	40009058 <read_data+0x10>
4000906c:	e59f3024 	ldr	r3, [pc, #36]	; 40009098 <read_data+0x50>
40009070:	e5933000 	ldr	r3, [r3]
40009074:	e1a03a03 	lsl	r3, r3, #20
40009078:	e1a03a23 	lsr	r3, r3, #20
4000907c:	e50b3008 	str	r3, [fp, #-8]
40009080:	e59f0014 	ldr	r0, [pc, #20]	; 4000909c <read_data+0x54>
40009084:	e51b1008 	ldr	r1, [fp, #-8]
40009088:	ebfffd6f 	bl	4000864c <uprintf>
4000908c:	e24bd004 	sub	sp, fp, #4
40009090:	e8bd8800 	pop	{fp, pc}
40009094:	126c0000 	.word	0x126c0000
40009098:	126c000c 	.word	0x126c000c
4000909c:	4000954c 	.word	0x4000954c

400090a0 <iic_init>:
400090a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400090a4:	e28db000 	add	fp, sp, #0
400090a8:	e59f3044 	ldr	r3, [pc, #68]	; 400090f4 <iic_init+0x54>
400090ac:	e59f2040 	ldr	r2, [pc, #64]	; 400090f4 <iic_init+0x54>
400090b0:	e5922000 	ldr	r2, [r2]
400090b4:	e3c220ff 	bic	r2, r2, #255	; 0xff
400090b8:	e5832000 	str	r2, [r3]
400090bc:	e59f3030 	ldr	r3, [pc, #48]	; 400090f4 <iic_init+0x54>
400090c0:	e59f202c 	ldr	r2, [pc, #44]	; 400090f4 <iic_init+0x54>
400090c4:	e5922000 	ldr	r2, [r2]
400090c8:	e3822022 	orr	r2, r2, #34	; 0x22
400090cc:	e5832000 	str	r2, [r3]
400090d0:	e59f3020 	ldr	r3, [pc, #32]	; 400090f8 <iic_init+0x58>
400090d4:	e3a020e0 	mov	r2, #224	; 0xe0
400090d8:	e5832000 	str	r2, [r3]
400090dc:	e59f3018 	ldr	r3, [pc, #24]	; 400090fc <iic_init+0x5c>
400090e0:	e3a02010 	mov	r2, #16
400090e4:	e5832000 	str	r2, [r3]
400090e8:	e28bd000 	add	sp, fp, #0
400090ec:	e8bd0800 	pop	{fp}
400090f0:	e12fff1e 	bx	lr
400090f4:	114000c0 	.word	0x114000c0
400090f8:	13860000 	.word	0x13860000
400090fc:	13860004 	.word	0x13860004

40009100 <clear_pending>:
40009100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40009104:	e28db000 	add	fp, sp, #0
40009108:	e59f3018 	ldr	r3, [pc, #24]	; 40009128 <clear_pending+0x28>
4000910c:	e59f2014 	ldr	r2, [pc, #20]	; 40009128 <clear_pending+0x28>
40009110:	e5922000 	ldr	r2, [r2]
40009114:	e3c22010 	bic	r2, r2, #16
40009118:	e5832000 	str	r2, [r3]
4000911c:	e28bd000 	add	sp, fp, #0
40009120:	e8bd0800 	pop	{fp}
40009124:	e12fff1e 	bx	lr
40009128:	13860000 	.word	0x13860000

4000912c <wait_pend>:
4000912c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40009130:	e28db000 	add	fp, sp, #0
40009134:	e24dd00c 	sub	sp, sp, #12
40009138:	e59f305c 	ldr	r3, [pc, #92]	; 4000919c <wait_pend+0x70>
4000913c:	e50b3008 	str	r3, [fp, #-8]
40009140:	ea000006 	b	40009160 <wait_pend+0x34>
40009144:	e59f3054 	ldr	r3, [pc, #84]	; 400091a0 <wait_pend+0x74>
40009148:	e5933000 	ldr	r3, [r3]
4000914c:	e2033010 	and	r3, r3, #16
40009150:	e3530000 	cmp	r3, #0
40009154:	0a000001 	beq	40009160 <wait_pend+0x34>
40009158:	e3a03000 	mov	r3, #0
4000915c:	ea00000a 	b	4000918c <wait_pend+0x60>
40009160:	e51b3008 	ldr	r3, [fp, #-8]
40009164:	e3530000 	cmp	r3, #0
40009168:	03a03000 	moveq	r3, #0
4000916c:	13a03001 	movne	r3, #1
40009170:	e6ef3073 	uxtb	r3, r3
40009174:	e51b2008 	ldr	r2, [fp, #-8]
40009178:	e2422001 	sub	r2, r2, #1
4000917c:	e50b2008 	str	r2, [fp, #-8]
40009180:	e3530000 	cmp	r3, #0
40009184:	1affffee 	bne	40009144 <wait_pend+0x18>
40009188:	e3e03000 	mvn	r3, #0
4000918c:	e1a00003 	mov	r0, r3
40009190:	e28bd000 	add	sp, fp, #0
40009194:	e8bd0800 	pop	{fp}
40009198:	e12fff1e 	bx	lr
4000919c:	0000ffff 	.word	0x0000ffff
400091a0:	13860000 	.word	0x13860000

400091a4 <stop>:
400091a4:	e92d4800 	push	{fp, lr}
400091a8:	e28db004 	add	fp, sp, #4
400091ac:	e24dd008 	sub	sp, sp, #8
400091b0:	e3a03a01 	mov	r3, #4096	; 0x1000
400091b4:	e50b3008 	str	r3, [fp, #-8]
400091b8:	e59f303c 	ldr	r3, [pc, #60]	; 400091fc <stop+0x58>
400091bc:	e3a020d0 	mov	r2, #208	; 0xd0
400091c0:	e5832000 	str	r2, [r3]
400091c4:	ebffffcd 	bl	40009100 <clear_pending>
400091c8:	e1a00000 	nop			; (mov r0, r0)
400091cc:	e51b3008 	ldr	r3, [fp, #-8]
400091d0:	e3530000 	cmp	r3, #0
400091d4:	03a03000 	moveq	r3, #0
400091d8:	13a03001 	movne	r3, #1
400091dc:	e6ef3073 	uxtb	r3, r3
400091e0:	e51b2008 	ldr	r2, [fp, #-8]
400091e4:	e2422001 	sub	r2, r2, #1
400091e8:	e50b2008 	str	r2, [fp, #-8]
400091ec:	e3530000 	cmp	r3, #0
400091f0:	1afffff5 	bne	400091cc <stop+0x28>
400091f4:	e24bd004 	sub	sp, fp, #4
400091f8:	e8bd8800 	pop	{fp, pc}
400091fc:	13860004 	.word	0x13860004

40009200 <iic_write>:
40009200:	e92d4800 	push	{fp, lr}
40009204:	e28db004 	add	fp, sp, #4
40009208:	e24dd018 	sub	sp, sp, #24
4000920c:	e1a03002 	mov	r3, r2
40009210:	e1a02000 	mov	r2, r0
40009214:	e54b2015 	strb	r2, [fp, #-21]
40009218:	e1a02001 	mov	r2, r1
4000921c:	e54b2016 	strb	r2, [fp, #-22]
40009220:	e54b3017 	strb	r3, [fp, #-23]
40009224:	e55b3016 	ldrb	r3, [fp, #-22]
40009228:	e54b3010 	strb	r3, [fp, #-16]
4000922c:	e55b3017 	ldrb	r3, [fp, #-23]
40009230:	e54b300f 	strb	r3, [fp, #-15]
40009234:	e3e03000 	mvn	r3, #0
40009238:	e50b300c 	str	r3, [fp, #-12]
4000923c:	e59f30fc 	ldr	r3, [pc, #252]	; 40009340 <iic_write+0x140>
40009240:	e55b2015 	ldrb	r2, [fp, #-21]
40009244:	e1a02082 	lsl	r2, r2, #1
40009248:	e5832000 	str	r2, [r3]
4000924c:	e59f30f0 	ldr	r3, [pc, #240]	; 40009344 <iic_write+0x144>
40009250:	e3a020f0 	mov	r2, #240	; 0xf0
40009254:	e5832000 	str	r2, [r3]
40009258:	ebffffa8 	bl	40009100 <clear_pending>
4000925c:	ebffffb2 	bl	4000912c <wait_pend>
40009260:	e1a03000 	mov	r3, r0
40009264:	e3530000 	cmp	r3, #0
40009268:	aa000002 	bge	40009278 <iic_write+0x78>
4000926c:	ebffffcc 	bl	400091a4 <stop>
40009270:	e51b300c 	ldr	r3, [fp, #-12]
40009274:	ea00002e 	b	40009334 <iic_write+0x134>
40009278:	e59f30c4 	ldr	r3, [pc, #196]	; 40009344 <iic_write+0x144>
4000927c:	e5933000 	ldr	r3, [r3]
40009280:	e2033001 	and	r3, r3, #1
40009284:	e6ef3073 	uxtb	r3, r3
40009288:	e3530000 	cmp	r3, #0
4000928c:	0a000002 	beq	4000929c <iic_write+0x9c>
40009290:	ebffffc3 	bl	400091a4 <stop>
40009294:	e51b300c 	ldr	r3, [fp, #-12]
40009298:	ea000025 	b	40009334 <iic_write+0x134>
4000929c:	e3a03000 	mov	r3, #0
400092a0:	e50b3008 	str	r3, [fp, #-8]
400092a4:	ea00001b 	b	40009318 <iic_write+0x118>
400092a8:	e59f3090 	ldr	r3, [pc, #144]	; 40009340 <iic_write+0x140>
400092ac:	e3e0200b 	mvn	r2, #11
400092b0:	e51b1008 	ldr	r1, [fp, #-8]
400092b4:	e24b0004 	sub	r0, fp, #4
400092b8:	e0801001 	add	r1, r0, r1
400092bc:	e0812002 	add	r2, r1, r2
400092c0:	e5d22000 	ldrb	r2, [r2]
400092c4:	e5832000 	str	r2, [r3]
400092c8:	ebffff8c 	bl	40009100 <clear_pending>
400092cc:	ebffff96 	bl	4000912c <wait_pend>
400092d0:	e1a03000 	mov	r3, r0
400092d4:	e3530000 	cmp	r3, #0
400092d8:	aa000002 	bge	400092e8 <iic_write+0xe8>
400092dc:	ebffffb0 	bl	400091a4 <stop>
400092e0:	e51b300c 	ldr	r3, [fp, #-12]
400092e4:	ea000012 	b	40009334 <iic_write+0x134>
400092e8:	e59f3054 	ldr	r3, [pc, #84]	; 40009344 <iic_write+0x144>
400092ec:	e5933000 	ldr	r3, [r3]
400092f0:	e2033001 	and	r3, r3, #1
400092f4:	e6ef3073 	uxtb	r3, r3
400092f8:	e3530000 	cmp	r3, #0
400092fc:	0a000002 	beq	4000930c <iic_write+0x10c>
40009300:	ebffffa7 	bl	400091a4 <stop>
40009304:	e51b300c 	ldr	r3, [fp, #-12]
40009308:	ea000009 	b	40009334 <iic_write+0x134>
4000930c:	e51b3008 	ldr	r3, [fp, #-8]
40009310:	e2833001 	add	r3, r3, #1
40009314:	e50b3008 	str	r3, [fp, #-8]
40009318:	e51b3008 	ldr	r3, [fp, #-8]
4000931c:	e3530001 	cmp	r3, #1
40009320:	9affffe0 	bls	400092a8 <iic_write+0xa8>
40009324:	e3a03000 	mov	r3, #0
40009328:	e50b300c 	str	r3, [fp, #-12]
4000932c:	ebffff9c 	bl	400091a4 <stop>
40009330:	e51b300c 	ldr	r3, [fp, #-12]
40009334:	e1a00003 	mov	r0, r3
40009338:	e24bd004 	sub	sp, fp, #4
4000933c:	e8bd8800 	pop	{fp, pc}
40009340:	1386000c 	.word	0x1386000c
40009344:	13860004 	.word	0x13860004

40009348 <iic_read>:
40009348:	e92d4800 	push	{fp, lr}
4000934c:	e28db004 	add	fp, sp, #4
40009350:	e24dd010 	sub	sp, sp, #16
40009354:	e1a03001 	mov	r3, r1
40009358:	e50b2014 	str	r2, [fp, #-20]
4000935c:	e1a02000 	mov	r2, r0
40009360:	e54b200d 	strb	r2, [fp, #-13]
40009364:	e54b300e 	strb	r3, [fp, #-14]
40009368:	e3e03000 	mvn	r3, #0
4000936c:	e50b3008 	str	r3, [fp, #-8]
40009370:	e59f315c 	ldr	r3, [pc, #348]	; 400094d4 <iic_read+0x18c>
40009374:	e55b200d 	ldrb	r2, [fp, #-13]
40009378:	e1a02082 	lsl	r2, r2, #1
4000937c:	e5832000 	str	r2, [r3]
40009380:	e59f3150 	ldr	r3, [pc, #336]	; 400094d8 <iic_read+0x190>
40009384:	e3a020f0 	mov	r2, #240	; 0xf0
40009388:	e5832000 	str	r2, [r3]
4000938c:	ebffff5b 	bl	40009100 <clear_pending>
40009390:	ebffff65 	bl	4000912c <wait_pend>
40009394:	e1a03000 	mov	r3, r0
40009398:	e3530000 	cmp	r3, #0
4000939c:	aa000002 	bge	400093ac <iic_read+0x64>
400093a0:	ebffff7f 	bl	400091a4 <stop>
400093a4:	e51b3008 	ldr	r3, [fp, #-8]
400093a8:	ea000046 	b	400094c8 <iic_read+0x180>
400093ac:	e59f3124 	ldr	r3, [pc, #292]	; 400094d8 <iic_read+0x190>
400093b0:	e5933000 	ldr	r3, [r3]
400093b4:	e2033001 	and	r3, r3, #1
400093b8:	e6ef3073 	uxtb	r3, r3
400093bc:	e3530000 	cmp	r3, #0
400093c0:	0a000002 	beq	400093d0 <iic_read+0x88>
400093c4:	ebffff76 	bl	400091a4 <stop>
400093c8:	e51b3008 	ldr	r3, [fp, #-8]
400093cc:	ea00003d 	b	400094c8 <iic_read+0x180>
400093d0:	e59f30fc 	ldr	r3, [pc, #252]	; 400094d4 <iic_read+0x18c>
400093d4:	e55b200e 	ldrb	r2, [fp, #-14]
400093d8:	e5832000 	str	r2, [r3]
400093dc:	ebffff47 	bl	40009100 <clear_pending>
400093e0:	ebffff51 	bl	4000912c <wait_pend>
400093e4:	e1a03000 	mov	r3, r0
400093e8:	e3530000 	cmp	r3, #0
400093ec:	aa000002 	bge	400093fc <iic_read+0xb4>
400093f0:	ebffff6b 	bl	400091a4 <stop>
400093f4:	e51b3008 	ldr	r3, [fp, #-8]
400093f8:	ea000032 	b	400094c8 <iic_read+0x180>
400093fc:	e59f30d4 	ldr	r3, [pc, #212]	; 400094d8 <iic_read+0x190>
40009400:	e5933000 	ldr	r3, [r3]
40009404:	e2033001 	and	r3, r3, #1
40009408:	e6ef3073 	uxtb	r3, r3
4000940c:	e3530000 	cmp	r3, #0
40009410:	0a000002 	beq	40009420 <iic_read+0xd8>
40009414:	ebffff62 	bl	400091a4 <stop>
40009418:	e51b3008 	ldr	r3, [fp, #-8]
4000941c:	ea000029 	b	400094c8 <iic_read+0x180>
40009420:	e59f30ac 	ldr	r3, [pc, #172]	; 400094d4 <iic_read+0x18c>
40009424:	e55b200d 	ldrb	r2, [fp, #-13]
40009428:	e1a02082 	lsl	r2, r2, #1
4000942c:	e3822001 	orr	r2, r2, #1
40009430:	e5832000 	str	r2, [r3]
40009434:	e59f309c 	ldr	r3, [pc, #156]	; 400094d8 <iic_read+0x190>
40009438:	e3a020b0 	mov	r2, #176	; 0xb0
4000943c:	e5832000 	str	r2, [r3]
40009440:	ebffff2e 	bl	40009100 <clear_pending>
40009444:	ebffff38 	bl	4000912c <wait_pend>
40009448:	e1a03000 	mov	r3, r0
4000944c:	e3530000 	cmp	r3, #0
40009450:	aa000002 	bge	40009460 <iic_read+0x118>
40009454:	ebffff52 	bl	400091a4 <stop>
40009458:	e51b3008 	ldr	r3, [fp, #-8]
4000945c:	ea000019 	b	400094c8 <iic_read+0x180>
40009460:	e59f3070 	ldr	r3, [pc, #112]	; 400094d8 <iic_read+0x190>
40009464:	e5933000 	ldr	r3, [r3]
40009468:	e2033001 	and	r3, r3, #1
4000946c:	e6ef3073 	uxtb	r3, r3
40009470:	e3530000 	cmp	r3, #0
40009474:	0a000002 	beq	40009484 <iic_read+0x13c>
40009478:	ebffff49 	bl	400091a4 <stop>
4000947c:	e51b3008 	ldr	r3, [fp, #-8]
40009480:	ea000010 	b	400094c8 <iic_read+0x180>
40009484:	ebffff1d 	bl	40009100 <clear_pending>
40009488:	ebffff27 	bl	4000912c <wait_pend>
4000948c:	e1a03000 	mov	r3, r0
40009490:	e3530000 	cmp	r3, #0
40009494:	aa000002 	bge	400094a4 <iic_read+0x15c>
40009498:	ebffff41 	bl	400091a4 <stop>
4000949c:	e51b3008 	ldr	r3, [fp, #-8]
400094a0:	ea000008 	b	400094c8 <iic_read+0x180>
400094a4:	e59f3028 	ldr	r3, [pc, #40]	; 400094d4 <iic_read+0x18c>
400094a8:	e5933000 	ldr	r3, [r3]
400094ac:	e6ef2073 	uxtb	r2, r3
400094b0:	e51b3014 	ldr	r3, [fp, #-20]
400094b4:	e5c32000 	strb	r2, [r3]
400094b8:	e3a03000 	mov	r3, #0
400094bc:	e50b3008 	str	r3, [fp, #-8]
400094c0:	ebffff37 	bl	400091a4 <stop>
400094c4:	e51b3008 	ldr	r3, [fp, #-8]
400094c8:	e1a00003 	mov	r0, r3
400094cc:	e24bd004 	sub	sp, fp, #4
400094d0:	e8bd8800 	pop	{fp, pc}
400094d4:	1386000c 	.word	0x1386000c
400094d8:	13860004 	.word	0x13860004
