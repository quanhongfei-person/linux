
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
40008054:	eb000228 	bl	400088fc <do_timer>
40008058:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

4000805c <_bss_start>:
4000805c:	40008b00 	.word	0x40008b00

40008060 <_bss_end>:
40008060:	40008b04 	.word	0x40008b04

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
400080ec:	eb000143 	bl	40008600 <uprintf>
400080f0:	e8bd8800 	pop	{fp, pc}
400080f4:	40008acc 	.word	0x40008acc

400080f8 <main>:
400080f8:	e92d4800 	push	{fp, lr}
400080fc:	e28db004 	add	fp, sp, #4
40008100:	e24dd010 	sub	sp, sp, #16
40008104:	e3a03061 	mov	r3, #97	; 0x61
40008108:	e54b3005 	strb	r3, [fp, #-5]
4000810c:	e3a03064 	mov	r3, #100	; 0x64
40008110:	e50b300c 	str	r3, [fp, #-12]
40008114:	e3e03000 	mvn	r3, #0
40008118:	e50b3010 	str	r3, [fp, #-16]
4000811c:	eb00004d 	bl	40008258 <uart_init>
40008120:	eb00020b 	bl	40008954 <timer_init>
40008124:	eafffffe 	b	40008124 <main+0x2c>

40008128 <beep_init>:
40008128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000812c:	e28db000 	add	fp, sp, #0
40008130:	e59f302c 	ldr	r3, [pc, #44]	; 40008164 <beep_init+0x3c>
40008134:	e59f2028 	ldr	r2, [pc, #40]	; 40008164 <beep_init+0x3c>
40008138:	e5922000 	ldr	r2, [r2]
4000813c:	e3c2200f 	bic	r2, r2, #15
40008140:	e5832000 	str	r2, [r3]
40008144:	e59f3018 	ldr	r3, [pc, #24]	; 40008164 <beep_init+0x3c>
40008148:	e59f2014 	ldr	r2, [pc, #20]	; 40008164 <beep_init+0x3c>
4000814c:	e5922000 	ldr	r2, [r2]
40008150:	e3822001 	orr	r2, r2, #1
40008154:	e5832000 	str	r2, [r3]
40008158:	e28bd000 	add	sp, fp, #0
4000815c:	e8bd0800 	pop	{fp}
40008160:	e12fff1e 	bx	lr
40008164:	114000a0 	.word	0x114000a0

40008168 <beep_on>:
40008168:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000816c:	e28db000 	add	fp, sp, #0
40008170:	e59f3018 	ldr	r3, [pc, #24]	; 40008190 <beep_on+0x28>
40008174:	e59f2014 	ldr	r2, [pc, #20]	; 40008190 <beep_on+0x28>
40008178:	e5922000 	ldr	r2, [r2]
4000817c:	e3822001 	orr	r2, r2, #1
40008180:	e5832000 	str	r2, [r3]
40008184:	e28bd000 	add	sp, fp, #0
40008188:	e8bd0800 	pop	{fp}
4000818c:	e12fff1e 	bx	lr
40008190:	114000a4 	.word	0x114000a4

40008194 <beep_off>:
40008194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008198:	e28db000 	add	fp, sp, #0
4000819c:	e59f3018 	ldr	r3, [pc, #24]	; 400081bc <beep_off+0x28>
400081a0:	e59f2014 	ldr	r2, [pc, #20]	; 400081bc <beep_off+0x28>
400081a4:	e5922000 	ldr	r2, [r2]
400081a8:	e3c22001 	bic	r2, r2, #1
400081ac:	e5832000 	str	r2, [r3]
400081b0:	e28bd000 	add	sp, fp, #0
400081b4:	e8bd0800 	pop	{fp}
400081b8:	e12fff1e 	bx	lr
400081bc:	114000a4 	.word	0x114000a4

400081c0 <led_init>:
400081c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081c4:	e28db000 	add	fp, sp, #0
400081c8:	e59f302c 	ldr	r3, [pc, #44]	; 400081fc <led_init+0x3c>
400081cc:	e59f2028 	ldr	r2, [pc, #40]	; 400081fc <led_init+0x3c>
400081d0:	e5922000 	ldr	r2, [r2]
400081d4:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
400081d8:	e5832000 	str	r2, [r3]
400081dc:	e59f3018 	ldr	r3, [pc, #24]	; 400081fc <led_init+0x3c>
400081e0:	e59f2014 	ldr	r2, [pc, #20]	; 400081fc <led_init+0x3c>
400081e4:	e5922000 	ldr	r2, [r2]
400081e8:	e3822a01 	orr	r2, r2, #4096	; 0x1000
400081ec:	e5832000 	str	r2, [r3]
400081f0:	e28bd000 	add	sp, fp, #0
400081f4:	e8bd0800 	pop	{fp}
400081f8:	e12fff1e 	bx	lr
400081fc:	110002e0 	.word	0x110002e0

40008200 <led_on>:
40008200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008204:	e28db000 	add	fp, sp, #0
40008208:	e59f3018 	ldr	r3, [pc, #24]	; 40008228 <led_on+0x28>
4000820c:	e59f2014 	ldr	r2, [pc, #20]	; 40008228 <led_on+0x28>
40008210:	e5922000 	ldr	r2, [r2]
40008214:	e3c22008 	bic	r2, r2, #8
40008218:	e5832000 	str	r2, [r3]
4000821c:	e28bd000 	add	sp, fp, #0
40008220:	e8bd0800 	pop	{fp}
40008224:	e12fff1e 	bx	lr
40008228:	110002e4 	.word	0x110002e4

4000822c <led_off>:
4000822c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008230:	e28db000 	add	fp, sp, #0
40008234:	e59f3018 	ldr	r3, [pc, #24]	; 40008254 <led_off+0x28>
40008238:	e59f2014 	ldr	r2, [pc, #20]	; 40008254 <led_off+0x28>
4000823c:	e5922000 	ldr	r2, [r2]
40008240:	e3822008 	orr	r2, r2, #8
40008244:	e5832000 	str	r2, [r3]
40008248:	e28bd000 	add	sp, fp, #0
4000824c:	e8bd0800 	pop	{fp}
40008250:	e12fff1e 	bx	lr
40008254:	110002e4 	.word	0x110002e4

40008258 <uart_init>:
40008258:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000825c:	e28db000 	add	fp, sp, #0
40008260:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008264:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008268:	e5922000 	ldr	r2, [r2]
4000826c:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008270:	e5832000 	str	r2, [r3]
40008274:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008278:	e3a02545 	mov	r2, #289406976	; 0x11400000
4000827c:	e5922000 	ldr	r2, [r2]
40008280:	e3822022 	orr	r2, r2, #34	; 0x22
40008284:	e5832000 	str	r2, [r3]
40008288:	e3a0354e 	mov	r3, #327155712	; 0x13800000
4000828c:	e3a02003 	mov	r2, #3
40008290:	e5832000 	str	r2, [r3]
40008294:	e59f3028 	ldr	r3, [pc, #40]	; 400082c4 <uart_init+0x6c>
40008298:	e3a02005 	mov	r2, #5
4000829c:	e5832000 	str	r2, [r3]
400082a0:	e59f3020 	ldr	r3, [pc, #32]	; 400082c8 <uart_init+0x70>
400082a4:	e3a02035 	mov	r2, #53	; 0x35
400082a8:	e5832000 	str	r2, [r3]
400082ac:	e59f3018 	ldr	r3, [pc, #24]	; 400082cc <uart_init+0x74>
400082b0:	e3a02004 	mov	r2, #4
400082b4:	e5832000 	str	r2, [r3]
400082b8:	e28bd000 	add	sp, fp, #0
400082bc:	e8bd0800 	pop	{fp}
400082c0:	e12fff1e 	bx	lr
400082c4:	13800004 	.word	0x13800004
400082c8:	13800028 	.word	0x13800028
400082cc:	1380002c 	.word	0x1380002c

400082d0 <uart_send>:
400082d0:	e92d4800 	push	{fp, lr}
400082d4:	e28db004 	add	fp, sp, #4
400082d8:	e24dd008 	sub	sp, sp, #8
400082dc:	e1a03000 	mov	r3, r0
400082e0:	e54b3005 	strb	r3, [fp, #-5]
400082e4:	e1a00000 	nop			; (mov r0, r0)
400082e8:	e59f3034 	ldr	r3, [pc, #52]	; 40008324 <uart_send+0x54>
400082ec:	e5933000 	ldr	r3, [r3]
400082f0:	e2033002 	and	r3, r3, #2
400082f4:	e3530000 	cmp	r3, #0
400082f8:	0afffffa 	beq	400082e8 <uart_send+0x18>
400082fc:	e59f3024 	ldr	r3, [pc, #36]	; 40008328 <uart_send+0x58>
40008300:	e55b2005 	ldrb	r2, [fp, #-5]
40008304:	e5832000 	str	r2, [r3]
40008308:	e55b3005 	ldrb	r3, [fp, #-5]
4000830c:	e353000a 	cmp	r3, #10
40008310:	1a000001 	bne	4000831c <uart_send+0x4c>
40008314:	e3a0000d 	mov	r0, #13
40008318:	ebffffec 	bl	400082d0 <uart_send>
4000831c:	e24bd004 	sub	sp, fp, #4
40008320:	e8bd8800 	pop	{fp, pc}
40008324:	13800010 	.word	0x13800010
40008328:	13800020 	.word	0x13800020

4000832c <puts_>:
4000832c:	e92d4800 	push	{fp, lr}
40008330:	e28db004 	add	fp, sp, #4
40008334:	e24dd008 	sub	sp, sp, #8
40008338:	e50b0008 	str	r0, [fp, #-8]
4000833c:	ea000006 	b	4000835c <puts_+0x30>
40008340:	e51b3008 	ldr	r3, [fp, #-8]
40008344:	e5d33000 	ldrb	r3, [r3]
40008348:	e1a00003 	mov	r0, r3
4000834c:	ebffffdf 	bl	400082d0 <uart_send>
40008350:	e51b3008 	ldr	r3, [fp, #-8]
40008354:	e2833001 	add	r3, r3, #1
40008358:	e50b3008 	str	r3, [fp, #-8]
4000835c:	e51b3008 	ldr	r3, [fp, #-8]
40008360:	e5d33000 	ldrb	r3, [r3]
40008364:	e3530000 	cmp	r3, #0
40008368:	1afffff4 	bne	40008340 <puts_+0x14>
4000836c:	e24bd004 	sub	sp, fp, #4
40008370:	e8bd8800 	pop	{fp, pc}

40008374 <uart_rev>:
40008374:	e92d4800 	push	{fp, lr}
40008378:	e28db004 	add	fp, sp, #4
4000837c:	e24dd008 	sub	sp, sp, #8
40008380:	e1a00000 	nop			; (mov r0, r0)
40008384:	e59f3034 	ldr	r3, [pc, #52]	; 400083c0 <uart_rev+0x4c>
40008388:	e5933000 	ldr	r3, [r3]
4000838c:	e2033001 	and	r3, r3, #1
40008390:	e3530000 	cmp	r3, #0
40008394:	0afffffa 	beq	40008384 <uart_rev+0x10>
40008398:	e59f3024 	ldr	r3, [pc, #36]	; 400083c4 <uart_rev+0x50>
4000839c:	e5933000 	ldr	r3, [r3]
400083a0:	e54b3005 	strb	r3, [fp, #-5]
400083a4:	e55b3005 	ldrb	r3, [fp, #-5]
400083a8:	e1a00003 	mov	r0, r3
400083ac:	ebffffc7 	bl	400082d0 <uart_send>
400083b0:	e55b3005 	ldrb	r3, [fp, #-5]
400083b4:	e1a00003 	mov	r0, r3
400083b8:	e24bd004 	sub	sp, fp, #4
400083bc:	e8bd8800 	pop	{fp, pc}
400083c0:	13800010 	.word	0x13800010
400083c4:	13800024 	.word	0x13800024

400083c8 <itod>:
400083c8:	e92d4800 	push	{fp, lr}
400083cc:	e28db004 	add	fp, sp, #4
400083d0:	e24dd010 	sub	sp, sp, #16
400083d4:	e50b0010 	str	r0, [fp, #-16]
400083d8:	e50b1014 	str	r1, [fp, #-20]
400083dc:	e51b3010 	ldr	r3, [fp, #-16]
400083e0:	e3530009 	cmp	r3, #9
400083e4:	8a00000a 	bhi	40008414 <itod+0x4c>
400083e8:	e51b3010 	ldr	r3, [fp, #-16]
400083ec:	e6ef3073 	uxtb	r3, r3
400083f0:	e2833030 	add	r3, r3, #48	; 0x30
400083f4:	e6ef2073 	uxtb	r2, r3
400083f8:	e51b3014 	ldr	r3, [fp, #-20]
400083fc:	e5c32000 	strb	r2, [r3]
40008400:	e51b3014 	ldr	r3, [fp, #-20]
40008404:	e2833001 	add	r3, r3, #1
40008408:	e3a02000 	mov	r2, #0
4000840c:	e5c32000 	strb	r2, [r3]
40008410:	ea000028 	b	400084b8 <itod+0xf0>
40008414:	e51b2010 	ldr	r2, [fp, #-16]
40008418:	e59f30a0 	ldr	r3, [pc, #160]	; 400084c0 <itod+0xf8>
4000841c:	e0831293 	umull	r1, r3, r3, r2
40008420:	e1a031a3 	lsr	r3, r3, #3
40008424:	e1a00003 	mov	r0, r3
40008428:	e51b1014 	ldr	r1, [fp, #-20]
4000842c:	ebffffe5 	bl	400083c8 <itod>
40008430:	e3a03000 	mov	r3, #0
40008434:	e50b3008 	str	r3, [fp, #-8]
40008438:	ea000002 	b	40008448 <itod+0x80>
4000843c:	e51b3008 	ldr	r3, [fp, #-8]
40008440:	e2833001 	add	r3, r3, #1
40008444:	e50b3008 	str	r3, [fp, #-8]
40008448:	e51b3008 	ldr	r3, [fp, #-8]
4000844c:	e51b2014 	ldr	r2, [fp, #-20]
40008450:	e0823003 	add	r3, r2, r3
40008454:	e5d33000 	ldrb	r3, [r3]
40008458:	e3530000 	cmp	r3, #0
4000845c:	1afffff6 	bne	4000843c <itod+0x74>
40008460:	e51b3008 	ldr	r3, [fp, #-8]
40008464:	e51b2014 	ldr	r2, [fp, #-20]
40008468:	e0820003 	add	r0, r2, r3
4000846c:	e51b1010 	ldr	r1, [fp, #-16]
40008470:	e59f3048 	ldr	r3, [pc, #72]	; 400084c0 <itod+0xf8>
40008474:	e0832193 	umull	r2, r3, r3, r1
40008478:	e1a021a3 	lsr	r2, r3, #3
4000847c:	e1a03002 	mov	r3, r2
40008480:	e1a03103 	lsl	r3, r3, #2
40008484:	e0833002 	add	r3, r3, r2
40008488:	e1a03083 	lsl	r3, r3, #1
4000848c:	e0632001 	rsb	r2, r3, r1
40008490:	e6ef3072 	uxtb	r3, r2
40008494:	e2833030 	add	r3, r3, #48	; 0x30
40008498:	e6ef3073 	uxtb	r3, r3
4000849c:	e5c03000 	strb	r3, [r0]
400084a0:	e51b3008 	ldr	r3, [fp, #-8]
400084a4:	e2833001 	add	r3, r3, #1
400084a8:	e51b2014 	ldr	r2, [fp, #-20]
400084ac:	e0823003 	add	r3, r2, r3
400084b0:	e3a02000 	mov	r2, #0
400084b4:	e5c32000 	strb	r2, [r3]
400084b8:	e24bd004 	sub	sp, fp, #4
400084bc:	e8bd8800 	pop	{fp, pc}
400084c0:	cccccccd 	.word	0xcccccccd

400084c4 <itox>:
400084c4:	e92d4800 	push	{fp, lr}
400084c8:	e28db004 	add	fp, sp, #4
400084cc:	e24dd010 	sub	sp, sp, #16
400084d0:	e50b0010 	str	r0, [fp, #-16]
400084d4:	e50b1014 	str	r1, [fp, #-20]
400084d8:	e51b3010 	ldr	r3, [fp, #-16]
400084dc:	e353000f 	cmp	r3, #15
400084e0:	8a000014 	bhi	40008538 <itox+0x74>
400084e4:	e51b3010 	ldr	r3, [fp, #-16]
400084e8:	e3530009 	cmp	r3, #9
400084ec:	9a000006 	bls	4000850c <itox+0x48>
400084f0:	e51b3010 	ldr	r3, [fp, #-16]
400084f4:	e6ef3073 	uxtb	r3, r3
400084f8:	e2833057 	add	r3, r3, #87	; 0x57
400084fc:	e6ef2073 	uxtb	r2, r3
40008500:	e51b3014 	ldr	r3, [fp, #-20]
40008504:	e5c32000 	strb	r2, [r3]
40008508:	ea000005 	b	40008524 <itox+0x60>
4000850c:	e51b3010 	ldr	r3, [fp, #-16]
40008510:	e6ef3073 	uxtb	r3, r3
40008514:	e2833030 	add	r3, r3, #48	; 0x30
40008518:	e6ef2073 	uxtb	r2, r3
4000851c:	e51b3014 	ldr	r3, [fp, #-20]
40008520:	e5c32000 	strb	r2, [r3]
40008524:	e51b3014 	ldr	r3, [fp, #-20]
40008528:	e2833001 	add	r3, r3, #1
4000852c:	e3a02000 	mov	r2, #0
40008530:	e5c32000 	strb	r2, [r3]
40008534:	ea00002f 	b	400085f8 <itox+0x134>
40008538:	e51b3010 	ldr	r3, [fp, #-16]
4000853c:	e1a03223 	lsr	r3, r3, #4
40008540:	e1a00003 	mov	r0, r3
40008544:	e51b1014 	ldr	r1, [fp, #-20]
40008548:	ebffffdd 	bl	400084c4 <itox>
4000854c:	e3a03000 	mov	r3, #0
40008550:	e50b3008 	str	r3, [fp, #-8]
40008554:	ea000002 	b	40008564 <itox+0xa0>
40008558:	e51b3008 	ldr	r3, [fp, #-8]
4000855c:	e2833001 	add	r3, r3, #1
40008560:	e50b3008 	str	r3, [fp, #-8]
40008564:	e51b3008 	ldr	r3, [fp, #-8]
40008568:	e51b2014 	ldr	r2, [fp, #-20]
4000856c:	e0823003 	add	r3, r2, r3
40008570:	e5d33000 	ldrb	r3, [r3]
40008574:	e3530000 	cmp	r3, #0
40008578:	1afffff6 	bne	40008558 <itox+0x94>
4000857c:	e51b3010 	ldr	r3, [fp, #-16]
40008580:	e203300f 	and	r3, r3, #15
40008584:	e3530009 	cmp	r3, #9
40008588:	9a00000a 	bls	400085b8 <itox+0xf4>
4000858c:	e51b3008 	ldr	r3, [fp, #-8]
40008590:	e51b2014 	ldr	r2, [fp, #-20]
40008594:	e0823003 	add	r3, r2, r3
40008598:	e51b2010 	ldr	r2, [fp, #-16]
4000859c:	e6ef2072 	uxtb	r2, r2
400085a0:	e202200f 	and	r2, r2, #15
400085a4:	e6ef2072 	uxtb	r2, r2
400085a8:	e2822057 	add	r2, r2, #87	; 0x57
400085ac:	e6ef2072 	uxtb	r2, r2
400085b0:	e5c32000 	strb	r2, [r3]
400085b4:	ea000009 	b	400085e0 <itox+0x11c>
400085b8:	e51b3008 	ldr	r3, [fp, #-8]
400085bc:	e51b2014 	ldr	r2, [fp, #-20]
400085c0:	e0823003 	add	r3, r2, r3
400085c4:	e51b2010 	ldr	r2, [fp, #-16]
400085c8:	e6ef2072 	uxtb	r2, r2
400085cc:	e202200f 	and	r2, r2, #15
400085d0:	e6ef2072 	uxtb	r2, r2
400085d4:	e2822030 	add	r2, r2, #48	; 0x30
400085d8:	e6ef2072 	uxtb	r2, r2
400085dc:	e5c32000 	strb	r2, [r3]
400085e0:	e51b3008 	ldr	r3, [fp, #-8]
400085e4:	e2833001 	add	r3, r3, #1
400085e8:	e51b2014 	ldr	r2, [fp, #-20]
400085ec:	e0823003 	add	r3, r2, r3
400085f0:	e3a02000 	mov	r2, #0
400085f4:	e5c32000 	strb	r2, [r3]
400085f8:	e24bd004 	sub	sp, fp, #4
400085fc:	e8bd8800 	pop	{fp, pc}

40008600 <uprintf>:
40008600:	e92d000f 	push	{r0, r1, r2, r3}
40008604:	e92d4800 	push	{fp, lr}
40008608:	e28db004 	add	fp, sp, #4
4000860c:	e24dd028 	sub	sp, sp, #40	; 0x28
40008610:	e28b3004 	add	r3, fp, #4
40008614:	e2833004 	add	r3, r3, #4
40008618:	e50b300c 	str	r3, [fp, #-12]
4000861c:	ea00006a 	b	400087cc <uprintf+0x1cc>
40008620:	e59b3004 	ldr	r3, [fp, #4]
40008624:	e5d33000 	ldrb	r3, [r3]
40008628:	e3530025 	cmp	r3, #37	; 0x25
4000862c:	0a000004 	beq	40008644 <uprintf+0x44>
40008630:	e59b3004 	ldr	r3, [fp, #4]
40008634:	e5d33000 	ldrb	r3, [r3]
40008638:	e1a00003 	mov	r0, r3
4000863c:	ebffff23 	bl	400082d0 <uart_send>
40008640:	ea00005e 	b	400087c0 <uprintf+0x1c0>
40008644:	e59b3004 	ldr	r3, [fp, #4]
40008648:	e2833001 	add	r3, r3, #1
4000864c:	e58b3004 	str	r3, [fp, #4]
40008650:	e59b3004 	ldr	r3, [fp, #4]
40008654:	e5d33000 	ldrb	r3, [r3]
40008658:	e2433063 	sub	r3, r3, #99	; 0x63
4000865c:	e3530015 	cmp	r3, #21
40008660:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
40008664:	ea000054 	b	400087bc <uprintf+0x1bc>
40008668:	400086c0 	.word	0x400086c0
4000866c:	40008714 	.word	0x40008714
40008670:	400087bc 	.word	0x400087bc
40008674:	400087bc 	.word	0x400087bc
40008678:	400087bc 	.word	0x400087bc
4000867c:	400087bc 	.word	0x400087bc
40008680:	400087bc 	.word	0x400087bc
40008684:	400087bc 	.word	0x400087bc
40008688:	400087bc 	.word	0x400087bc
4000868c:	400087bc 	.word	0x400087bc
40008690:	400087bc 	.word	0x400087bc
40008694:	400087bc 	.word	0x400087bc
40008698:	400087bc 	.word	0x400087bc
4000869c:	400087bc 	.word	0x400087bc
400086a0:	400087bc 	.word	0x400087bc
400086a4:	400087bc 	.word	0x400087bc
400086a8:	400086ec 	.word	0x400086ec
400086ac:	400087bc 	.word	0x400087bc
400086b0:	400087bc 	.word	0x400087bc
400086b4:	400087bc 	.word	0x400087bc
400086b8:	400087bc 	.word	0x400087bc
400086bc:	40008778 	.word	0x40008778
400086c0:	e51b300c 	ldr	r3, [fp, #-12]
400086c4:	e5933000 	ldr	r3, [r3]
400086c8:	e50b3010 	str	r3, [fp, #-16]
400086cc:	e51b300c 	ldr	r3, [fp, #-12]
400086d0:	e2833004 	add	r3, r3, #4
400086d4:	e50b300c 	str	r3, [fp, #-12]
400086d8:	e51b3010 	ldr	r3, [fp, #-16]
400086dc:	e6ef3073 	uxtb	r3, r3
400086e0:	e1a00003 	mov	r0, r3
400086e4:	ebfffef9 	bl	400082d0 <uart_send>
400086e8:	ea000034 	b	400087c0 <uprintf+0x1c0>
400086ec:	e51b300c 	ldr	r3, [fp, #-12]
400086f0:	e5933000 	ldr	r3, [r3]
400086f4:	e50b3014 	str	r3, [fp, #-20]
400086f8:	e51b300c 	ldr	r3, [fp, #-12]
400086fc:	e2833004 	add	r3, r3, #4
40008700:	e50b300c 	str	r3, [fp, #-12]
40008704:	e51b3014 	ldr	r3, [fp, #-20]
40008708:	e1a00003 	mov	r0, r3
4000870c:	ebffff06 	bl	4000832c <puts_>
40008710:	ea00002a 	b	400087c0 <uprintf+0x1c0>
40008714:	e51b300c 	ldr	r3, [fp, #-12]
40008718:	e5933000 	ldr	r3, [r3]
4000871c:	e50b3018 	str	r3, [fp, #-24]
40008720:	e51b300c 	ldr	r3, [fp, #-12]
40008724:	e2833004 	add	r3, r3, #4
40008728:	e50b300c 	str	r3, [fp, #-12]
4000872c:	e51b3018 	ldr	r3, [fp, #-24]
40008730:	e50b3008 	str	r3, [fp, #-8]
40008734:	e51b3008 	ldr	r3, [fp, #-8]
40008738:	e3530000 	cmp	r3, #0
4000873c:	aa000004 	bge	40008754 <uprintf+0x154>
40008740:	e3a0002d 	mov	r0, #45	; 0x2d
40008744:	ebfffee1 	bl	400082d0 <uart_send>
40008748:	e51b3008 	ldr	r3, [fp, #-8]
4000874c:	e2633000 	rsb	r3, r3, #0
40008750:	e50b3008 	str	r3, [fp, #-8]
40008754:	e51b2008 	ldr	r2, [fp, #-8]
40008758:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000875c:	e1a00002 	mov	r0, r2
40008760:	e1a01003 	mov	r1, r3
40008764:	ebffff17 	bl	400083c8 <itod>
40008768:	e24b302c 	sub	r3, fp, #44	; 0x2c
4000876c:	e1a00003 	mov	r0, r3
40008770:	ebfffeed 	bl	4000832c <puts_>
40008774:	ea000011 	b	400087c0 <uprintf+0x1c0>
40008778:	e51b300c 	ldr	r3, [fp, #-12]
4000877c:	e5933000 	ldr	r3, [r3]
40008780:	e50b301c 	str	r3, [fp, #-28]
40008784:	e51b300c 	ldr	r3, [fp, #-12]
40008788:	e2833004 	add	r3, r3, #4
4000878c:	e50b300c 	str	r3, [fp, #-12]
40008790:	e51b301c 	ldr	r3, [fp, #-28]
40008794:	e50b3008 	str	r3, [fp, #-8]
40008798:	e51b2008 	ldr	r2, [fp, #-8]
4000879c:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087a0:	e1a00002 	mov	r0, r2
400087a4:	e1a01003 	mov	r1, r3
400087a8:	ebffff45 	bl	400084c4 <itox>
400087ac:	e24b302c 	sub	r3, fp, #44	; 0x2c
400087b0:	e1a00003 	mov	r0, r3
400087b4:	ebfffedc 	bl	4000832c <puts_>
400087b8:	ea000000 	b	400087c0 <uprintf+0x1c0>
400087bc:	e1a00000 	nop			; (mov r0, r0)
400087c0:	e59b3004 	ldr	r3, [fp, #4]
400087c4:	e2833001 	add	r3, r3, #1
400087c8:	e58b3004 	str	r3, [fp, #4]
400087cc:	e59b3004 	ldr	r3, [fp, #4]
400087d0:	e5d33000 	ldrb	r3, [r3]
400087d4:	e3530000 	cmp	r3, #0
400087d8:	1affff90 	bne	40008620 <uprintf+0x20>
400087dc:	e3a03000 	mov	r3, #0
400087e0:	e50b300c 	str	r3, [fp, #-12]
400087e4:	e3a03000 	mov	r3, #0
400087e8:	e1a00003 	mov	r0, r3
400087ec:	e24bd004 	sub	sp, fp, #4
400087f0:	e8bd4800 	pop	{fp, lr}
400087f4:	e28dd010 	add	sp, sp, #16
400087f8:	e12fff1e 	bx	lr

400087fc <pwm0_init>:
400087fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008800:	e28db000 	add	fp, sp, #0
40008804:	e59f30d8 	ldr	r3, [pc, #216]	; 400088e4 <pwm0_init+0xe8>
40008808:	e59f20d4 	ldr	r2, [pc, #212]	; 400088e4 <pwm0_init+0xe8>
4000880c:	e5922000 	ldr	r2, [r2]
40008810:	e3c2200f 	bic	r2, r2, #15
40008814:	e5832000 	str	r2, [r3]
40008818:	e59f30c4 	ldr	r3, [pc, #196]	; 400088e4 <pwm0_init+0xe8>
4000881c:	e59f20c0 	ldr	r2, [pc, #192]	; 400088e4 <pwm0_init+0xe8>
40008820:	e5922000 	ldr	r2, [r2]
40008824:	e3822002 	orr	r2, r2, #2
40008828:	e5832000 	str	r2, [r3]
4000882c:	e59f30b4 	ldr	r3, [pc, #180]	; 400088e8 <pwm0_init+0xec>
40008830:	e59f20b0 	ldr	r2, [pc, #176]	; 400088e8 <pwm0_init+0xec>
40008834:	e5922000 	ldr	r2, [r2]
40008838:	e3c220ff 	bic	r2, r2, #255	; 0xff
4000883c:	e5832000 	str	r2, [r3]
40008840:	e59f30a0 	ldr	r3, [pc, #160]	; 400088e8 <pwm0_init+0xec>
40008844:	e59f209c 	ldr	r2, [pc, #156]	; 400088e8 <pwm0_init+0xec>
40008848:	e5922000 	ldr	r2, [r2]
4000884c:	e3822031 	orr	r2, r2, #49	; 0x31
40008850:	e5832000 	str	r2, [r3]
40008854:	e59f3090 	ldr	r3, [pc, #144]	; 400088ec <pwm0_init+0xf0>
40008858:	e59f208c 	ldr	r2, [pc, #140]	; 400088ec <pwm0_init+0xf0>
4000885c:	e5922000 	ldr	r2, [r2]
40008860:	e3c2200f 	bic	r2, r2, #15
40008864:	e5832000 	str	r2, [r3]
40008868:	e59f307c 	ldr	r3, [pc, #124]	; 400088ec <pwm0_init+0xf0>
4000886c:	e59f2078 	ldr	r2, [pc, #120]	; 400088ec <pwm0_init+0xf0>
40008870:	e5922000 	ldr	r2, [r2]
40008874:	e3822001 	orr	r2, r2, #1
40008878:	e5832000 	str	r2, [r3]
4000887c:	e59f306c 	ldr	r3, [pc, #108]	; 400088f0 <pwm0_init+0xf4>
40008880:	e3a02ffa 	mov	r2, #1000	; 0x3e8
40008884:	e5832000 	str	r2, [r3]
40008888:	e59f3064 	ldr	r3, [pc, #100]	; 400088f4 <pwm0_init+0xf8>
4000888c:	e59f205c 	ldr	r2, [pc, #92]	; 400088f0 <pwm0_init+0xf4>
40008890:	e5922000 	ldr	r2, [r2]
40008894:	e1a020a2 	lsr	r2, r2, #1
40008898:	e5832000 	str	r2, [r3]
4000889c:	e59f3054 	ldr	r3, [pc, #84]	; 400088f8 <pwm0_init+0xfc>
400088a0:	e59f2050 	ldr	r2, [pc, #80]	; 400088f8 <pwm0_init+0xfc>
400088a4:	e5922000 	ldr	r2, [r2]
400088a8:	e3822002 	orr	r2, r2, #2
400088ac:	e5832000 	str	r2, [r3]
400088b0:	e59f3040 	ldr	r3, [pc, #64]	; 400088f8 <pwm0_init+0xfc>
400088b4:	e59f203c 	ldr	r2, [pc, #60]	; 400088f8 <pwm0_init+0xfc>
400088b8:	e5922000 	ldr	r2, [r2]
400088bc:	e3c22002 	bic	r2, r2, #2
400088c0:	e5832000 	str	r2, [r3]
400088c4:	e59f302c 	ldr	r3, [pc, #44]	; 400088f8 <pwm0_init+0xfc>
400088c8:	e59f2028 	ldr	r2, [pc, #40]	; 400088f8 <pwm0_init+0xfc>
400088cc:	e5922000 	ldr	r2, [r2]
400088d0:	e3822009 	orr	r2, r2, #9
400088d4:	e5832000 	str	r2, [r3]
400088d8:	e28bd000 	add	sp, fp, #0
400088dc:	e8bd0800 	pop	{fp}
400088e0:	e12fff1e 	bx	lr
400088e4:	114000a0 	.word	0x114000a0
400088e8:	139d0000 	.word	0x139d0000
400088ec:	139d0004 	.word	0x139d0004
400088f0:	139d000c 	.word	0x139d000c
400088f4:	139d0010 	.word	0x139d0010
400088f8:	139d0008 	.word	0x139d0008

400088fc <do_timer>:
400088fc:	e92d4800 	push	{fp, lr}
40008900:	e28db004 	add	fp, sp, #4
40008904:	e24dd008 	sub	sp, sp, #8
40008908:	e59f3034 	ldr	r3, [pc, #52]	; 40008944 <do_timer+0x48>
4000890c:	e5933000 	ldr	r3, [r3]
40008910:	e1a03b03 	lsl	r3, r3, #22
40008914:	e1a03b23 	lsr	r3, r3, #22
40008918:	e50b3008 	str	r3, [fp, #-8]
4000891c:	e59f3024 	ldr	r3, [pc, #36]	; 40008948 <do_timer+0x4c>
40008920:	e51b2008 	ldr	r2, [fp, #-8]
40008924:	e5832000 	str	r2, [r3]
40008928:	e59f001c 	ldr	r0, [pc, #28]	; 4000894c <do_timer+0x50>
4000892c:	e51b1008 	ldr	r1, [fp, #-8]
40008930:	ebffff32 	bl	40008600 <uprintf>
40008934:	e59f0014 	ldr	r0, [pc, #20]	; 40008950 <do_timer+0x54>
40008938:	ebffff30 	bl	40008600 <uprintf>
4000893c:	e24bd004 	sub	sp, fp, #4
40008940:	e8bd8800 	pop	{fp, pc}
40008944:	1048000c 	.word	0x1048000c
40008948:	10480010 	.word	0x10480010
4000894c:	40008adc 	.word	0x40008adc
40008950:	40008aec 	.word	0x40008aec

40008954 <timer_init>:
40008954:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008958:	e28db000 	add	fp, sp, #0
4000895c:	e59f3138 	ldr	r3, [pc, #312]	; 40008a9c <timer_init+0x148>
40008960:	e59f2134 	ldr	r2, [pc, #308]	; 40008a9c <timer_init+0x148>
40008964:	e5922000 	ldr	r2, [r2]
40008968:	e3c220ff 	bic	r2, r2, #255	; 0xff
4000896c:	e5832000 	str	r2, [r3]
40008970:	e59f3124 	ldr	r3, [pc, #292]	; 40008a9c <timer_init+0x148>
40008974:	e59f2120 	ldr	r2, [pc, #288]	; 40008a9c <timer_init+0x148>
40008978:	e5922000 	ldr	r2, [r2]
4000897c:	e3822031 	orr	r2, r2, #49	; 0x31
40008980:	e5832000 	str	r2, [r3]
40008984:	e59f3114 	ldr	r3, [pc, #276]	; 40008aa0 <timer_init+0x14c>
40008988:	e59f2110 	ldr	r2, [pc, #272]	; 40008aa0 <timer_init+0x14c>
4000898c:	e5922000 	ldr	r2, [r2]
40008990:	e3c2200f 	bic	r2, r2, #15
40008994:	e5832000 	str	r2, [r3]
40008998:	e59f3100 	ldr	r3, [pc, #256]	; 40008aa0 <timer_init+0x14c>
4000899c:	e59f20fc 	ldr	r2, [pc, #252]	; 40008aa0 <timer_init+0x14c>
400089a0:	e5922000 	ldr	r2, [r2]
400089a4:	e3822001 	orr	r2, r2, #1
400089a8:	e5832000 	str	r2, [r3]
400089ac:	e59f30f0 	ldr	r3, [pc, #240]	; 40008aa4 <timer_init+0x150>
400089b0:	e59f20f0 	ldr	r2, [pc, #240]	; 40008aa8 <timer_init+0x154>
400089b4:	e5832000 	str	r2, [r3]
400089b8:	e59f30ec 	ldr	r3, [pc, #236]	; 40008aac <timer_init+0x158>
400089bc:	e59f20e8 	ldr	r2, [pc, #232]	; 40008aac <timer_init+0x158>
400089c0:	e5922000 	ldr	r2, [r2]
400089c4:	e3822002 	orr	r2, r2, #2
400089c8:	e5832000 	str	r2, [r3]
400089cc:	e59f30d8 	ldr	r3, [pc, #216]	; 40008aac <timer_init+0x158>
400089d0:	e59f20d4 	ldr	r2, [pc, #212]	; 40008aac <timer_init+0x158>
400089d4:	e5922000 	ldr	r2, [r2]
400089d8:	e3c22002 	bic	r2, r2, #2
400089dc:	e5832000 	str	r2, [r3]
400089e0:	e59f30c8 	ldr	r3, [pc, #200]	; 40008ab0 <timer_init+0x15c>
400089e4:	e59f20c4 	ldr	r2, [pc, #196]	; 40008ab0 <timer_init+0x15c>
400089e8:	e5922000 	ldr	r2, [r2]
400089ec:	e3822001 	orr	r2, r2, #1
400089f0:	e5832000 	str	r2, [r3]
400089f4:	e59f30b0 	ldr	r3, [pc, #176]	; 40008aac <timer_init+0x158>
400089f8:	e59f20ac 	ldr	r2, [pc, #172]	; 40008aac <timer_init+0x158>
400089fc:	e5922000 	ldr	r2, [r2]
40008a00:	e3822009 	orr	r2, r2, #9
40008a04:	e5832000 	str	r2, [r3]
40008a08:	e59f30a4 	ldr	r3, [pc, #164]	; 40008ab4 <timer_init+0x160>
40008a0c:	e3a02001 	mov	r2, #1
40008a10:	e5832000 	str	r2, [r3]
40008a14:	e59f309c 	ldr	r3, [pc, #156]	; 40008ab8 <timer_init+0x164>
40008a18:	e3a02001 	mov	r2, #1
40008a1c:	e5832000 	str	r2, [r3]
40008a20:	e59f3094 	ldr	r3, [pc, #148]	; 40008abc <timer_init+0x168>
40008a24:	e3a020ff 	mov	r2, #255	; 0xff
40008a28:	e5832000 	str	r2, [r3]
40008a2c:	e59f308c 	ldr	r3, [pc, #140]	; 40008ac0 <timer_init+0x16c>
40008a30:	e59f2088 	ldr	r2, [pc, #136]	; 40008ac0 <timer_init+0x16c>
40008a34:	e5922000 	ldr	r2, [r2]
40008a38:	e3822020 	orr	r2, r2, #32
40008a3c:	e5832000 	str	r2, [r3]
40008a40:	e59f307c 	ldr	r3, [pc, #124]	; 40008ac4 <timer_init+0x170>
40008a44:	e59f2078 	ldr	r2, [pc, #120]	; 40008ac4 <timer_init+0x170>
40008a48:	e5922000 	ldr	r2, [r2]
40008a4c:	e3c22cff 	bic	r2, r2, #65280	; 0xff00
40008a50:	e5832000 	str	r2, [r3]
40008a54:	e59f3068 	ldr	r3, [pc, #104]	; 40008ac4 <timer_init+0x170>
40008a58:	e59f2064 	ldr	r2, [pc, #100]	; 40008ac4 <timer_init+0x170>
40008a5c:	e5922000 	ldr	r2, [r2]
40008a60:	e3822c01 	orr	r2, r2, #256	; 0x100
40008a64:	e5832000 	str	r2, [r3]
40008a68:	e59f3058 	ldr	r3, [pc, #88]	; 40008ac8 <timer_init+0x174>
40008a6c:	e59f2054 	ldr	r2, [pc, #84]	; 40008ac8 <timer_init+0x174>
40008a70:	e5922000 	ldr	r2, [r2]
40008a74:	e3c22cff 	bic	r2, r2, #65280	; 0xff00
40008a78:	e5832000 	str	r2, [r3]
40008a7c:	e59f3044 	ldr	r3, [pc, #68]	; 40008ac8 <timer_init+0x174>
40008a80:	e59f2040 	ldr	r2, [pc, #64]	; 40008ac8 <timer_init+0x174>
40008a84:	e5922000 	ldr	r2, [r2]
40008a88:	e3822c01 	orr	r2, r2, #256	; 0x100
40008a8c:	e5832000 	str	r2, [r3]
40008a90:	e28bd000 	add	sp, fp, #0
40008a94:	e8bd0800 	pop	{fp}
40008a98:	e12fff1e 	bx	lr
40008a9c:	139d0000 	.word	0x139d0000
40008aa0:	139d0004 	.word	0x139d0004
40008aa4:	139d000c 	.word	0x139d000c
40008aa8:	001e8480 	.word	0x001e8480
40008aac:	139d0008 	.word	0x139d0008
40008ab0:	139d0044 	.word	0x139d0044
40008ab4:	10490000 	.word	0x10490000
40008ab8:	10480000 	.word	0x10480000
40008abc:	10480004 	.word	0x10480004
40008ac0:	10490108 	.word	0x10490108
40008ac4:	10490444 	.word	0x10490444
40008ac8:	10490844 	.word	0x10490844
