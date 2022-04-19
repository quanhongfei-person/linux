
arm:     file format elf32-littlearm


Disassembly of section .text:

40008000 <_start>:
40008000:	ea000012 	b	40008050 <reset>
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
40008038:	40008048 	.word	0x40008048

4000803c <software_interrupt>:
4000803c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008040:	eb00001e 	bl	400080c0 <do_svc>
40008044:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

40008048 <_bss_start>:
40008048:	400088e4 	.word	0x400088e4

4000804c <_bss_end>:
4000804c:	400088e8 	.word	0x400088e8

40008050 <reset>:
40008050:	e59f001c 	ldr	r0, [pc, #28]	; 40008074 <bss_clear+0x10>
40008054:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}

40008058 <clear_bss>:
40008058:	e3a00000 	mov	r0, #0
4000805c:	e51f101c 	ldr	r1, [pc, #-28]	; 40008048 <_bss_start>
40008060:	e51f201c 	ldr	r2, [pc, #-28]	; 4000804c <_bss_end>

40008064 <bss_clear>:
40008064:	e4810004 	str	r0, [r1], #4
40008068:	e1510002 	cmp	r1, r2
4000806c:	1afffffc 	bne	40008064 <bss_clear>
40008070:	ea000018 	b	400080d8 <main>
40008074:	40008000 	.word	0x40008000

40008078 <delay>:
40008078:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000807c:	e28db000 	add	fp, sp, #0
40008080:	e24dd00c 	sub	sp, sp, #12
40008084:	e50b0008 	str	r0, [fp, #-8]
40008088:	e1a00000 	nop			; (mov r0, r0)
4000808c:	e51b3008 	ldr	r3, [fp, #-8]
40008090:	e3530000 	cmp	r3, #0
40008094:	03a03000 	moveq	r3, #0
40008098:	13a03001 	movne	r3, #1
4000809c:	e6ef3073 	uxtb	r3, r3
400080a0:	e51b2008 	ldr	r2, [fp, #-8]
400080a4:	e2422001 	sub	r2, r2, #1
400080a8:	e50b2008 	str	r2, [fp, #-8]
400080ac:	e3530000 	cmp	r3, #0
400080b0:	1afffff5 	bne	4000808c <delay+0x14>
400080b4:	e28bd000 	add	sp, fp, #0
400080b8:	e8bd0800 	pop	{fp}
400080bc:	e12fff1e 	bx	lr

400080c0 <do_svc>:
400080c0:	e92d4800 	push	{fp, lr}
400080c4:	e28db004 	add	fp, sp, #4
400080c8:	e59f0004 	ldr	r0, [pc, #4]	; 400080d4 <do_svc+0x14>
400080cc:	eb000141 	bl	400085d8 <uprintf>
400080d0:	e8bd8800 	pop	{fp, pc}
400080d4:	400088d4 	.word	0x400088d4

400080d8 <main>:
400080d8:	e92d4800 	push	{fp, lr}
400080dc:	e28db004 	add	fp, sp, #4
400080e0:	e24dd008 	sub	sp, sp, #8
400080e4:	e3a03061 	mov	r3, #97	; 0x61
400080e8:	e54b3005 	strb	r3, [fp, #-5]
400080ec:	eb00004f 	bl	40008230 <uart_init>
400080f0:	eb0001b7 	bl	400087d4 <pwm0_init>
400080f4:	ef00000c 	svc	0x0000000c
400080f8:	e24bd004 	sub	sp, fp, #4
400080fc:	e8bd8800 	pop	{fp, pc}

40008100 <beep_init>:
40008100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008104:	e28db000 	add	fp, sp, #0
40008108:	e59f302c 	ldr	r3, [pc, #44]	; 4000813c <beep_init+0x3c>
4000810c:	e59f2028 	ldr	r2, [pc, #40]	; 4000813c <beep_init+0x3c>
40008110:	e5922000 	ldr	r2, [r2]
40008114:	e3c2200f 	bic	r2, r2, #15
40008118:	e5832000 	str	r2, [r3]
4000811c:	e59f3018 	ldr	r3, [pc, #24]	; 4000813c <beep_init+0x3c>
40008120:	e59f2014 	ldr	r2, [pc, #20]	; 4000813c <beep_init+0x3c>
40008124:	e5922000 	ldr	r2, [r2]
40008128:	e3822001 	orr	r2, r2, #1
4000812c:	e5832000 	str	r2, [r3]
40008130:	e28bd000 	add	sp, fp, #0
40008134:	e8bd0800 	pop	{fp}
40008138:	e12fff1e 	bx	lr
4000813c:	114000a0 	.word	0x114000a0

40008140 <beep_on>:
40008140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008144:	e28db000 	add	fp, sp, #0
40008148:	e59f3018 	ldr	r3, [pc, #24]	; 40008168 <beep_on+0x28>
4000814c:	e59f2014 	ldr	r2, [pc, #20]	; 40008168 <beep_on+0x28>
40008150:	e5922000 	ldr	r2, [r2]
40008154:	e3822001 	orr	r2, r2, #1
40008158:	e5832000 	str	r2, [r3]
4000815c:	e28bd000 	add	sp, fp, #0
40008160:	e8bd0800 	pop	{fp}
40008164:	e12fff1e 	bx	lr
40008168:	114000a4 	.word	0x114000a4

4000816c <beep_off>:
4000816c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008170:	e28db000 	add	fp, sp, #0
40008174:	e59f3018 	ldr	r3, [pc, #24]	; 40008194 <beep_off+0x28>
40008178:	e59f2014 	ldr	r2, [pc, #20]	; 40008194 <beep_off+0x28>
4000817c:	e5922000 	ldr	r2, [r2]
40008180:	e3c22001 	bic	r2, r2, #1
40008184:	e5832000 	str	r2, [r3]
40008188:	e28bd000 	add	sp, fp, #0
4000818c:	e8bd0800 	pop	{fp}
40008190:	e12fff1e 	bx	lr
40008194:	114000a4 	.word	0x114000a4

40008198 <led_init>:
40008198:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000819c:	e28db000 	add	fp, sp, #0
400081a0:	e59f302c 	ldr	r3, [pc, #44]	; 400081d4 <led_init+0x3c>
400081a4:	e59f2028 	ldr	r2, [pc, #40]	; 400081d4 <led_init+0x3c>
400081a8:	e5922000 	ldr	r2, [r2]
400081ac:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
400081b0:	e5832000 	str	r2, [r3]
400081b4:	e59f3018 	ldr	r3, [pc, #24]	; 400081d4 <led_init+0x3c>
400081b8:	e59f2014 	ldr	r2, [pc, #20]	; 400081d4 <led_init+0x3c>
400081bc:	e5922000 	ldr	r2, [r2]
400081c0:	e3822a01 	orr	r2, r2, #4096	; 0x1000
400081c4:	e5832000 	str	r2, [r3]
400081c8:	e28bd000 	add	sp, fp, #0
400081cc:	e8bd0800 	pop	{fp}
400081d0:	e12fff1e 	bx	lr
400081d4:	110002e0 	.word	0x110002e0

400081d8 <led_on>:
400081d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081dc:	e28db000 	add	fp, sp, #0
400081e0:	e59f3018 	ldr	r3, [pc, #24]	; 40008200 <led_on+0x28>
400081e4:	e59f2014 	ldr	r2, [pc, #20]	; 40008200 <led_on+0x28>
400081e8:	e5922000 	ldr	r2, [r2]
400081ec:	e3c22008 	bic	r2, r2, #8
400081f0:	e5832000 	str	r2, [r3]
400081f4:	e28bd000 	add	sp, fp, #0
400081f8:	e8bd0800 	pop	{fp}
400081fc:	e12fff1e 	bx	lr
40008200:	110002e4 	.word	0x110002e4

40008204 <led_off>:
40008204:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008208:	e28db000 	add	fp, sp, #0
4000820c:	e59f3018 	ldr	r3, [pc, #24]	; 4000822c <led_off+0x28>
40008210:	e59f2014 	ldr	r2, [pc, #20]	; 4000822c <led_off+0x28>
40008214:	e5922000 	ldr	r2, [r2]
40008218:	e3822008 	orr	r2, r2, #8
4000821c:	e5832000 	str	r2, [r3]
40008220:	e28bd000 	add	sp, fp, #0
40008224:	e8bd0800 	pop	{fp}
40008228:	e12fff1e 	bx	lr
4000822c:	110002e4 	.word	0x110002e4

40008230 <uart_init>:
40008230:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008234:	e28db000 	add	fp, sp, #0
40008238:	e3a03545 	mov	r3, #289406976	; 0x11400000
4000823c:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008240:	e5922000 	ldr	r2, [r2]
40008244:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008248:	e5832000 	str	r2, [r3]
4000824c:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008250:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008254:	e5922000 	ldr	r2, [r2]
40008258:	e3822022 	orr	r2, r2, #34	; 0x22
4000825c:	e5832000 	str	r2, [r3]
40008260:	e3a0354e 	mov	r3, #327155712	; 0x13800000
40008264:	e3a02003 	mov	r2, #3
40008268:	e5832000 	str	r2, [r3]
4000826c:	e59f3028 	ldr	r3, [pc, #40]	; 4000829c <uart_init+0x6c>
40008270:	e3a02005 	mov	r2, #5
40008274:	e5832000 	str	r2, [r3]
40008278:	e59f3020 	ldr	r3, [pc, #32]	; 400082a0 <uart_init+0x70>
4000827c:	e3a02035 	mov	r2, #53	; 0x35
40008280:	e5832000 	str	r2, [r3]
40008284:	e59f3018 	ldr	r3, [pc, #24]	; 400082a4 <uart_init+0x74>
40008288:	e3a02004 	mov	r2, #4
4000828c:	e5832000 	str	r2, [r3]
40008290:	e28bd000 	add	sp, fp, #0
40008294:	e8bd0800 	pop	{fp}
40008298:	e12fff1e 	bx	lr
4000829c:	13800004 	.word	0x13800004
400082a0:	13800028 	.word	0x13800028
400082a4:	1380002c 	.word	0x1380002c

400082a8 <uart_send>:
400082a8:	e92d4800 	push	{fp, lr}
400082ac:	e28db004 	add	fp, sp, #4
400082b0:	e24dd008 	sub	sp, sp, #8
400082b4:	e1a03000 	mov	r3, r0
400082b8:	e54b3005 	strb	r3, [fp, #-5]
400082bc:	e1a00000 	nop			; (mov r0, r0)
400082c0:	e59f3034 	ldr	r3, [pc, #52]	; 400082fc <uart_send+0x54>
400082c4:	e5933000 	ldr	r3, [r3]
400082c8:	e2033002 	and	r3, r3, #2
400082cc:	e3530000 	cmp	r3, #0
400082d0:	0afffffa 	beq	400082c0 <uart_send+0x18>
400082d4:	e59f3024 	ldr	r3, [pc, #36]	; 40008300 <uart_send+0x58>
400082d8:	e55b2005 	ldrb	r2, [fp, #-5]
400082dc:	e5832000 	str	r2, [r3]
400082e0:	e55b3005 	ldrb	r3, [fp, #-5]
400082e4:	e353000a 	cmp	r3, #10
400082e8:	1a000001 	bne	400082f4 <uart_send+0x4c>
400082ec:	e3a0000d 	mov	r0, #13
400082f0:	ebffffec 	bl	400082a8 <uart_send>
400082f4:	e24bd004 	sub	sp, fp, #4
400082f8:	e8bd8800 	pop	{fp, pc}
400082fc:	13800010 	.word	0x13800010
40008300:	13800020 	.word	0x13800020

40008304 <puts_>:
40008304:	e92d4800 	push	{fp, lr}
40008308:	e28db004 	add	fp, sp, #4
4000830c:	e24dd008 	sub	sp, sp, #8
40008310:	e50b0008 	str	r0, [fp, #-8]
40008314:	ea000006 	b	40008334 <puts_+0x30>
40008318:	e51b3008 	ldr	r3, [fp, #-8]
4000831c:	e5d33000 	ldrb	r3, [r3]
40008320:	e1a00003 	mov	r0, r3
40008324:	ebffffdf 	bl	400082a8 <uart_send>
40008328:	e51b3008 	ldr	r3, [fp, #-8]
4000832c:	e2833001 	add	r3, r3, #1
40008330:	e50b3008 	str	r3, [fp, #-8]
40008334:	e51b3008 	ldr	r3, [fp, #-8]
40008338:	e5d33000 	ldrb	r3, [r3]
4000833c:	e3530000 	cmp	r3, #0
40008340:	1afffff4 	bne	40008318 <puts_+0x14>
40008344:	e24bd004 	sub	sp, fp, #4
40008348:	e8bd8800 	pop	{fp, pc}

4000834c <uart_rev>:
4000834c:	e92d4800 	push	{fp, lr}
40008350:	e28db004 	add	fp, sp, #4
40008354:	e24dd008 	sub	sp, sp, #8
40008358:	e1a00000 	nop			; (mov r0, r0)
4000835c:	e59f3034 	ldr	r3, [pc, #52]	; 40008398 <uart_rev+0x4c>
40008360:	e5933000 	ldr	r3, [r3]
40008364:	e2033001 	and	r3, r3, #1
40008368:	e3530000 	cmp	r3, #0
4000836c:	0afffffa 	beq	4000835c <uart_rev+0x10>
40008370:	e59f3024 	ldr	r3, [pc, #36]	; 4000839c <uart_rev+0x50>
40008374:	e5933000 	ldr	r3, [r3]
40008378:	e54b3005 	strb	r3, [fp, #-5]
4000837c:	e55b3005 	ldrb	r3, [fp, #-5]
40008380:	e1a00003 	mov	r0, r3
40008384:	ebffffc7 	bl	400082a8 <uart_send>
40008388:	e55b3005 	ldrb	r3, [fp, #-5]
4000838c:	e1a00003 	mov	r0, r3
40008390:	e24bd004 	sub	sp, fp, #4
40008394:	e8bd8800 	pop	{fp, pc}
40008398:	13800010 	.word	0x13800010
4000839c:	13800024 	.word	0x13800024

400083a0 <itod>:
400083a0:	e92d4800 	push	{fp, lr}
400083a4:	e28db004 	add	fp, sp, #4
400083a8:	e24dd010 	sub	sp, sp, #16
400083ac:	e50b0010 	str	r0, [fp, #-16]
400083b0:	e50b1014 	str	r1, [fp, #-20]
400083b4:	e51b3010 	ldr	r3, [fp, #-16]
400083b8:	e3530009 	cmp	r3, #9
400083bc:	8a00000a 	bhi	400083ec <itod+0x4c>
400083c0:	e51b3010 	ldr	r3, [fp, #-16]
400083c4:	e6ef3073 	uxtb	r3, r3
400083c8:	e2833030 	add	r3, r3, #48	; 0x30
400083cc:	e6ef2073 	uxtb	r2, r3
400083d0:	e51b3014 	ldr	r3, [fp, #-20]
400083d4:	e5c32000 	strb	r2, [r3]
400083d8:	e51b3014 	ldr	r3, [fp, #-20]
400083dc:	e2833001 	add	r3, r3, #1
400083e0:	e3a02000 	mov	r2, #0
400083e4:	e5c32000 	strb	r2, [r3]
400083e8:	ea000028 	b	40008490 <itod+0xf0>
400083ec:	e51b2010 	ldr	r2, [fp, #-16]
400083f0:	e59f30a0 	ldr	r3, [pc, #160]	; 40008498 <itod+0xf8>
400083f4:	e0831293 	umull	r1, r3, r3, r2
400083f8:	e1a031a3 	lsr	r3, r3, #3
400083fc:	e1a00003 	mov	r0, r3
40008400:	e51b1014 	ldr	r1, [fp, #-20]
40008404:	ebffffe5 	bl	400083a0 <itod>
40008408:	e3a03000 	mov	r3, #0
4000840c:	e50b3008 	str	r3, [fp, #-8]
40008410:	ea000002 	b	40008420 <itod+0x80>
40008414:	e51b3008 	ldr	r3, [fp, #-8]
40008418:	e2833001 	add	r3, r3, #1
4000841c:	e50b3008 	str	r3, [fp, #-8]
40008420:	e51b3008 	ldr	r3, [fp, #-8]
40008424:	e51b2014 	ldr	r2, [fp, #-20]
40008428:	e0823003 	add	r3, r2, r3
4000842c:	e5d33000 	ldrb	r3, [r3]
40008430:	e3530000 	cmp	r3, #0
40008434:	1afffff6 	bne	40008414 <itod+0x74>
40008438:	e51b3008 	ldr	r3, [fp, #-8]
4000843c:	e51b2014 	ldr	r2, [fp, #-20]
40008440:	e0820003 	add	r0, r2, r3
40008444:	e51b1010 	ldr	r1, [fp, #-16]
40008448:	e59f3048 	ldr	r3, [pc, #72]	; 40008498 <itod+0xf8>
4000844c:	e0832193 	umull	r2, r3, r3, r1
40008450:	e1a021a3 	lsr	r2, r3, #3
40008454:	e1a03002 	mov	r3, r2
40008458:	e1a03103 	lsl	r3, r3, #2
4000845c:	e0833002 	add	r3, r3, r2
40008460:	e1a03083 	lsl	r3, r3, #1
40008464:	e0632001 	rsb	r2, r3, r1
40008468:	e6ef3072 	uxtb	r3, r2
4000846c:	e2833030 	add	r3, r3, #48	; 0x30
40008470:	e6ef3073 	uxtb	r3, r3
40008474:	e5c03000 	strb	r3, [r0]
40008478:	e51b3008 	ldr	r3, [fp, #-8]
4000847c:	e2833001 	add	r3, r3, #1
40008480:	e51b2014 	ldr	r2, [fp, #-20]
40008484:	e0823003 	add	r3, r2, r3
40008488:	e3a02000 	mov	r2, #0
4000848c:	e5c32000 	strb	r2, [r3]
40008490:	e24bd004 	sub	sp, fp, #4
40008494:	e8bd8800 	pop	{fp, pc}
40008498:	cccccccd 	.word	0xcccccccd

4000849c <itox>:
4000849c:	e92d4800 	push	{fp, lr}
400084a0:	e28db004 	add	fp, sp, #4
400084a4:	e24dd010 	sub	sp, sp, #16
400084a8:	e50b0010 	str	r0, [fp, #-16]
400084ac:	e50b1014 	str	r1, [fp, #-20]
400084b0:	e51b3010 	ldr	r3, [fp, #-16]
400084b4:	e353000f 	cmp	r3, #15
400084b8:	8a000014 	bhi	40008510 <itox+0x74>
400084bc:	e51b3010 	ldr	r3, [fp, #-16]
400084c0:	e3530009 	cmp	r3, #9
400084c4:	9a000006 	bls	400084e4 <itox+0x48>
400084c8:	e51b3010 	ldr	r3, [fp, #-16]
400084cc:	e6ef3073 	uxtb	r3, r3
400084d0:	e2833057 	add	r3, r3, #87	; 0x57
400084d4:	e6ef2073 	uxtb	r2, r3
400084d8:	e51b3014 	ldr	r3, [fp, #-20]
400084dc:	e5c32000 	strb	r2, [r3]
400084e0:	ea000005 	b	400084fc <itox+0x60>
400084e4:	e51b3010 	ldr	r3, [fp, #-16]
400084e8:	e6ef3073 	uxtb	r3, r3
400084ec:	e2833030 	add	r3, r3, #48	; 0x30
400084f0:	e6ef2073 	uxtb	r2, r3
400084f4:	e51b3014 	ldr	r3, [fp, #-20]
400084f8:	e5c32000 	strb	r2, [r3]
400084fc:	e51b3014 	ldr	r3, [fp, #-20]
40008500:	e2833001 	add	r3, r3, #1
40008504:	e3a02000 	mov	r2, #0
40008508:	e5c32000 	strb	r2, [r3]
4000850c:	ea00002f 	b	400085d0 <itox+0x134>
40008510:	e51b3010 	ldr	r3, [fp, #-16]
40008514:	e1a03223 	lsr	r3, r3, #4
40008518:	e1a00003 	mov	r0, r3
4000851c:	e51b1014 	ldr	r1, [fp, #-20]
40008520:	ebffffdd 	bl	4000849c <itox>
40008524:	e3a03000 	mov	r3, #0
40008528:	e50b3008 	str	r3, [fp, #-8]
4000852c:	ea000002 	b	4000853c <itox+0xa0>
40008530:	e51b3008 	ldr	r3, [fp, #-8]
40008534:	e2833001 	add	r3, r3, #1
40008538:	e50b3008 	str	r3, [fp, #-8]
4000853c:	e51b3008 	ldr	r3, [fp, #-8]
40008540:	e51b2014 	ldr	r2, [fp, #-20]
40008544:	e0823003 	add	r3, r2, r3
40008548:	e5d33000 	ldrb	r3, [r3]
4000854c:	e3530000 	cmp	r3, #0
40008550:	1afffff6 	bne	40008530 <itox+0x94>
40008554:	e51b3010 	ldr	r3, [fp, #-16]
40008558:	e203300f 	and	r3, r3, #15
4000855c:	e3530009 	cmp	r3, #9
40008560:	9a00000a 	bls	40008590 <itox+0xf4>
40008564:	e51b3008 	ldr	r3, [fp, #-8]
40008568:	e51b2014 	ldr	r2, [fp, #-20]
4000856c:	e0823003 	add	r3, r2, r3
40008570:	e51b2010 	ldr	r2, [fp, #-16]
40008574:	e6ef2072 	uxtb	r2, r2
40008578:	e202200f 	and	r2, r2, #15
4000857c:	e6ef2072 	uxtb	r2, r2
40008580:	e2822057 	add	r2, r2, #87	; 0x57
40008584:	e6ef2072 	uxtb	r2, r2
40008588:	e5c32000 	strb	r2, [r3]
4000858c:	ea000009 	b	400085b8 <itox+0x11c>
40008590:	e51b3008 	ldr	r3, [fp, #-8]
40008594:	e51b2014 	ldr	r2, [fp, #-20]
40008598:	e0823003 	add	r3, r2, r3
4000859c:	e51b2010 	ldr	r2, [fp, #-16]
400085a0:	e6ef2072 	uxtb	r2, r2
400085a4:	e202200f 	and	r2, r2, #15
400085a8:	e6ef2072 	uxtb	r2, r2
400085ac:	e2822030 	add	r2, r2, #48	; 0x30
400085b0:	e6ef2072 	uxtb	r2, r2
400085b4:	e5c32000 	strb	r2, [r3]
400085b8:	e51b3008 	ldr	r3, [fp, #-8]
400085bc:	e2833001 	add	r3, r3, #1
400085c0:	e51b2014 	ldr	r2, [fp, #-20]
400085c4:	e0823003 	add	r3, r2, r3
400085c8:	e3a02000 	mov	r2, #0
400085cc:	e5c32000 	strb	r2, [r3]
400085d0:	e24bd004 	sub	sp, fp, #4
400085d4:	e8bd8800 	pop	{fp, pc}

400085d8 <uprintf>:
400085d8:	e92d000f 	push	{r0, r1, r2, r3}
400085dc:	e92d4800 	push	{fp, lr}
400085e0:	e28db004 	add	fp, sp, #4
400085e4:	e24dd028 	sub	sp, sp, #40	; 0x28
400085e8:	e28b3004 	add	r3, fp, #4
400085ec:	e2833004 	add	r3, r3, #4
400085f0:	e50b300c 	str	r3, [fp, #-12]
400085f4:	ea00006a 	b	400087a4 <uprintf+0x1cc>
400085f8:	e59b3004 	ldr	r3, [fp, #4]
400085fc:	e5d33000 	ldrb	r3, [r3]
40008600:	e3530025 	cmp	r3, #37	; 0x25
40008604:	0a000004 	beq	4000861c <uprintf+0x44>
40008608:	e59b3004 	ldr	r3, [fp, #4]
4000860c:	e5d33000 	ldrb	r3, [r3]
40008610:	e1a00003 	mov	r0, r3
40008614:	ebffff23 	bl	400082a8 <uart_send>
40008618:	ea00005e 	b	40008798 <uprintf+0x1c0>
4000861c:	e59b3004 	ldr	r3, [fp, #4]
40008620:	e2833001 	add	r3, r3, #1
40008624:	e58b3004 	str	r3, [fp, #4]
40008628:	e59b3004 	ldr	r3, [fp, #4]
4000862c:	e5d33000 	ldrb	r3, [r3]
40008630:	e2433063 	sub	r3, r3, #99	; 0x63
40008634:	e3530015 	cmp	r3, #21
40008638:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
4000863c:	ea000054 	b	40008794 <uprintf+0x1bc>
40008640:	40008698 	.word	0x40008698
40008644:	400086ec 	.word	0x400086ec
40008648:	40008794 	.word	0x40008794
4000864c:	40008794 	.word	0x40008794
40008650:	40008794 	.word	0x40008794
40008654:	40008794 	.word	0x40008794
40008658:	40008794 	.word	0x40008794
4000865c:	40008794 	.word	0x40008794
40008660:	40008794 	.word	0x40008794
40008664:	40008794 	.word	0x40008794
40008668:	40008794 	.word	0x40008794
4000866c:	40008794 	.word	0x40008794
40008670:	40008794 	.word	0x40008794
40008674:	40008794 	.word	0x40008794
40008678:	40008794 	.word	0x40008794
4000867c:	40008794 	.word	0x40008794
40008680:	400086c4 	.word	0x400086c4
40008684:	40008794 	.word	0x40008794
40008688:	40008794 	.word	0x40008794
4000868c:	40008794 	.word	0x40008794
40008690:	40008794 	.word	0x40008794
40008694:	40008750 	.word	0x40008750
40008698:	e51b300c 	ldr	r3, [fp, #-12]
4000869c:	e5933000 	ldr	r3, [r3]
400086a0:	e50b3010 	str	r3, [fp, #-16]
400086a4:	e51b300c 	ldr	r3, [fp, #-12]
400086a8:	e2833004 	add	r3, r3, #4
400086ac:	e50b300c 	str	r3, [fp, #-12]
400086b0:	e51b3010 	ldr	r3, [fp, #-16]
400086b4:	e6ef3073 	uxtb	r3, r3
400086b8:	e1a00003 	mov	r0, r3
400086bc:	ebfffef9 	bl	400082a8 <uart_send>
400086c0:	ea000034 	b	40008798 <uprintf+0x1c0>
400086c4:	e51b300c 	ldr	r3, [fp, #-12]
400086c8:	e5933000 	ldr	r3, [r3]
400086cc:	e50b3014 	str	r3, [fp, #-20]
400086d0:	e51b300c 	ldr	r3, [fp, #-12]
400086d4:	e2833004 	add	r3, r3, #4
400086d8:	e50b300c 	str	r3, [fp, #-12]
400086dc:	e51b3014 	ldr	r3, [fp, #-20]
400086e0:	e1a00003 	mov	r0, r3
400086e4:	ebffff06 	bl	40008304 <puts_>
400086e8:	ea00002a 	b	40008798 <uprintf+0x1c0>
400086ec:	e51b300c 	ldr	r3, [fp, #-12]
400086f0:	e5933000 	ldr	r3, [r3]
400086f4:	e50b3018 	str	r3, [fp, #-24]
400086f8:	e51b300c 	ldr	r3, [fp, #-12]
400086fc:	e2833004 	add	r3, r3, #4
40008700:	e50b300c 	str	r3, [fp, #-12]
40008704:	e51b3018 	ldr	r3, [fp, #-24]
40008708:	e50b3008 	str	r3, [fp, #-8]
4000870c:	e51b3008 	ldr	r3, [fp, #-8]
40008710:	e3530000 	cmp	r3, #0
40008714:	aa000004 	bge	4000872c <uprintf+0x154>
40008718:	e3a0002d 	mov	r0, #45	; 0x2d
4000871c:	ebfffee1 	bl	400082a8 <uart_send>
40008720:	e51b3008 	ldr	r3, [fp, #-8]
40008724:	e2633000 	rsb	r3, r3, #0
40008728:	e50b3008 	str	r3, [fp, #-8]
4000872c:	e51b2008 	ldr	r2, [fp, #-8]
40008730:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008734:	e1a00002 	mov	r0, r2
40008738:	e1a01003 	mov	r1, r3
4000873c:	ebffff17 	bl	400083a0 <itod>
40008740:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008744:	e1a00003 	mov	r0, r3
40008748:	ebfffeed 	bl	40008304 <puts_>
4000874c:	ea000011 	b	40008798 <uprintf+0x1c0>
40008750:	e51b300c 	ldr	r3, [fp, #-12]
40008754:	e5933000 	ldr	r3, [r3]
40008758:	e50b301c 	str	r3, [fp, #-28]
4000875c:	e51b300c 	ldr	r3, [fp, #-12]
40008760:	e2833004 	add	r3, r3, #4
40008764:	e50b300c 	str	r3, [fp, #-12]
40008768:	e51b301c 	ldr	r3, [fp, #-28]
4000876c:	e50b3008 	str	r3, [fp, #-8]
40008770:	e51b2008 	ldr	r2, [fp, #-8]
40008774:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008778:	e1a00002 	mov	r0, r2
4000877c:	e1a01003 	mov	r1, r3
40008780:	ebffff45 	bl	4000849c <itox>
40008784:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008788:	e1a00003 	mov	r0, r3
4000878c:	ebfffedc 	bl	40008304 <puts_>
40008790:	ea000000 	b	40008798 <uprintf+0x1c0>
40008794:	e1a00000 	nop			; (mov r0, r0)
40008798:	e59b3004 	ldr	r3, [fp, #4]
4000879c:	e2833001 	add	r3, r3, #1
400087a0:	e58b3004 	str	r3, [fp, #4]
400087a4:	e59b3004 	ldr	r3, [fp, #4]
400087a8:	e5d33000 	ldrb	r3, [r3]
400087ac:	e3530000 	cmp	r3, #0
400087b0:	1affff90 	bne	400085f8 <uprintf+0x20>
400087b4:	e3a03000 	mov	r3, #0
400087b8:	e50b300c 	str	r3, [fp, #-12]
400087bc:	e3a03000 	mov	r3, #0
400087c0:	e1a00003 	mov	r0, r3
400087c4:	e24bd004 	sub	sp, fp, #4
400087c8:	e8bd4800 	pop	{fp, lr}
400087cc:	e28dd010 	add	sp, sp, #16
400087d0:	e12fff1e 	bx	lr

400087d4 <pwm0_init>:
400087d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400087d8:	e28db000 	add	fp, sp, #0
400087dc:	e59f30d8 	ldr	r3, [pc, #216]	; 400088bc <pwm0_init+0xe8>
400087e0:	e59f20d4 	ldr	r2, [pc, #212]	; 400088bc <pwm0_init+0xe8>
400087e4:	e5922000 	ldr	r2, [r2]
400087e8:	e3c2200f 	bic	r2, r2, #15
400087ec:	e5832000 	str	r2, [r3]
400087f0:	e59f30c4 	ldr	r3, [pc, #196]	; 400088bc <pwm0_init+0xe8>
400087f4:	e59f20c0 	ldr	r2, [pc, #192]	; 400088bc <pwm0_init+0xe8>
400087f8:	e5922000 	ldr	r2, [r2]
400087fc:	e3822002 	orr	r2, r2, #2
40008800:	e5832000 	str	r2, [r3]
40008804:	e59f30b4 	ldr	r3, [pc, #180]	; 400088c0 <pwm0_init+0xec>
40008808:	e59f20b0 	ldr	r2, [pc, #176]	; 400088c0 <pwm0_init+0xec>
4000880c:	e5922000 	ldr	r2, [r2]
40008810:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008814:	e5832000 	str	r2, [r3]
40008818:	e59f30a0 	ldr	r3, [pc, #160]	; 400088c0 <pwm0_init+0xec>
4000881c:	e59f209c 	ldr	r2, [pc, #156]	; 400088c0 <pwm0_init+0xec>
40008820:	e5922000 	ldr	r2, [r2]
40008824:	e3822031 	orr	r2, r2, #49	; 0x31
40008828:	e5832000 	str	r2, [r3]
4000882c:	e59f3090 	ldr	r3, [pc, #144]	; 400088c4 <pwm0_init+0xf0>
40008830:	e59f208c 	ldr	r2, [pc, #140]	; 400088c4 <pwm0_init+0xf0>
40008834:	e5922000 	ldr	r2, [r2]
40008838:	e3c2200f 	bic	r2, r2, #15
4000883c:	e5832000 	str	r2, [r3]
40008840:	e59f307c 	ldr	r3, [pc, #124]	; 400088c4 <pwm0_init+0xf0>
40008844:	e59f2078 	ldr	r2, [pc, #120]	; 400088c4 <pwm0_init+0xf0>
40008848:	e5922000 	ldr	r2, [r2]
4000884c:	e3822001 	orr	r2, r2, #1
40008850:	e5832000 	str	r2, [r3]
40008854:	e59f306c 	ldr	r3, [pc, #108]	; 400088c8 <pwm0_init+0xf4>
40008858:	e3a02ffa 	mov	r2, #1000	; 0x3e8
4000885c:	e5832000 	str	r2, [r3]
40008860:	e59f3064 	ldr	r3, [pc, #100]	; 400088cc <pwm0_init+0xf8>
40008864:	e59f205c 	ldr	r2, [pc, #92]	; 400088c8 <pwm0_init+0xf4>
40008868:	e5922000 	ldr	r2, [r2]
4000886c:	e1a020a2 	lsr	r2, r2, #1
40008870:	e5832000 	str	r2, [r3]
40008874:	e59f3054 	ldr	r3, [pc, #84]	; 400088d0 <pwm0_init+0xfc>
40008878:	e59f2050 	ldr	r2, [pc, #80]	; 400088d0 <pwm0_init+0xfc>
4000887c:	e5922000 	ldr	r2, [r2]
40008880:	e3822002 	orr	r2, r2, #2
40008884:	e5832000 	str	r2, [r3]
40008888:	e59f3040 	ldr	r3, [pc, #64]	; 400088d0 <pwm0_init+0xfc>
4000888c:	e59f203c 	ldr	r2, [pc, #60]	; 400088d0 <pwm0_init+0xfc>
40008890:	e5922000 	ldr	r2, [r2]
40008894:	e3c22002 	bic	r2, r2, #2
40008898:	e5832000 	str	r2, [r3]
4000889c:	e59f302c 	ldr	r3, [pc, #44]	; 400088d0 <pwm0_init+0xfc>
400088a0:	e59f2028 	ldr	r2, [pc, #40]	; 400088d0 <pwm0_init+0xfc>
400088a4:	e5922000 	ldr	r2, [r2]
400088a8:	e3822009 	orr	r2, r2, #9
400088ac:	e5832000 	str	r2, [r3]
400088b0:	e28bd000 	add	sp, fp, #0
400088b4:	e8bd0800 	pop	{fp}
400088b8:	e12fff1e 	bx	lr
400088bc:	114000a0 	.word	0x114000a0
400088c0:	139d0000 	.word	0x139d0000
400088c4:	139d0004 	.word	0x139d0004
400088c8:	139d000c 	.word	0x139d000c
400088cc:	139d0010 	.word	0x139d0010
400088d0:	139d0008 	.word	0x139d0008
