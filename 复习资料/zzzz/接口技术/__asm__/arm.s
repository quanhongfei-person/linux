
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
40008048:	40008928 	.word	0x40008928

4000804c <_bss_end>:
4000804c:	4000892c 	.word	0x4000892c

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
400080cc:	eb00014f 	bl	40008610 <uprintf>
400080d0:	e8bd8800 	pop	{fp, pc}
400080d4:	4000890c 	.word	0x4000890c

400080d8 <main>:
400080d8:	e92d4830 	push	{r4, r5, fp, lr}
400080dc:	e28db00c 	add	fp, sp, #12
400080e0:	e24dd010 	sub	sp, sp, #16
400080e4:	e3a03061 	mov	r3, #97	; 0x61
400080e8:	e54b300d 	strb	r3, [fp, #-13]
400080ec:	e3a03064 	mov	r3, #100	; 0x64
400080f0:	e50b3014 	str	r3, [fp, #-20]
400080f4:	e3e03000 	mvn	r3, #0
400080f8:	e50b3018 	str	r3, [fp, #-24]
400080fc:	eb000059 	bl	40008268 <uart_init>
40008100:	eb0001c1 	bl	4000880c <pwm0_init>
40008104:	e51b3014 	ldr	r3, [fp, #-20]
40008108:	e51b201c 	ldr	r2, [fp, #-28]
4000810c:	e1a04002 	mov	r4, r2
40008110:	e1a00003 	mov	r0, r3
40008114:	e1a05000 	mov	r5, r0
40008118:	e50b5018 	str	r5, [fp, #-24]
4000811c:	e50b401c 	str	r4, [fp, #-28]
40008120:	e59f000c 	ldr	r0, [pc, #12]	; 40008134 <main+0x5c>
40008124:	e51b1018 	ldr	r1, [fp, #-24]
40008128:	eb000138 	bl	40008610 <uprintf>
4000812c:	e24bd00c 	sub	sp, fp, #12
40008130:	e8bd8830 	pop	{r4, r5, fp, pc}
40008134:	4000891c 	.word	0x4000891c

40008138 <beep_init>:
40008138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000813c:	e28db000 	add	fp, sp, #0
40008140:	e59f302c 	ldr	r3, [pc, #44]	; 40008174 <beep_init+0x3c>
40008144:	e59f2028 	ldr	r2, [pc, #40]	; 40008174 <beep_init+0x3c>
40008148:	e5922000 	ldr	r2, [r2]
4000814c:	e3c2200f 	bic	r2, r2, #15
40008150:	e5832000 	str	r2, [r3]
40008154:	e59f3018 	ldr	r3, [pc, #24]	; 40008174 <beep_init+0x3c>
40008158:	e59f2014 	ldr	r2, [pc, #20]	; 40008174 <beep_init+0x3c>
4000815c:	e5922000 	ldr	r2, [r2]
40008160:	e3822001 	orr	r2, r2, #1
40008164:	e5832000 	str	r2, [r3]
40008168:	e28bd000 	add	sp, fp, #0
4000816c:	e8bd0800 	pop	{fp}
40008170:	e12fff1e 	bx	lr
40008174:	114000a0 	.word	0x114000a0

40008178 <beep_on>:
40008178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000817c:	e28db000 	add	fp, sp, #0
40008180:	e59f3018 	ldr	r3, [pc, #24]	; 400081a0 <beep_on+0x28>
40008184:	e59f2014 	ldr	r2, [pc, #20]	; 400081a0 <beep_on+0x28>
40008188:	e5922000 	ldr	r2, [r2]
4000818c:	e3822001 	orr	r2, r2, #1
40008190:	e5832000 	str	r2, [r3]
40008194:	e28bd000 	add	sp, fp, #0
40008198:	e8bd0800 	pop	{fp}
4000819c:	e12fff1e 	bx	lr
400081a0:	114000a4 	.word	0x114000a4

400081a4 <beep_off>:
400081a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081a8:	e28db000 	add	fp, sp, #0
400081ac:	e59f3018 	ldr	r3, [pc, #24]	; 400081cc <beep_off+0x28>
400081b0:	e59f2014 	ldr	r2, [pc, #20]	; 400081cc <beep_off+0x28>
400081b4:	e5922000 	ldr	r2, [r2]
400081b8:	e3c22001 	bic	r2, r2, #1
400081bc:	e5832000 	str	r2, [r3]
400081c0:	e28bd000 	add	sp, fp, #0
400081c4:	e8bd0800 	pop	{fp}
400081c8:	e12fff1e 	bx	lr
400081cc:	114000a4 	.word	0x114000a4

400081d0 <led_init>:
400081d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081d4:	e28db000 	add	fp, sp, #0
400081d8:	e59f302c 	ldr	r3, [pc, #44]	; 4000820c <led_init+0x3c>
400081dc:	e59f2028 	ldr	r2, [pc, #40]	; 4000820c <led_init+0x3c>
400081e0:	e5922000 	ldr	r2, [r2]
400081e4:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
400081e8:	e5832000 	str	r2, [r3]
400081ec:	e59f3018 	ldr	r3, [pc, #24]	; 4000820c <led_init+0x3c>
400081f0:	e59f2014 	ldr	r2, [pc, #20]	; 4000820c <led_init+0x3c>
400081f4:	e5922000 	ldr	r2, [r2]
400081f8:	e3822a01 	orr	r2, r2, #4096	; 0x1000
400081fc:	e5832000 	str	r2, [r3]
40008200:	e28bd000 	add	sp, fp, #0
40008204:	e8bd0800 	pop	{fp}
40008208:	e12fff1e 	bx	lr
4000820c:	110002e0 	.word	0x110002e0

40008210 <led_on>:
40008210:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008214:	e28db000 	add	fp, sp, #0
40008218:	e59f3018 	ldr	r3, [pc, #24]	; 40008238 <led_on+0x28>
4000821c:	e59f2014 	ldr	r2, [pc, #20]	; 40008238 <led_on+0x28>
40008220:	e5922000 	ldr	r2, [r2]
40008224:	e3c22008 	bic	r2, r2, #8
40008228:	e5832000 	str	r2, [r3]
4000822c:	e28bd000 	add	sp, fp, #0
40008230:	e8bd0800 	pop	{fp}
40008234:	e12fff1e 	bx	lr
40008238:	110002e4 	.word	0x110002e4

4000823c <led_off>:
4000823c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008240:	e28db000 	add	fp, sp, #0
40008244:	e59f3018 	ldr	r3, [pc, #24]	; 40008264 <led_off+0x28>
40008248:	e59f2014 	ldr	r2, [pc, #20]	; 40008264 <led_off+0x28>
4000824c:	e5922000 	ldr	r2, [r2]
40008250:	e3822008 	orr	r2, r2, #8
40008254:	e5832000 	str	r2, [r3]
40008258:	e28bd000 	add	sp, fp, #0
4000825c:	e8bd0800 	pop	{fp}
40008260:	e12fff1e 	bx	lr
40008264:	110002e4 	.word	0x110002e4

40008268 <uart_init>:
40008268:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000826c:	e28db000 	add	fp, sp, #0
40008270:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008274:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008278:	e5922000 	ldr	r2, [r2]
4000827c:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008280:	e5832000 	str	r2, [r3]
40008284:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008288:	e3a02545 	mov	r2, #289406976	; 0x11400000
4000828c:	e5922000 	ldr	r2, [r2]
40008290:	e3822022 	orr	r2, r2, #34	; 0x22
40008294:	e5832000 	str	r2, [r3]
40008298:	e3a0354e 	mov	r3, #327155712	; 0x13800000
4000829c:	e3a02003 	mov	r2, #3
400082a0:	e5832000 	str	r2, [r3]
400082a4:	e59f3028 	ldr	r3, [pc, #40]	; 400082d4 <uart_init+0x6c>
400082a8:	e3a02005 	mov	r2, #5
400082ac:	e5832000 	str	r2, [r3]
400082b0:	e59f3020 	ldr	r3, [pc, #32]	; 400082d8 <uart_init+0x70>
400082b4:	e3a02035 	mov	r2, #53	; 0x35
400082b8:	e5832000 	str	r2, [r3]
400082bc:	e59f3018 	ldr	r3, [pc, #24]	; 400082dc <uart_init+0x74>
400082c0:	e3a02004 	mov	r2, #4
400082c4:	e5832000 	str	r2, [r3]
400082c8:	e28bd000 	add	sp, fp, #0
400082cc:	e8bd0800 	pop	{fp}
400082d0:	e12fff1e 	bx	lr
400082d4:	13800004 	.word	0x13800004
400082d8:	13800028 	.word	0x13800028
400082dc:	1380002c 	.word	0x1380002c

400082e0 <uart_send>:
400082e0:	e92d4800 	push	{fp, lr}
400082e4:	e28db004 	add	fp, sp, #4
400082e8:	e24dd008 	sub	sp, sp, #8
400082ec:	e1a03000 	mov	r3, r0
400082f0:	e54b3005 	strb	r3, [fp, #-5]
400082f4:	e1a00000 	nop			; (mov r0, r0)
400082f8:	e59f3034 	ldr	r3, [pc, #52]	; 40008334 <uart_send+0x54>
400082fc:	e5933000 	ldr	r3, [r3]
40008300:	e2033002 	and	r3, r3, #2
40008304:	e3530000 	cmp	r3, #0
40008308:	0afffffa 	beq	400082f8 <uart_send+0x18>
4000830c:	e59f3024 	ldr	r3, [pc, #36]	; 40008338 <uart_send+0x58>
40008310:	e55b2005 	ldrb	r2, [fp, #-5]
40008314:	e5832000 	str	r2, [r3]
40008318:	e55b3005 	ldrb	r3, [fp, #-5]
4000831c:	e353000a 	cmp	r3, #10
40008320:	1a000001 	bne	4000832c <uart_send+0x4c>
40008324:	e3a0000d 	mov	r0, #13
40008328:	ebffffec 	bl	400082e0 <uart_send>
4000832c:	e24bd004 	sub	sp, fp, #4
40008330:	e8bd8800 	pop	{fp, pc}
40008334:	13800010 	.word	0x13800010
40008338:	13800020 	.word	0x13800020

4000833c <puts_>:
4000833c:	e92d4800 	push	{fp, lr}
40008340:	e28db004 	add	fp, sp, #4
40008344:	e24dd008 	sub	sp, sp, #8
40008348:	e50b0008 	str	r0, [fp, #-8]
4000834c:	ea000006 	b	4000836c <puts_+0x30>
40008350:	e51b3008 	ldr	r3, [fp, #-8]
40008354:	e5d33000 	ldrb	r3, [r3]
40008358:	e1a00003 	mov	r0, r3
4000835c:	ebffffdf 	bl	400082e0 <uart_send>
40008360:	e51b3008 	ldr	r3, [fp, #-8]
40008364:	e2833001 	add	r3, r3, #1
40008368:	e50b3008 	str	r3, [fp, #-8]
4000836c:	e51b3008 	ldr	r3, [fp, #-8]
40008370:	e5d33000 	ldrb	r3, [r3]
40008374:	e3530000 	cmp	r3, #0
40008378:	1afffff4 	bne	40008350 <puts_+0x14>
4000837c:	e24bd004 	sub	sp, fp, #4
40008380:	e8bd8800 	pop	{fp, pc}

40008384 <uart_rev>:
40008384:	e92d4800 	push	{fp, lr}
40008388:	e28db004 	add	fp, sp, #4
4000838c:	e24dd008 	sub	sp, sp, #8
40008390:	e1a00000 	nop			; (mov r0, r0)
40008394:	e59f3034 	ldr	r3, [pc, #52]	; 400083d0 <uart_rev+0x4c>
40008398:	e5933000 	ldr	r3, [r3]
4000839c:	e2033001 	and	r3, r3, #1
400083a0:	e3530000 	cmp	r3, #0
400083a4:	0afffffa 	beq	40008394 <uart_rev+0x10>
400083a8:	e59f3024 	ldr	r3, [pc, #36]	; 400083d4 <uart_rev+0x50>
400083ac:	e5933000 	ldr	r3, [r3]
400083b0:	e54b3005 	strb	r3, [fp, #-5]
400083b4:	e55b3005 	ldrb	r3, [fp, #-5]
400083b8:	e1a00003 	mov	r0, r3
400083bc:	ebffffc7 	bl	400082e0 <uart_send>
400083c0:	e55b3005 	ldrb	r3, [fp, #-5]
400083c4:	e1a00003 	mov	r0, r3
400083c8:	e24bd004 	sub	sp, fp, #4
400083cc:	e8bd8800 	pop	{fp, pc}
400083d0:	13800010 	.word	0x13800010
400083d4:	13800024 	.word	0x13800024

400083d8 <itod>:
400083d8:	e92d4800 	push	{fp, lr}
400083dc:	e28db004 	add	fp, sp, #4
400083e0:	e24dd010 	sub	sp, sp, #16
400083e4:	e50b0010 	str	r0, [fp, #-16]
400083e8:	e50b1014 	str	r1, [fp, #-20]
400083ec:	e51b3010 	ldr	r3, [fp, #-16]
400083f0:	e3530009 	cmp	r3, #9
400083f4:	8a00000a 	bhi	40008424 <itod+0x4c>
400083f8:	e51b3010 	ldr	r3, [fp, #-16]
400083fc:	e6ef3073 	uxtb	r3, r3
40008400:	e2833030 	add	r3, r3, #48	; 0x30
40008404:	e6ef2073 	uxtb	r2, r3
40008408:	e51b3014 	ldr	r3, [fp, #-20]
4000840c:	e5c32000 	strb	r2, [r3]
40008410:	e51b3014 	ldr	r3, [fp, #-20]
40008414:	e2833001 	add	r3, r3, #1
40008418:	e3a02000 	mov	r2, #0
4000841c:	e5c32000 	strb	r2, [r3]
40008420:	ea000028 	b	400084c8 <itod+0xf0>
40008424:	e51b2010 	ldr	r2, [fp, #-16]
40008428:	e59f30a0 	ldr	r3, [pc, #160]	; 400084d0 <itod+0xf8>
4000842c:	e0831293 	umull	r1, r3, r3, r2
40008430:	e1a031a3 	lsr	r3, r3, #3
40008434:	e1a00003 	mov	r0, r3
40008438:	e51b1014 	ldr	r1, [fp, #-20]
4000843c:	ebffffe5 	bl	400083d8 <itod>
40008440:	e3a03000 	mov	r3, #0
40008444:	e50b3008 	str	r3, [fp, #-8]
40008448:	ea000002 	b	40008458 <itod+0x80>
4000844c:	e51b3008 	ldr	r3, [fp, #-8]
40008450:	e2833001 	add	r3, r3, #1
40008454:	e50b3008 	str	r3, [fp, #-8]
40008458:	e51b3008 	ldr	r3, [fp, #-8]
4000845c:	e51b2014 	ldr	r2, [fp, #-20]
40008460:	e0823003 	add	r3, r2, r3
40008464:	e5d33000 	ldrb	r3, [r3]
40008468:	e3530000 	cmp	r3, #0
4000846c:	1afffff6 	bne	4000844c <itod+0x74>
40008470:	e51b3008 	ldr	r3, [fp, #-8]
40008474:	e51b2014 	ldr	r2, [fp, #-20]
40008478:	e0820003 	add	r0, r2, r3
4000847c:	e51b1010 	ldr	r1, [fp, #-16]
40008480:	e59f3048 	ldr	r3, [pc, #72]	; 400084d0 <itod+0xf8>
40008484:	e0832193 	umull	r2, r3, r3, r1
40008488:	e1a021a3 	lsr	r2, r3, #3
4000848c:	e1a03002 	mov	r3, r2
40008490:	e1a03103 	lsl	r3, r3, #2
40008494:	e0833002 	add	r3, r3, r2
40008498:	e1a03083 	lsl	r3, r3, #1
4000849c:	e0632001 	rsb	r2, r3, r1
400084a0:	e6ef3072 	uxtb	r3, r2
400084a4:	e2833030 	add	r3, r3, #48	; 0x30
400084a8:	e6ef3073 	uxtb	r3, r3
400084ac:	e5c03000 	strb	r3, [r0]
400084b0:	e51b3008 	ldr	r3, [fp, #-8]
400084b4:	e2833001 	add	r3, r3, #1
400084b8:	e51b2014 	ldr	r2, [fp, #-20]
400084bc:	e0823003 	add	r3, r2, r3
400084c0:	e3a02000 	mov	r2, #0
400084c4:	e5c32000 	strb	r2, [r3]
400084c8:	e24bd004 	sub	sp, fp, #4
400084cc:	e8bd8800 	pop	{fp, pc}
400084d0:	cccccccd 	.word	0xcccccccd

400084d4 <itox>:
400084d4:	e92d4800 	push	{fp, lr}
400084d8:	e28db004 	add	fp, sp, #4
400084dc:	e24dd010 	sub	sp, sp, #16
400084e0:	e50b0010 	str	r0, [fp, #-16]
400084e4:	e50b1014 	str	r1, [fp, #-20]
400084e8:	e51b3010 	ldr	r3, [fp, #-16]
400084ec:	e353000f 	cmp	r3, #15
400084f0:	8a000014 	bhi	40008548 <itox+0x74>
400084f4:	e51b3010 	ldr	r3, [fp, #-16]
400084f8:	e3530009 	cmp	r3, #9
400084fc:	9a000006 	bls	4000851c <itox+0x48>
40008500:	e51b3010 	ldr	r3, [fp, #-16]
40008504:	e6ef3073 	uxtb	r3, r3
40008508:	e2833057 	add	r3, r3, #87	; 0x57
4000850c:	e6ef2073 	uxtb	r2, r3
40008510:	e51b3014 	ldr	r3, [fp, #-20]
40008514:	e5c32000 	strb	r2, [r3]
40008518:	ea000005 	b	40008534 <itox+0x60>
4000851c:	e51b3010 	ldr	r3, [fp, #-16]
40008520:	e6ef3073 	uxtb	r3, r3
40008524:	e2833030 	add	r3, r3, #48	; 0x30
40008528:	e6ef2073 	uxtb	r2, r3
4000852c:	e51b3014 	ldr	r3, [fp, #-20]
40008530:	e5c32000 	strb	r2, [r3]
40008534:	e51b3014 	ldr	r3, [fp, #-20]
40008538:	e2833001 	add	r3, r3, #1
4000853c:	e3a02000 	mov	r2, #0
40008540:	e5c32000 	strb	r2, [r3]
40008544:	ea00002f 	b	40008608 <itox+0x134>
40008548:	e51b3010 	ldr	r3, [fp, #-16]
4000854c:	e1a03223 	lsr	r3, r3, #4
40008550:	e1a00003 	mov	r0, r3
40008554:	e51b1014 	ldr	r1, [fp, #-20]
40008558:	ebffffdd 	bl	400084d4 <itox>
4000855c:	e3a03000 	mov	r3, #0
40008560:	e50b3008 	str	r3, [fp, #-8]
40008564:	ea000002 	b	40008574 <itox+0xa0>
40008568:	e51b3008 	ldr	r3, [fp, #-8]
4000856c:	e2833001 	add	r3, r3, #1
40008570:	e50b3008 	str	r3, [fp, #-8]
40008574:	e51b3008 	ldr	r3, [fp, #-8]
40008578:	e51b2014 	ldr	r2, [fp, #-20]
4000857c:	e0823003 	add	r3, r2, r3
40008580:	e5d33000 	ldrb	r3, [r3]
40008584:	e3530000 	cmp	r3, #0
40008588:	1afffff6 	bne	40008568 <itox+0x94>
4000858c:	e51b3010 	ldr	r3, [fp, #-16]
40008590:	e203300f 	and	r3, r3, #15
40008594:	e3530009 	cmp	r3, #9
40008598:	9a00000a 	bls	400085c8 <itox+0xf4>
4000859c:	e51b3008 	ldr	r3, [fp, #-8]
400085a0:	e51b2014 	ldr	r2, [fp, #-20]
400085a4:	e0823003 	add	r3, r2, r3
400085a8:	e51b2010 	ldr	r2, [fp, #-16]
400085ac:	e6ef2072 	uxtb	r2, r2
400085b0:	e202200f 	and	r2, r2, #15
400085b4:	e6ef2072 	uxtb	r2, r2
400085b8:	e2822057 	add	r2, r2, #87	; 0x57
400085bc:	e6ef2072 	uxtb	r2, r2
400085c0:	e5c32000 	strb	r2, [r3]
400085c4:	ea000009 	b	400085f0 <itox+0x11c>
400085c8:	e51b3008 	ldr	r3, [fp, #-8]
400085cc:	e51b2014 	ldr	r2, [fp, #-20]
400085d0:	e0823003 	add	r3, r2, r3
400085d4:	e51b2010 	ldr	r2, [fp, #-16]
400085d8:	e6ef2072 	uxtb	r2, r2
400085dc:	e202200f 	and	r2, r2, #15
400085e0:	e6ef2072 	uxtb	r2, r2
400085e4:	e2822030 	add	r2, r2, #48	; 0x30
400085e8:	e6ef2072 	uxtb	r2, r2
400085ec:	e5c32000 	strb	r2, [r3]
400085f0:	e51b3008 	ldr	r3, [fp, #-8]
400085f4:	e2833001 	add	r3, r3, #1
400085f8:	e51b2014 	ldr	r2, [fp, #-20]
400085fc:	e0823003 	add	r3, r2, r3
40008600:	e3a02000 	mov	r2, #0
40008604:	e5c32000 	strb	r2, [r3]
40008608:	e24bd004 	sub	sp, fp, #4
4000860c:	e8bd8800 	pop	{fp, pc}

40008610 <uprintf>:
40008610:	e92d000f 	push	{r0, r1, r2, r3}
40008614:	e92d4800 	push	{fp, lr}
40008618:	e28db004 	add	fp, sp, #4
4000861c:	e24dd028 	sub	sp, sp, #40	; 0x28
40008620:	e28b3004 	add	r3, fp, #4
40008624:	e2833004 	add	r3, r3, #4
40008628:	e50b300c 	str	r3, [fp, #-12]
4000862c:	ea00006a 	b	400087dc <uprintf+0x1cc>
40008630:	e59b3004 	ldr	r3, [fp, #4]
40008634:	e5d33000 	ldrb	r3, [r3]
40008638:	e3530025 	cmp	r3, #37	; 0x25
4000863c:	0a000004 	beq	40008654 <uprintf+0x44>
40008640:	e59b3004 	ldr	r3, [fp, #4]
40008644:	e5d33000 	ldrb	r3, [r3]
40008648:	e1a00003 	mov	r0, r3
4000864c:	ebffff23 	bl	400082e0 <uart_send>
40008650:	ea00005e 	b	400087d0 <uprintf+0x1c0>
40008654:	e59b3004 	ldr	r3, [fp, #4]
40008658:	e2833001 	add	r3, r3, #1
4000865c:	e58b3004 	str	r3, [fp, #4]
40008660:	e59b3004 	ldr	r3, [fp, #4]
40008664:	e5d33000 	ldrb	r3, [r3]
40008668:	e2433063 	sub	r3, r3, #99	; 0x63
4000866c:	e3530015 	cmp	r3, #21
40008670:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
40008674:	ea000054 	b	400087cc <uprintf+0x1bc>
40008678:	400086d0 	.word	0x400086d0
4000867c:	40008724 	.word	0x40008724
40008680:	400087cc 	.word	0x400087cc
40008684:	400087cc 	.word	0x400087cc
40008688:	400087cc 	.word	0x400087cc
4000868c:	400087cc 	.word	0x400087cc
40008690:	400087cc 	.word	0x400087cc
40008694:	400087cc 	.word	0x400087cc
40008698:	400087cc 	.word	0x400087cc
4000869c:	400087cc 	.word	0x400087cc
400086a0:	400087cc 	.word	0x400087cc
400086a4:	400087cc 	.word	0x400087cc
400086a8:	400087cc 	.word	0x400087cc
400086ac:	400087cc 	.word	0x400087cc
400086b0:	400087cc 	.word	0x400087cc
400086b4:	400087cc 	.word	0x400087cc
400086b8:	400086fc 	.word	0x400086fc
400086bc:	400087cc 	.word	0x400087cc
400086c0:	400087cc 	.word	0x400087cc
400086c4:	400087cc 	.word	0x400087cc
400086c8:	400087cc 	.word	0x400087cc
400086cc:	40008788 	.word	0x40008788
400086d0:	e51b300c 	ldr	r3, [fp, #-12]
400086d4:	e5933000 	ldr	r3, [r3]
400086d8:	e50b3010 	str	r3, [fp, #-16]
400086dc:	e51b300c 	ldr	r3, [fp, #-12]
400086e0:	e2833004 	add	r3, r3, #4
400086e4:	e50b300c 	str	r3, [fp, #-12]
400086e8:	e51b3010 	ldr	r3, [fp, #-16]
400086ec:	e6ef3073 	uxtb	r3, r3
400086f0:	e1a00003 	mov	r0, r3
400086f4:	ebfffef9 	bl	400082e0 <uart_send>
400086f8:	ea000034 	b	400087d0 <uprintf+0x1c0>
400086fc:	e51b300c 	ldr	r3, [fp, #-12]
40008700:	e5933000 	ldr	r3, [r3]
40008704:	e50b3014 	str	r3, [fp, #-20]
40008708:	e51b300c 	ldr	r3, [fp, #-12]
4000870c:	e2833004 	add	r3, r3, #4
40008710:	e50b300c 	str	r3, [fp, #-12]
40008714:	e51b3014 	ldr	r3, [fp, #-20]
40008718:	e1a00003 	mov	r0, r3
4000871c:	ebffff06 	bl	4000833c <puts_>
40008720:	ea00002a 	b	400087d0 <uprintf+0x1c0>
40008724:	e51b300c 	ldr	r3, [fp, #-12]
40008728:	e5933000 	ldr	r3, [r3]
4000872c:	e50b3018 	str	r3, [fp, #-24]
40008730:	e51b300c 	ldr	r3, [fp, #-12]
40008734:	e2833004 	add	r3, r3, #4
40008738:	e50b300c 	str	r3, [fp, #-12]
4000873c:	e51b3018 	ldr	r3, [fp, #-24]
40008740:	e50b3008 	str	r3, [fp, #-8]
40008744:	e51b3008 	ldr	r3, [fp, #-8]
40008748:	e3530000 	cmp	r3, #0
4000874c:	aa000004 	bge	40008764 <uprintf+0x154>
40008750:	e3a0002d 	mov	r0, #45	; 0x2d
40008754:	ebfffee1 	bl	400082e0 <uart_send>
40008758:	e51b3008 	ldr	r3, [fp, #-8]
4000875c:	e2633000 	rsb	r3, r3, #0
40008760:	e50b3008 	str	r3, [fp, #-8]
40008764:	e51b2008 	ldr	r2, [fp, #-8]
40008768:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000876c:	e1a00002 	mov	r0, r2
40008770:	e1a01003 	mov	r1, r3
40008774:	ebffff17 	bl	400083d8 <itod>
40008778:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000877c:	e1a00003 	mov	r0, r3
40008780:	ebfffeed 	bl	4000833c <puts_>
40008784:	ea000011 	b	400087d0 <uprintf+0x1c0>
40008788:	e51b300c 	ldr	r3, [fp, #-12]
4000878c:	e5933000 	ldr	r3, [r3]
40008790:	e50b301c 	str	r3, [fp, #-28]
40008794:	e51b300c 	ldr	r3, [fp, #-12]
40008798:	e2833004 	add	r3, r3, #4
4000879c:	e50b300c 	str	r3, [fp, #-12]
400087a0:	e51b301c 	ldr	r3, [fp, #-28]
400087a4:	e50b3008 	str	r3, [fp, #-8]
400087a8:	e51b2008 	ldr	r2, [fp, #-8]
400087ac:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087b0:	e1a00002 	mov	r0, r2
400087b4:	e1a01003 	mov	r1, r3
400087b8:	ebffff45 	bl	400084d4 <itox>
400087bc:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087c0:	e1a00003 	mov	r0, r3
400087c4:	ebfffedc 	bl	4000833c <puts_>
400087c8:	ea000000 	b	400087d0 <uprintf+0x1c0>
400087cc:	e1a00000 	nop			; (mov r0, r0)
400087d0:	e59b3004 	ldr	r3, [fp, #4]
400087d4:	e2833001 	add	r3, r3, #1
400087d8:	e58b3004 	str	r3, [fp, #4]
400087dc:	e59b3004 	ldr	r3, [fp, #4]
400087e0:	e5d33000 	ldrb	r3, [r3]
400087e4:	e3530000 	cmp	r3, #0
400087e8:	1affff90 	bne	40008630 <uprintf+0x20>
400087ec:	e3a03000 	mov	r3, #0
400087f0:	e50b300c 	str	r3, [fp, #-12]
400087f4:	e3a03000 	mov	r3, #0
400087f8:	e1a00003 	mov	r0, r3
400087fc:	e24bd004 	sub	sp, fp, #4
40008800:	e8bd4800 	pop	{fp, lr}
40008804:	e28dd010 	add	sp, sp, #16
40008808:	e12fff1e 	bx	lr

4000880c <pwm0_init>:
4000880c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008810:	e28db000 	add	fp, sp, #0
40008814:	e59f30d8 	ldr	r3, [pc, #216]	; 400088f4 <pwm0_init+0xe8>
40008818:	e59f20d4 	ldr	r2, [pc, #212]	; 400088f4 <pwm0_init+0xe8>
4000881c:	e5922000 	ldr	r2, [r2]
40008820:	e3c2200f 	bic	r2, r2, #15
40008824:	e5832000 	str	r2, [r3]
40008828:	e59f30c4 	ldr	r3, [pc, #196]	; 400088f4 <pwm0_init+0xe8>
4000882c:	e59f20c0 	ldr	r2, [pc, #192]	; 400088f4 <pwm0_init+0xe8>
40008830:	e5922000 	ldr	r2, [r2]
40008834:	e3822002 	orr	r2, r2, #2
40008838:	e5832000 	str	r2, [r3]
4000883c:	e59f30b4 	ldr	r3, [pc, #180]	; 400088f8 <pwm0_init+0xec>
40008840:	e59f20b0 	ldr	r2, [pc, #176]	; 400088f8 <pwm0_init+0xec>
40008844:	e5922000 	ldr	r2, [r2]
40008848:	e3c220ff 	bic	r2, r2, #255	; 0xff
4000884c:	e5832000 	str	r2, [r3]
40008850:	e59f30a0 	ldr	r3, [pc, #160]	; 400088f8 <pwm0_init+0xec>
40008854:	e59f209c 	ldr	r2, [pc, #156]	; 400088f8 <pwm0_init+0xec>
40008858:	e5922000 	ldr	r2, [r2]
4000885c:	e3822031 	orr	r2, r2, #49	; 0x31
40008860:	e5832000 	str	r2, [r3]
40008864:	e59f3090 	ldr	r3, [pc, #144]	; 400088fc <pwm0_init+0xf0>
40008868:	e59f208c 	ldr	r2, [pc, #140]	; 400088fc <pwm0_init+0xf0>
4000886c:	e5922000 	ldr	r2, [r2]
40008870:	e3c2200f 	bic	r2, r2, #15
40008874:	e5832000 	str	r2, [r3]
40008878:	e59f307c 	ldr	r3, [pc, #124]	; 400088fc <pwm0_init+0xf0>
4000887c:	e59f2078 	ldr	r2, [pc, #120]	; 400088fc <pwm0_init+0xf0>
40008880:	e5922000 	ldr	r2, [r2]
40008884:	e3822001 	orr	r2, r2, #1
40008888:	e5832000 	str	r2, [r3]
4000888c:	e59f306c 	ldr	r3, [pc, #108]	; 40008900 <pwm0_init+0xf4>
40008890:	e3a02ffa 	mov	r2, #1000	; 0x3e8
40008894:	e5832000 	str	r2, [r3]
40008898:	e59f3064 	ldr	r3, [pc, #100]	; 40008904 <pwm0_init+0xf8>
4000889c:	e59f205c 	ldr	r2, [pc, #92]	; 40008900 <pwm0_init+0xf4>
400088a0:	e5922000 	ldr	r2, [r2]
400088a4:	e1a020a2 	lsr	r2, r2, #1
400088a8:	e5832000 	str	r2, [r3]
400088ac:	e59f3054 	ldr	r3, [pc, #84]	; 40008908 <pwm0_init+0xfc>
400088b0:	e59f2050 	ldr	r2, [pc, #80]	; 40008908 <pwm0_init+0xfc>
400088b4:	e5922000 	ldr	r2, [r2]
400088b8:	e3822002 	orr	r2, r2, #2
400088bc:	e5832000 	str	r2, [r3]
400088c0:	e59f3040 	ldr	r3, [pc, #64]	; 40008908 <pwm0_init+0xfc>
400088c4:	e59f203c 	ldr	r2, [pc, #60]	; 40008908 <pwm0_init+0xfc>
400088c8:	e5922000 	ldr	r2, [r2]
400088cc:	e3c22002 	bic	r2, r2, #2
400088d0:	e5832000 	str	r2, [r3]
400088d4:	e59f302c 	ldr	r3, [pc, #44]	; 40008908 <pwm0_init+0xfc>
400088d8:	e59f2028 	ldr	r2, [pc, #40]	; 40008908 <pwm0_init+0xfc>
400088dc:	e5922000 	ldr	r2, [r2]
400088e0:	e3822009 	orr	r2, r2, #9
400088e4:	e5832000 	str	r2, [r3]
400088e8:	e28bd000 	add	sp, fp, #0
400088ec:	e8bd0800 	pop	{fp}
400088f0:	e12fff1e 	bx	lr
400088f4:	114000a0 	.word	0x114000a0
400088f8:	139d0000 	.word	0x139d0000
400088fc:	139d0004 	.word	0x139d0004
40008900:	139d000c 	.word	0x139d000c
40008904:	139d0010 	.word	0x139d0010
40008908:	139d0008 	.word	0x139d0008
