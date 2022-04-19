
arm:     file format elf32-littlearm


Disassembly of section .text:

40008000 <_bss_start>:
40008000:	40008864 	.word	0x40008864

40008004 <_bss_end>:
40008004:	40008868 	.word	0x40008868

40008008 <clear_bss>:
40008008:	e3a00000 	mov	r0, #0
4000800c:	e51f1014 	ldr	r1, [pc, #-20]	; 40008000 <_bss_start>
40008010:	e51f2014 	ldr	r2, [pc, #-20]	; 40008004 <_bss_end>

40008014 <bss_clear>:
40008014:	e4810004 	str	r0, [r1], #4
40008018:	e1510002 	cmp	r1, r2
4000801c:	1afffffc 	bne	40008014 <bss_clear>
40008020:	ea000011 	b	4000806c <main>

40008024 <delay>:
40008024:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008028:	e28db000 	add	fp, sp, #0
4000802c:	e24dd00c 	sub	sp, sp, #12
40008030:	e50b0008 	str	r0, [fp, #-8]
40008034:	e1a00000 	nop			; (mov r0, r0)
40008038:	e51b3008 	ldr	r3, [fp, #-8]
4000803c:	e3530000 	cmp	r3, #0
40008040:	03a03000 	moveq	r3, #0
40008044:	13a03001 	movne	r3, #1
40008048:	e6ef3073 	uxtb	r3, r3
4000804c:	e51b2008 	ldr	r2, [fp, #-8]
40008050:	e2422001 	sub	r2, r2, #1
40008054:	e50b2008 	str	r2, [fp, #-8]
40008058:	e3530000 	cmp	r3, #0
4000805c:	1afffff5 	bne	40008038 <delay+0x14>
40008060:	e28bd000 	add	sp, fp, #0
40008064:	e8bd0800 	pop	{fp}
40008068:	e12fff1e 	bx	lr

4000806c <main>:
4000806c:	e92d4800 	push	{fp, lr}
40008070:	e28db004 	add	fp, sp, #4
40008074:	e24dd008 	sub	sp, sp, #8
40008078:	e3a03061 	mov	r3, #97	; 0x61
4000807c:	e54b3005 	strb	r3, [fp, #-5]
40008080:	eb00004e 	bl	400081c0 <uart_init>
40008084:	eb0001b6 	bl	40008764 <pwm0_init>
40008088:	e24bd004 	sub	sp, fp, #4
4000808c:	e8bd8800 	pop	{fp, pc}

40008090 <beep_init>:
40008090:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008094:	e28db000 	add	fp, sp, #0
40008098:	e59f302c 	ldr	r3, [pc, #44]	; 400080cc <beep_init+0x3c>
4000809c:	e59f2028 	ldr	r2, [pc, #40]	; 400080cc <beep_init+0x3c>
400080a0:	e5922000 	ldr	r2, [r2]
400080a4:	e3c2200f 	bic	r2, r2, #15
400080a8:	e5832000 	str	r2, [r3]
400080ac:	e59f3018 	ldr	r3, [pc, #24]	; 400080cc <beep_init+0x3c>
400080b0:	e59f2014 	ldr	r2, [pc, #20]	; 400080cc <beep_init+0x3c>
400080b4:	e5922000 	ldr	r2, [r2]
400080b8:	e3822001 	orr	r2, r2, #1
400080bc:	e5832000 	str	r2, [r3]
400080c0:	e28bd000 	add	sp, fp, #0
400080c4:	e8bd0800 	pop	{fp}
400080c8:	e12fff1e 	bx	lr
400080cc:	114000a0 	.word	0x114000a0

400080d0 <beep_on>:
400080d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400080d4:	e28db000 	add	fp, sp, #0
400080d8:	e59f3018 	ldr	r3, [pc, #24]	; 400080f8 <beep_on+0x28>
400080dc:	e59f2014 	ldr	r2, [pc, #20]	; 400080f8 <beep_on+0x28>
400080e0:	e5922000 	ldr	r2, [r2]
400080e4:	e3822001 	orr	r2, r2, #1
400080e8:	e5832000 	str	r2, [r3]
400080ec:	e28bd000 	add	sp, fp, #0
400080f0:	e8bd0800 	pop	{fp}
400080f4:	e12fff1e 	bx	lr
400080f8:	114000a4 	.word	0x114000a4

400080fc <beep_off>:
400080fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008100:	e28db000 	add	fp, sp, #0
40008104:	e59f3018 	ldr	r3, [pc, #24]	; 40008124 <beep_off+0x28>
40008108:	e59f2014 	ldr	r2, [pc, #20]	; 40008124 <beep_off+0x28>
4000810c:	e5922000 	ldr	r2, [r2]
40008110:	e3c22001 	bic	r2, r2, #1
40008114:	e5832000 	str	r2, [r3]
40008118:	e28bd000 	add	sp, fp, #0
4000811c:	e8bd0800 	pop	{fp}
40008120:	e12fff1e 	bx	lr
40008124:	114000a4 	.word	0x114000a4

40008128 <led_init>:
40008128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000812c:	e28db000 	add	fp, sp, #0
40008130:	e59f302c 	ldr	r3, [pc, #44]	; 40008164 <led_init+0x3c>
40008134:	e59f2028 	ldr	r2, [pc, #40]	; 40008164 <led_init+0x3c>
40008138:	e5922000 	ldr	r2, [r2]
4000813c:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
40008140:	e5832000 	str	r2, [r3]
40008144:	e59f3018 	ldr	r3, [pc, #24]	; 40008164 <led_init+0x3c>
40008148:	e59f2014 	ldr	r2, [pc, #20]	; 40008164 <led_init+0x3c>
4000814c:	e5922000 	ldr	r2, [r2]
40008150:	e3822a01 	orr	r2, r2, #4096	; 0x1000
40008154:	e5832000 	str	r2, [r3]
40008158:	e28bd000 	add	sp, fp, #0
4000815c:	e8bd0800 	pop	{fp}
40008160:	e12fff1e 	bx	lr
40008164:	110002e0 	.word	0x110002e0

40008168 <led_on>:
40008168:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000816c:	e28db000 	add	fp, sp, #0
40008170:	e59f3018 	ldr	r3, [pc, #24]	; 40008190 <led_on+0x28>
40008174:	e59f2014 	ldr	r2, [pc, #20]	; 40008190 <led_on+0x28>
40008178:	e5922000 	ldr	r2, [r2]
4000817c:	e3c22008 	bic	r2, r2, #8
40008180:	e5832000 	str	r2, [r3]
40008184:	e28bd000 	add	sp, fp, #0
40008188:	e8bd0800 	pop	{fp}
4000818c:	e12fff1e 	bx	lr
40008190:	110002e4 	.word	0x110002e4

40008194 <led_off>:
40008194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008198:	e28db000 	add	fp, sp, #0
4000819c:	e59f3018 	ldr	r3, [pc, #24]	; 400081bc <led_off+0x28>
400081a0:	e59f2014 	ldr	r2, [pc, #20]	; 400081bc <led_off+0x28>
400081a4:	e5922000 	ldr	r2, [r2]
400081a8:	e3822008 	orr	r2, r2, #8
400081ac:	e5832000 	str	r2, [r3]
400081b0:	e28bd000 	add	sp, fp, #0
400081b4:	e8bd0800 	pop	{fp}
400081b8:	e12fff1e 	bx	lr
400081bc:	110002e4 	.word	0x110002e4

400081c0 <uart_init>:
400081c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081c4:	e28db000 	add	fp, sp, #0
400081c8:	e3a03545 	mov	r3, #289406976	; 0x11400000
400081cc:	e3a02545 	mov	r2, #289406976	; 0x11400000
400081d0:	e5922000 	ldr	r2, [r2]
400081d4:	e3c220ff 	bic	r2, r2, #255	; 0xff
400081d8:	e5832000 	str	r2, [r3]
400081dc:	e3a03545 	mov	r3, #289406976	; 0x11400000
400081e0:	e3a02545 	mov	r2, #289406976	; 0x11400000
400081e4:	e5922000 	ldr	r2, [r2]
400081e8:	e3822022 	orr	r2, r2, #34	; 0x22
400081ec:	e5832000 	str	r2, [r3]
400081f0:	e3a0354e 	mov	r3, #327155712	; 0x13800000
400081f4:	e3a02003 	mov	r2, #3
400081f8:	e5832000 	str	r2, [r3]
400081fc:	e59f3028 	ldr	r3, [pc, #40]	; 4000822c <uart_init+0x6c>
40008200:	e3a02005 	mov	r2, #5
40008204:	e5832000 	str	r2, [r3]
40008208:	e59f3020 	ldr	r3, [pc, #32]	; 40008230 <uart_init+0x70>
4000820c:	e3a02035 	mov	r2, #53	; 0x35
40008210:	e5832000 	str	r2, [r3]
40008214:	e59f3018 	ldr	r3, [pc, #24]	; 40008234 <uart_init+0x74>
40008218:	e3a02004 	mov	r2, #4
4000821c:	e5832000 	str	r2, [r3]
40008220:	e28bd000 	add	sp, fp, #0
40008224:	e8bd0800 	pop	{fp}
40008228:	e12fff1e 	bx	lr
4000822c:	13800004 	.word	0x13800004
40008230:	13800028 	.word	0x13800028
40008234:	1380002c 	.word	0x1380002c

40008238 <uart_send>:
40008238:	e92d4800 	push	{fp, lr}
4000823c:	e28db004 	add	fp, sp, #4
40008240:	e24dd008 	sub	sp, sp, #8
40008244:	e1a03000 	mov	r3, r0
40008248:	e54b3005 	strb	r3, [fp, #-5]
4000824c:	e1a00000 	nop			; (mov r0, r0)
40008250:	e59f3034 	ldr	r3, [pc, #52]	; 4000828c <uart_send+0x54>
40008254:	e5933000 	ldr	r3, [r3]
40008258:	e2033002 	and	r3, r3, #2
4000825c:	e3530000 	cmp	r3, #0
40008260:	0afffffa 	beq	40008250 <uart_send+0x18>
40008264:	e59f3024 	ldr	r3, [pc, #36]	; 40008290 <uart_send+0x58>
40008268:	e55b2005 	ldrb	r2, [fp, #-5]
4000826c:	e5832000 	str	r2, [r3]
40008270:	e55b3005 	ldrb	r3, [fp, #-5]
40008274:	e353000a 	cmp	r3, #10
40008278:	1a000001 	bne	40008284 <uart_send+0x4c>
4000827c:	e3a0000d 	mov	r0, #13
40008280:	ebffffec 	bl	40008238 <uart_send>
40008284:	e24bd004 	sub	sp, fp, #4
40008288:	e8bd8800 	pop	{fp, pc}
4000828c:	13800010 	.word	0x13800010
40008290:	13800020 	.word	0x13800020

40008294 <puts_>:
40008294:	e92d4800 	push	{fp, lr}
40008298:	e28db004 	add	fp, sp, #4
4000829c:	e24dd008 	sub	sp, sp, #8
400082a0:	e50b0008 	str	r0, [fp, #-8]
400082a4:	ea000006 	b	400082c4 <puts_+0x30>
400082a8:	e51b3008 	ldr	r3, [fp, #-8]
400082ac:	e5d33000 	ldrb	r3, [r3]
400082b0:	e1a00003 	mov	r0, r3
400082b4:	ebffffdf 	bl	40008238 <uart_send>
400082b8:	e51b3008 	ldr	r3, [fp, #-8]
400082bc:	e2833001 	add	r3, r3, #1
400082c0:	e50b3008 	str	r3, [fp, #-8]
400082c4:	e51b3008 	ldr	r3, [fp, #-8]
400082c8:	e5d33000 	ldrb	r3, [r3]
400082cc:	e3530000 	cmp	r3, #0
400082d0:	1afffff4 	bne	400082a8 <puts_+0x14>
400082d4:	e24bd004 	sub	sp, fp, #4
400082d8:	e8bd8800 	pop	{fp, pc}

400082dc <uart_rev>:
400082dc:	e92d4800 	push	{fp, lr}
400082e0:	e28db004 	add	fp, sp, #4
400082e4:	e24dd008 	sub	sp, sp, #8
400082e8:	e1a00000 	nop			; (mov r0, r0)
400082ec:	e59f3034 	ldr	r3, [pc, #52]	; 40008328 <uart_rev+0x4c>
400082f0:	e5933000 	ldr	r3, [r3]
400082f4:	e2033001 	and	r3, r3, #1
400082f8:	e3530000 	cmp	r3, #0
400082fc:	0afffffa 	beq	400082ec <uart_rev+0x10>
40008300:	e59f3024 	ldr	r3, [pc, #36]	; 4000832c <uart_rev+0x50>
40008304:	e5933000 	ldr	r3, [r3]
40008308:	e54b3005 	strb	r3, [fp, #-5]
4000830c:	e55b3005 	ldrb	r3, [fp, #-5]
40008310:	e1a00003 	mov	r0, r3
40008314:	ebffffc7 	bl	40008238 <uart_send>
40008318:	e55b3005 	ldrb	r3, [fp, #-5]
4000831c:	e1a00003 	mov	r0, r3
40008320:	e24bd004 	sub	sp, fp, #4
40008324:	e8bd8800 	pop	{fp, pc}
40008328:	13800010 	.word	0x13800010
4000832c:	13800024 	.word	0x13800024

40008330 <itod>:
40008330:	e92d4800 	push	{fp, lr}
40008334:	e28db004 	add	fp, sp, #4
40008338:	e24dd010 	sub	sp, sp, #16
4000833c:	e50b0010 	str	r0, [fp, #-16]
40008340:	e50b1014 	str	r1, [fp, #-20]
40008344:	e51b3010 	ldr	r3, [fp, #-16]
40008348:	e3530009 	cmp	r3, #9
4000834c:	8a00000a 	bhi	4000837c <itod+0x4c>
40008350:	e51b3010 	ldr	r3, [fp, #-16]
40008354:	e6ef3073 	uxtb	r3, r3
40008358:	e2833030 	add	r3, r3, #48	; 0x30
4000835c:	e6ef2073 	uxtb	r2, r3
40008360:	e51b3014 	ldr	r3, [fp, #-20]
40008364:	e5c32000 	strb	r2, [r3]
40008368:	e51b3014 	ldr	r3, [fp, #-20]
4000836c:	e2833001 	add	r3, r3, #1
40008370:	e3a02000 	mov	r2, #0
40008374:	e5c32000 	strb	r2, [r3]
40008378:	ea000028 	b	40008420 <itod+0xf0>
4000837c:	e51b2010 	ldr	r2, [fp, #-16]
40008380:	e59f30a0 	ldr	r3, [pc, #160]	; 40008428 <itod+0xf8>
40008384:	e0831293 	umull	r1, r3, r3, r2
40008388:	e1a031a3 	lsr	r3, r3, #3
4000838c:	e1a00003 	mov	r0, r3
40008390:	e51b1014 	ldr	r1, [fp, #-20]
40008394:	ebffffe5 	bl	40008330 <itod>
40008398:	e3a03000 	mov	r3, #0
4000839c:	e50b3008 	str	r3, [fp, #-8]
400083a0:	ea000002 	b	400083b0 <itod+0x80>
400083a4:	e51b3008 	ldr	r3, [fp, #-8]
400083a8:	e2833001 	add	r3, r3, #1
400083ac:	e50b3008 	str	r3, [fp, #-8]
400083b0:	e51b3008 	ldr	r3, [fp, #-8]
400083b4:	e51b2014 	ldr	r2, [fp, #-20]
400083b8:	e0823003 	add	r3, r2, r3
400083bc:	e5d33000 	ldrb	r3, [r3]
400083c0:	e3530000 	cmp	r3, #0
400083c4:	1afffff6 	bne	400083a4 <itod+0x74>
400083c8:	e51b3008 	ldr	r3, [fp, #-8]
400083cc:	e51b2014 	ldr	r2, [fp, #-20]
400083d0:	e0820003 	add	r0, r2, r3
400083d4:	e51b1010 	ldr	r1, [fp, #-16]
400083d8:	e59f3048 	ldr	r3, [pc, #72]	; 40008428 <itod+0xf8>
400083dc:	e0832193 	umull	r2, r3, r3, r1
400083e0:	e1a021a3 	lsr	r2, r3, #3
400083e4:	e1a03002 	mov	r3, r2
400083e8:	e1a03103 	lsl	r3, r3, #2
400083ec:	e0833002 	add	r3, r3, r2
400083f0:	e1a03083 	lsl	r3, r3, #1
400083f4:	e0632001 	rsb	r2, r3, r1
400083f8:	e6ef3072 	uxtb	r3, r2
400083fc:	e2833030 	add	r3, r3, #48	; 0x30
40008400:	e6ef3073 	uxtb	r3, r3
40008404:	e5c03000 	strb	r3, [r0]
40008408:	e51b3008 	ldr	r3, [fp, #-8]
4000840c:	e2833001 	add	r3, r3, #1
40008410:	e51b2014 	ldr	r2, [fp, #-20]
40008414:	e0823003 	add	r3, r2, r3
40008418:	e3a02000 	mov	r2, #0
4000841c:	e5c32000 	strb	r2, [r3]
40008420:	e24bd004 	sub	sp, fp, #4
40008424:	e8bd8800 	pop	{fp, pc}
40008428:	cccccccd 	.word	0xcccccccd

4000842c <itox>:
4000842c:	e92d4800 	push	{fp, lr}
40008430:	e28db004 	add	fp, sp, #4
40008434:	e24dd010 	sub	sp, sp, #16
40008438:	e50b0010 	str	r0, [fp, #-16]
4000843c:	e50b1014 	str	r1, [fp, #-20]
40008440:	e51b3010 	ldr	r3, [fp, #-16]
40008444:	e353000f 	cmp	r3, #15
40008448:	8a000014 	bhi	400084a0 <itox+0x74>
4000844c:	e51b3010 	ldr	r3, [fp, #-16]
40008450:	e3530009 	cmp	r3, #9
40008454:	9a000006 	bls	40008474 <itox+0x48>
40008458:	e51b3010 	ldr	r3, [fp, #-16]
4000845c:	e6ef3073 	uxtb	r3, r3
40008460:	e2833057 	add	r3, r3, #87	; 0x57
40008464:	e6ef2073 	uxtb	r2, r3
40008468:	e51b3014 	ldr	r3, [fp, #-20]
4000846c:	e5c32000 	strb	r2, [r3]
40008470:	ea000005 	b	4000848c <itox+0x60>
40008474:	e51b3010 	ldr	r3, [fp, #-16]
40008478:	e6ef3073 	uxtb	r3, r3
4000847c:	e2833030 	add	r3, r3, #48	; 0x30
40008480:	e6ef2073 	uxtb	r2, r3
40008484:	e51b3014 	ldr	r3, [fp, #-20]
40008488:	e5c32000 	strb	r2, [r3]
4000848c:	e51b3014 	ldr	r3, [fp, #-20]
40008490:	e2833001 	add	r3, r3, #1
40008494:	e3a02000 	mov	r2, #0
40008498:	e5c32000 	strb	r2, [r3]
4000849c:	ea00002f 	b	40008560 <itox+0x134>
400084a0:	e51b3010 	ldr	r3, [fp, #-16]
400084a4:	e1a03223 	lsr	r3, r3, #4
400084a8:	e1a00003 	mov	r0, r3
400084ac:	e51b1014 	ldr	r1, [fp, #-20]
400084b0:	ebffffdd 	bl	4000842c <itox>
400084b4:	e3a03000 	mov	r3, #0
400084b8:	e50b3008 	str	r3, [fp, #-8]
400084bc:	ea000002 	b	400084cc <itox+0xa0>
400084c0:	e51b3008 	ldr	r3, [fp, #-8]
400084c4:	e2833001 	add	r3, r3, #1
400084c8:	e50b3008 	str	r3, [fp, #-8]
400084cc:	e51b3008 	ldr	r3, [fp, #-8]
400084d0:	e51b2014 	ldr	r2, [fp, #-20]
400084d4:	e0823003 	add	r3, r2, r3
400084d8:	e5d33000 	ldrb	r3, [r3]
400084dc:	e3530000 	cmp	r3, #0
400084e0:	1afffff6 	bne	400084c0 <itox+0x94>
400084e4:	e51b3010 	ldr	r3, [fp, #-16]
400084e8:	e203300f 	and	r3, r3, #15
400084ec:	e3530009 	cmp	r3, #9
400084f0:	9a00000a 	bls	40008520 <itox+0xf4>
400084f4:	e51b3008 	ldr	r3, [fp, #-8]
400084f8:	e51b2014 	ldr	r2, [fp, #-20]
400084fc:	e0823003 	add	r3, r2, r3
40008500:	e51b2010 	ldr	r2, [fp, #-16]
40008504:	e6ef2072 	uxtb	r2, r2
40008508:	e202200f 	and	r2, r2, #15
4000850c:	e6ef2072 	uxtb	r2, r2
40008510:	e2822057 	add	r2, r2, #87	; 0x57
40008514:	e6ef2072 	uxtb	r2, r2
40008518:	e5c32000 	strb	r2, [r3]
4000851c:	ea000009 	b	40008548 <itox+0x11c>
40008520:	e51b3008 	ldr	r3, [fp, #-8]
40008524:	e51b2014 	ldr	r2, [fp, #-20]
40008528:	e0823003 	add	r3, r2, r3
4000852c:	e51b2010 	ldr	r2, [fp, #-16]
40008530:	e6ef2072 	uxtb	r2, r2
40008534:	e202200f 	and	r2, r2, #15
40008538:	e6ef2072 	uxtb	r2, r2
4000853c:	e2822030 	add	r2, r2, #48	; 0x30
40008540:	e6ef2072 	uxtb	r2, r2
40008544:	e5c32000 	strb	r2, [r3]
40008548:	e51b3008 	ldr	r3, [fp, #-8]
4000854c:	e2833001 	add	r3, r3, #1
40008550:	e51b2014 	ldr	r2, [fp, #-20]
40008554:	e0823003 	add	r3, r2, r3
40008558:	e3a02000 	mov	r2, #0
4000855c:	e5c32000 	strb	r2, [r3]
40008560:	e24bd004 	sub	sp, fp, #4
40008564:	e8bd8800 	pop	{fp, pc}

40008568 <uprintf>:
40008568:	e92d000f 	push	{r0, r1, r2, r3}
4000856c:	e92d4800 	push	{fp, lr}
40008570:	e28db004 	add	fp, sp, #4
40008574:	e24dd028 	sub	sp, sp, #40	; 0x28
40008578:	e28b3004 	add	r3, fp, #4
4000857c:	e2833004 	add	r3, r3, #4
40008580:	e50b300c 	str	r3, [fp, #-12]
40008584:	ea00006a 	b	40008734 <uprintf+0x1cc>
40008588:	e59b3004 	ldr	r3, [fp, #4]
4000858c:	e5d33000 	ldrb	r3, [r3]
40008590:	e3530025 	cmp	r3, #37	; 0x25
40008594:	0a000004 	beq	400085ac <uprintf+0x44>
40008598:	e59b3004 	ldr	r3, [fp, #4]
4000859c:	e5d33000 	ldrb	r3, [r3]
400085a0:	e1a00003 	mov	r0, r3
400085a4:	ebffff23 	bl	40008238 <uart_send>
400085a8:	ea00005e 	b	40008728 <uprintf+0x1c0>
400085ac:	e59b3004 	ldr	r3, [fp, #4]
400085b0:	e2833001 	add	r3, r3, #1
400085b4:	e58b3004 	str	r3, [fp, #4]
400085b8:	e59b3004 	ldr	r3, [fp, #4]
400085bc:	e5d33000 	ldrb	r3, [r3]
400085c0:	e2433063 	sub	r3, r3, #99	; 0x63
400085c4:	e3530015 	cmp	r3, #21
400085c8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
400085cc:	ea000054 	b	40008724 <uprintf+0x1bc>
400085d0:	40008628 	.word	0x40008628
400085d4:	4000867c 	.word	0x4000867c
400085d8:	40008724 	.word	0x40008724
400085dc:	40008724 	.word	0x40008724
400085e0:	40008724 	.word	0x40008724
400085e4:	40008724 	.word	0x40008724
400085e8:	40008724 	.word	0x40008724
400085ec:	40008724 	.word	0x40008724
400085f0:	40008724 	.word	0x40008724
400085f4:	40008724 	.word	0x40008724
400085f8:	40008724 	.word	0x40008724
400085fc:	40008724 	.word	0x40008724
40008600:	40008724 	.word	0x40008724
40008604:	40008724 	.word	0x40008724
40008608:	40008724 	.word	0x40008724
4000860c:	40008724 	.word	0x40008724
40008610:	40008654 	.word	0x40008654
40008614:	40008724 	.word	0x40008724
40008618:	40008724 	.word	0x40008724
4000861c:	40008724 	.word	0x40008724
40008620:	40008724 	.word	0x40008724
40008624:	400086e0 	.word	0x400086e0
40008628:	e51b300c 	ldr	r3, [fp, #-12]
4000862c:	e5933000 	ldr	r3, [r3]
40008630:	e50b3010 	str	r3, [fp, #-16]
40008634:	e51b300c 	ldr	r3, [fp, #-12]
40008638:	e2833004 	add	r3, r3, #4
4000863c:	e50b300c 	str	r3, [fp, #-12]
40008640:	e51b3010 	ldr	r3, [fp, #-16]
40008644:	e6ef3073 	uxtb	r3, r3
40008648:	e1a00003 	mov	r0, r3
4000864c:	ebfffef9 	bl	40008238 <uart_send>
40008650:	ea000034 	b	40008728 <uprintf+0x1c0>
40008654:	e51b300c 	ldr	r3, [fp, #-12]
40008658:	e5933000 	ldr	r3, [r3]
4000865c:	e50b3014 	str	r3, [fp, #-20]
40008660:	e51b300c 	ldr	r3, [fp, #-12]
40008664:	e2833004 	add	r3, r3, #4
40008668:	e50b300c 	str	r3, [fp, #-12]
4000866c:	e51b3014 	ldr	r3, [fp, #-20]
40008670:	e1a00003 	mov	r0, r3
40008674:	ebffff06 	bl	40008294 <puts_>
40008678:	ea00002a 	b	40008728 <uprintf+0x1c0>
4000867c:	e51b300c 	ldr	r3, [fp, #-12]
40008680:	e5933000 	ldr	r3, [r3]
40008684:	e50b3018 	str	r3, [fp, #-24]
40008688:	e51b300c 	ldr	r3, [fp, #-12]
4000868c:	e2833004 	add	r3, r3, #4
40008690:	e50b300c 	str	r3, [fp, #-12]
40008694:	e51b3018 	ldr	r3, [fp, #-24]
40008698:	e50b3008 	str	r3, [fp, #-8]
4000869c:	e51b3008 	ldr	r3, [fp, #-8]
400086a0:	e3530000 	cmp	r3, #0
400086a4:	aa000004 	bge	400086bc <uprintf+0x154>
400086a8:	e3a0002d 	mov	r0, #45	; 0x2d
400086ac:	ebfffee1 	bl	40008238 <uart_send>
400086b0:	e51b3008 	ldr	r3, [fp, #-8]
400086b4:	e2633000 	rsb	r3, r3, #0
400086b8:	e50b3008 	str	r3, [fp, #-8]
400086bc:	e51b2008 	ldr	r2, [fp, #-8]
400086c0:	e24b302c 	sub	r3, fp, #44	; 0x2c
400086c4:	e1a00002 	mov	r0, r2
400086c8:	e1a01003 	mov	r1, r3
400086cc:	ebffff17 	bl	40008330 <itod>
400086d0:	e24b302c 	sub	r3, fp, #44	; 0x2c
400086d4:	e1a00003 	mov	r0, r3
400086d8:	ebfffeed 	bl	40008294 <puts_>
400086dc:	ea000011 	b	40008728 <uprintf+0x1c0>
400086e0:	e51b300c 	ldr	r3, [fp, #-12]
400086e4:	e5933000 	ldr	r3, [r3]
400086e8:	e50b301c 	str	r3, [fp, #-28]
400086ec:	e51b300c 	ldr	r3, [fp, #-12]
400086f0:	e2833004 	add	r3, r3, #4
400086f4:	e50b300c 	str	r3, [fp, #-12]
400086f8:	e51b301c 	ldr	r3, [fp, #-28]
400086fc:	e50b3008 	str	r3, [fp, #-8]
40008700:	e51b2008 	ldr	r2, [fp, #-8]
40008704:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008708:	e1a00002 	mov	r0, r2
4000870c:	e1a01003 	mov	r1, r3
40008710:	ebffff45 	bl	4000842c <itox>
40008714:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008718:	e1a00003 	mov	r0, r3
4000871c:	ebfffedc 	bl	40008294 <puts_>
40008720:	ea000000 	b	40008728 <uprintf+0x1c0>
40008724:	e1a00000 	nop			; (mov r0, r0)
40008728:	e59b3004 	ldr	r3, [fp, #4]
4000872c:	e2833001 	add	r3, r3, #1
40008730:	e58b3004 	str	r3, [fp, #4]
40008734:	e59b3004 	ldr	r3, [fp, #4]
40008738:	e5d33000 	ldrb	r3, [r3]
4000873c:	e3530000 	cmp	r3, #0
40008740:	1affff90 	bne	40008588 <uprintf+0x20>
40008744:	e3a03000 	mov	r3, #0
40008748:	e50b300c 	str	r3, [fp, #-12]
4000874c:	e3a03000 	mov	r3, #0
40008750:	e1a00003 	mov	r0, r3
40008754:	e24bd004 	sub	sp, fp, #4
40008758:	e8bd4800 	pop	{fp, lr}
4000875c:	e28dd010 	add	sp, sp, #16
40008760:	e12fff1e 	bx	lr

40008764 <pwm0_init>:
40008764:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008768:	e28db000 	add	fp, sp, #0
4000876c:	e59f30d8 	ldr	r3, [pc, #216]	; 4000884c <pwm0_init+0xe8>
40008770:	e59f20d4 	ldr	r2, [pc, #212]	; 4000884c <pwm0_init+0xe8>
40008774:	e5922000 	ldr	r2, [r2]
40008778:	e3c2200f 	bic	r2, r2, #15
4000877c:	e5832000 	str	r2, [r3]
40008780:	e59f30c4 	ldr	r3, [pc, #196]	; 4000884c <pwm0_init+0xe8>
40008784:	e59f20c0 	ldr	r2, [pc, #192]	; 4000884c <pwm0_init+0xe8>
40008788:	e5922000 	ldr	r2, [r2]
4000878c:	e3822002 	orr	r2, r2, #2
40008790:	e5832000 	str	r2, [r3]
40008794:	e59f30b4 	ldr	r3, [pc, #180]	; 40008850 <pwm0_init+0xec>
40008798:	e59f20b0 	ldr	r2, [pc, #176]	; 40008850 <pwm0_init+0xec>
4000879c:	e5922000 	ldr	r2, [r2]
400087a0:	e3c220ff 	bic	r2, r2, #255	; 0xff
400087a4:	e5832000 	str	r2, [r3]
400087a8:	e59f30a0 	ldr	r3, [pc, #160]	; 40008850 <pwm0_init+0xec>
400087ac:	e59f209c 	ldr	r2, [pc, #156]	; 40008850 <pwm0_init+0xec>
400087b0:	e5922000 	ldr	r2, [r2]
400087b4:	e3822031 	orr	r2, r2, #49	; 0x31
400087b8:	e5832000 	str	r2, [r3]
400087bc:	e59f3090 	ldr	r3, [pc, #144]	; 40008854 <pwm0_init+0xf0>
400087c0:	e59f208c 	ldr	r2, [pc, #140]	; 40008854 <pwm0_init+0xf0>
400087c4:	e5922000 	ldr	r2, [r2]
400087c8:	e3c2200f 	bic	r2, r2, #15
400087cc:	e5832000 	str	r2, [r3]
400087d0:	e59f307c 	ldr	r3, [pc, #124]	; 40008854 <pwm0_init+0xf0>
400087d4:	e59f2078 	ldr	r2, [pc, #120]	; 40008854 <pwm0_init+0xf0>
400087d8:	e5922000 	ldr	r2, [r2]
400087dc:	e3822001 	orr	r2, r2, #1
400087e0:	e5832000 	str	r2, [r3]
400087e4:	e59f306c 	ldr	r3, [pc, #108]	; 40008858 <pwm0_init+0xf4>
400087e8:	e3a02ffa 	mov	r2, #1000	; 0x3e8
400087ec:	e5832000 	str	r2, [r3]
400087f0:	e59f3064 	ldr	r3, [pc, #100]	; 4000885c <pwm0_init+0xf8>
400087f4:	e59f205c 	ldr	r2, [pc, #92]	; 40008858 <pwm0_init+0xf4>
400087f8:	e5922000 	ldr	r2, [r2]
400087fc:	e1a020a2 	lsr	r2, r2, #1
40008800:	e5832000 	str	r2, [r3]
40008804:	e59f3054 	ldr	r3, [pc, #84]	; 40008860 <pwm0_init+0xfc>
40008808:	e59f2050 	ldr	r2, [pc, #80]	; 40008860 <pwm0_init+0xfc>
4000880c:	e5922000 	ldr	r2, [r2]
40008810:	e3822002 	orr	r2, r2, #2
40008814:	e5832000 	str	r2, [r3]
40008818:	e59f3040 	ldr	r3, [pc, #64]	; 40008860 <pwm0_init+0xfc>
4000881c:	e59f203c 	ldr	r2, [pc, #60]	; 40008860 <pwm0_init+0xfc>
40008820:	e5922000 	ldr	r2, [r2]
40008824:	e3c22002 	bic	r2, r2, #2
40008828:	e5832000 	str	r2, [r3]
4000882c:	e59f302c 	ldr	r3, [pc, #44]	; 40008860 <pwm0_init+0xfc>
40008830:	e59f2028 	ldr	r2, [pc, #40]	; 40008860 <pwm0_init+0xfc>
40008834:	e5922000 	ldr	r2, [r2]
40008838:	e3822009 	orr	r2, r2, #9
4000883c:	e5832000 	str	r2, [r3]
40008840:	e28bd000 	add	sp, fp, #0
40008844:	e8bd0800 	pop	{fp}
40008848:	e12fff1e 	bx	lr
4000884c:	114000a0 	.word	0x114000a0
40008850:	139d0000 	.word	0x139d0000
40008854:	139d0004 	.word	0x139d0004
40008858:	139d000c 	.word	0x139d000c
4000885c:	139d0010 	.word	0x139d0010
40008860:	139d0008 	.word	0x139d0008
