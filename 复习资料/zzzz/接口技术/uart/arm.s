
arm:     file format elf32-littlearm


Disassembly of section .text:

40008000 <_bss_start>:
40008000:	400087c0 	.word	0x400087c0

40008004 <_bss_end>:
40008004:	400087c4 	.word	0x400087c4

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
40008080:	eb00005e 	bl	40008200 <uart_init>
40008084:	eb000011 	bl	400080d0 <beep_init>
40008088:	e55b2005 	ldrb	r2, [fp, #-5]
4000808c:	e59f3034 	ldr	r3, [pc, #52]	; 400080c8 <main+0x5c>
40008090:	e5933000 	ldr	r3, [r3]
40008094:	e59f0030 	ldr	r0, [pc, #48]	; 400080cc <main+0x60>
40008098:	e1a01002 	mov	r1, r2
4000809c:	e1a02003 	mov	r2, r3
400080a0:	eb000140 	bl	400085a8 <uprintf>
400080a4:	e55b2005 	ldrb	r2, [fp, #-5]
400080a8:	e59f3018 	ldr	r3, [pc, #24]	; 400080c8 <main+0x5c>
400080ac:	e5933000 	ldr	r3, [r3]
400080b0:	e59f0014 	ldr	r0, [pc, #20]	; 400080cc <main+0x60>
400080b4:	e1a01002 	mov	r1, r2
400080b8:	e1a02003 	mov	r2, r3
400080bc:	eb000139 	bl	400085a8 <uprintf>
400080c0:	e24bd004 	sub	sp, fp, #4
400080c4:	e8bd8800 	pop	{fp, pc}
400080c8:	400087c0 	.word	0x400087c0
400080cc:	400087a4 	.word	0x400087a4

400080d0 <beep_init>:
400080d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400080d4:	e28db000 	add	fp, sp, #0
400080d8:	e59f302c 	ldr	r3, [pc, #44]	; 4000810c <beep_init+0x3c>
400080dc:	e59f2028 	ldr	r2, [pc, #40]	; 4000810c <beep_init+0x3c>
400080e0:	e5922000 	ldr	r2, [r2]
400080e4:	e3c2200f 	bic	r2, r2, #15
400080e8:	e5832000 	str	r2, [r3]
400080ec:	e59f3018 	ldr	r3, [pc, #24]	; 4000810c <beep_init+0x3c>
400080f0:	e59f2014 	ldr	r2, [pc, #20]	; 4000810c <beep_init+0x3c>
400080f4:	e5922000 	ldr	r2, [r2]
400080f8:	e3822001 	orr	r2, r2, #1
400080fc:	e5832000 	str	r2, [r3]
40008100:	e28bd000 	add	sp, fp, #0
40008104:	e8bd0800 	pop	{fp}
40008108:	e12fff1e 	bx	lr
4000810c:	114000a0 	.word	0x114000a0

40008110 <beep_on>:
40008110:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008114:	e28db000 	add	fp, sp, #0
40008118:	e59f3018 	ldr	r3, [pc, #24]	; 40008138 <beep_on+0x28>
4000811c:	e59f2014 	ldr	r2, [pc, #20]	; 40008138 <beep_on+0x28>
40008120:	e5922000 	ldr	r2, [r2]
40008124:	e3822001 	orr	r2, r2, #1
40008128:	e5832000 	str	r2, [r3]
4000812c:	e28bd000 	add	sp, fp, #0
40008130:	e8bd0800 	pop	{fp}
40008134:	e12fff1e 	bx	lr
40008138:	114000a4 	.word	0x114000a4

4000813c <beep_off>:
4000813c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008140:	e28db000 	add	fp, sp, #0
40008144:	e59f3018 	ldr	r3, [pc, #24]	; 40008164 <beep_off+0x28>
40008148:	e59f2014 	ldr	r2, [pc, #20]	; 40008164 <beep_off+0x28>
4000814c:	e5922000 	ldr	r2, [r2]
40008150:	e3c22001 	bic	r2, r2, #1
40008154:	e5832000 	str	r2, [r3]
40008158:	e28bd000 	add	sp, fp, #0
4000815c:	e8bd0800 	pop	{fp}
40008160:	e12fff1e 	bx	lr
40008164:	114000a4 	.word	0x114000a4

40008168 <led_init>:
40008168:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000816c:	e28db000 	add	fp, sp, #0
40008170:	e59f302c 	ldr	r3, [pc, #44]	; 400081a4 <led_init+0x3c>
40008174:	e59f2028 	ldr	r2, [pc, #40]	; 400081a4 <led_init+0x3c>
40008178:	e5922000 	ldr	r2, [r2]
4000817c:	e3c22a0f 	bic	r2, r2, #61440	; 0xf000
40008180:	e5832000 	str	r2, [r3]
40008184:	e59f3018 	ldr	r3, [pc, #24]	; 400081a4 <led_init+0x3c>
40008188:	e59f2014 	ldr	r2, [pc, #20]	; 400081a4 <led_init+0x3c>
4000818c:	e5922000 	ldr	r2, [r2]
40008190:	e3822a01 	orr	r2, r2, #4096	; 0x1000
40008194:	e5832000 	str	r2, [r3]
40008198:	e28bd000 	add	sp, fp, #0
4000819c:	e8bd0800 	pop	{fp}
400081a0:	e12fff1e 	bx	lr
400081a4:	110002e0 	.word	0x110002e0

400081a8 <led_on>:
400081a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081ac:	e28db000 	add	fp, sp, #0
400081b0:	e59f3018 	ldr	r3, [pc, #24]	; 400081d0 <led_on+0x28>
400081b4:	e59f2014 	ldr	r2, [pc, #20]	; 400081d0 <led_on+0x28>
400081b8:	e5922000 	ldr	r2, [r2]
400081bc:	e3c22008 	bic	r2, r2, #8
400081c0:	e5832000 	str	r2, [r3]
400081c4:	e28bd000 	add	sp, fp, #0
400081c8:	e8bd0800 	pop	{fp}
400081cc:	e12fff1e 	bx	lr
400081d0:	110002e4 	.word	0x110002e4

400081d4 <led_off>:
400081d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081d8:	e28db000 	add	fp, sp, #0
400081dc:	e59f3018 	ldr	r3, [pc, #24]	; 400081fc <led_off+0x28>
400081e0:	e59f2014 	ldr	r2, [pc, #20]	; 400081fc <led_off+0x28>
400081e4:	e5922000 	ldr	r2, [r2]
400081e8:	e3822008 	orr	r2, r2, #8
400081ec:	e5832000 	str	r2, [r3]
400081f0:	e28bd000 	add	sp, fp, #0
400081f4:	e8bd0800 	pop	{fp}
400081f8:	e12fff1e 	bx	lr
400081fc:	110002e4 	.word	0x110002e4

40008200 <uart_init>:
40008200:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008204:	e28db000 	add	fp, sp, #0
40008208:	e3a03545 	mov	r3, #289406976	; 0x11400000
4000820c:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008210:	e5922000 	ldr	r2, [r2]
40008214:	e3c220ff 	bic	r2, r2, #255	; 0xff
40008218:	e5832000 	str	r2, [r3]
4000821c:	e3a03545 	mov	r3, #289406976	; 0x11400000
40008220:	e3a02545 	mov	r2, #289406976	; 0x11400000
40008224:	e5922000 	ldr	r2, [r2]
40008228:	e3822022 	orr	r2, r2, #34	; 0x22
4000822c:	e5832000 	str	r2, [r3]
40008230:	e3a0354e 	mov	r3, #327155712	; 0x13800000
40008234:	e3a02003 	mov	r2, #3
40008238:	e5832000 	str	r2, [r3]
4000823c:	e59f3028 	ldr	r3, [pc, #40]	; 4000826c <uart_init+0x6c>
40008240:	e3a02005 	mov	r2, #5
40008244:	e5832000 	str	r2, [r3]
40008248:	e59f3020 	ldr	r3, [pc, #32]	; 40008270 <uart_init+0x70>
4000824c:	e3a02035 	mov	r2, #53	; 0x35
40008250:	e5832000 	str	r2, [r3]
40008254:	e59f3018 	ldr	r3, [pc, #24]	; 40008274 <uart_init+0x74>
40008258:	e3a02004 	mov	r2, #4
4000825c:	e5832000 	str	r2, [r3]
40008260:	e28bd000 	add	sp, fp, #0
40008264:	e8bd0800 	pop	{fp}
40008268:	e12fff1e 	bx	lr
4000826c:	13800004 	.word	0x13800004
40008270:	13800028 	.word	0x13800028
40008274:	1380002c 	.word	0x1380002c

40008278 <uart_send>:
40008278:	e92d4800 	push	{fp, lr}
4000827c:	e28db004 	add	fp, sp, #4
40008280:	e24dd008 	sub	sp, sp, #8
40008284:	e1a03000 	mov	r3, r0
40008288:	e54b3005 	strb	r3, [fp, #-5]
4000828c:	e1a00000 	nop			; (mov r0, r0)
40008290:	e59f3034 	ldr	r3, [pc, #52]	; 400082cc <uart_send+0x54>
40008294:	e5933000 	ldr	r3, [r3]
40008298:	e2033002 	and	r3, r3, #2
4000829c:	e3530000 	cmp	r3, #0
400082a0:	0afffffa 	beq	40008290 <uart_send+0x18>
400082a4:	e59f3024 	ldr	r3, [pc, #36]	; 400082d0 <uart_send+0x58>
400082a8:	e55b2005 	ldrb	r2, [fp, #-5]
400082ac:	e5832000 	str	r2, [r3]
400082b0:	e55b3005 	ldrb	r3, [fp, #-5]
400082b4:	e353000a 	cmp	r3, #10
400082b8:	1a000001 	bne	400082c4 <uart_send+0x4c>
400082bc:	e3a0000d 	mov	r0, #13
400082c0:	ebffffec 	bl	40008278 <uart_send>
400082c4:	e24bd004 	sub	sp, fp, #4
400082c8:	e8bd8800 	pop	{fp, pc}
400082cc:	13800010 	.word	0x13800010
400082d0:	13800020 	.word	0x13800020

400082d4 <puts_>:
400082d4:	e92d4800 	push	{fp, lr}
400082d8:	e28db004 	add	fp, sp, #4
400082dc:	e24dd008 	sub	sp, sp, #8
400082e0:	e50b0008 	str	r0, [fp, #-8]
400082e4:	ea000006 	b	40008304 <puts_+0x30>
400082e8:	e51b3008 	ldr	r3, [fp, #-8]
400082ec:	e5d33000 	ldrb	r3, [r3]
400082f0:	e1a00003 	mov	r0, r3
400082f4:	ebffffdf 	bl	40008278 <uart_send>
400082f8:	e51b3008 	ldr	r3, [fp, #-8]
400082fc:	e2833001 	add	r3, r3, #1
40008300:	e50b3008 	str	r3, [fp, #-8]
40008304:	e51b3008 	ldr	r3, [fp, #-8]
40008308:	e5d33000 	ldrb	r3, [r3]
4000830c:	e3530000 	cmp	r3, #0
40008310:	1afffff4 	bne	400082e8 <puts_+0x14>
40008314:	e24bd004 	sub	sp, fp, #4
40008318:	e8bd8800 	pop	{fp, pc}

4000831c <uart_rev>:
4000831c:	e92d4800 	push	{fp, lr}
40008320:	e28db004 	add	fp, sp, #4
40008324:	e24dd008 	sub	sp, sp, #8
40008328:	e1a00000 	nop			; (mov r0, r0)
4000832c:	e59f3034 	ldr	r3, [pc, #52]	; 40008368 <uart_rev+0x4c>
40008330:	e5933000 	ldr	r3, [r3]
40008334:	e2033001 	and	r3, r3, #1
40008338:	e3530000 	cmp	r3, #0
4000833c:	0afffffa 	beq	4000832c <uart_rev+0x10>
40008340:	e59f3024 	ldr	r3, [pc, #36]	; 4000836c <uart_rev+0x50>
40008344:	e5933000 	ldr	r3, [r3]
40008348:	e54b3005 	strb	r3, [fp, #-5]
4000834c:	e55b3005 	ldrb	r3, [fp, #-5]
40008350:	e1a00003 	mov	r0, r3
40008354:	ebffffc7 	bl	40008278 <uart_send>
40008358:	e55b3005 	ldrb	r3, [fp, #-5]
4000835c:	e1a00003 	mov	r0, r3
40008360:	e24bd004 	sub	sp, fp, #4
40008364:	e8bd8800 	pop	{fp, pc}
40008368:	13800010 	.word	0x13800010
4000836c:	13800024 	.word	0x13800024

40008370 <itod>:
40008370:	e92d4800 	push	{fp, lr}
40008374:	e28db004 	add	fp, sp, #4
40008378:	e24dd010 	sub	sp, sp, #16
4000837c:	e50b0010 	str	r0, [fp, #-16]
40008380:	e50b1014 	str	r1, [fp, #-20]
40008384:	e51b3010 	ldr	r3, [fp, #-16]
40008388:	e3530009 	cmp	r3, #9
4000838c:	8a00000a 	bhi	400083bc <itod+0x4c>
40008390:	e51b3010 	ldr	r3, [fp, #-16]
40008394:	e6ef3073 	uxtb	r3, r3
40008398:	e2833030 	add	r3, r3, #48	; 0x30
4000839c:	e6ef2073 	uxtb	r2, r3
400083a0:	e51b3014 	ldr	r3, [fp, #-20]
400083a4:	e5c32000 	strb	r2, [r3]
400083a8:	e51b3014 	ldr	r3, [fp, #-20]
400083ac:	e2833001 	add	r3, r3, #1
400083b0:	e3a02000 	mov	r2, #0
400083b4:	e5c32000 	strb	r2, [r3]
400083b8:	ea000028 	b	40008460 <itod+0xf0>
400083bc:	e51b2010 	ldr	r2, [fp, #-16]
400083c0:	e59f30a0 	ldr	r3, [pc, #160]	; 40008468 <itod+0xf8>
400083c4:	e0831293 	umull	r1, r3, r3, r2
400083c8:	e1a031a3 	lsr	r3, r3, #3
400083cc:	e1a00003 	mov	r0, r3
400083d0:	e51b1014 	ldr	r1, [fp, #-20]
400083d4:	ebffffe5 	bl	40008370 <itod>
400083d8:	e3a03000 	mov	r3, #0
400083dc:	e50b3008 	str	r3, [fp, #-8]
400083e0:	ea000002 	b	400083f0 <itod+0x80>
400083e4:	e51b3008 	ldr	r3, [fp, #-8]
400083e8:	e2833001 	add	r3, r3, #1
400083ec:	e50b3008 	str	r3, [fp, #-8]
400083f0:	e51b3008 	ldr	r3, [fp, #-8]
400083f4:	e51b2014 	ldr	r2, [fp, #-20]
400083f8:	e0823003 	add	r3, r2, r3
400083fc:	e5d33000 	ldrb	r3, [r3]
40008400:	e3530000 	cmp	r3, #0
40008404:	1afffff6 	bne	400083e4 <itod+0x74>
40008408:	e51b3008 	ldr	r3, [fp, #-8]
4000840c:	e51b2014 	ldr	r2, [fp, #-20]
40008410:	e0820003 	add	r0, r2, r3
40008414:	e51b1010 	ldr	r1, [fp, #-16]
40008418:	e59f3048 	ldr	r3, [pc, #72]	; 40008468 <itod+0xf8>
4000841c:	e0832193 	umull	r2, r3, r3, r1
40008420:	e1a021a3 	lsr	r2, r3, #3
40008424:	e1a03002 	mov	r3, r2
40008428:	e1a03103 	lsl	r3, r3, #2
4000842c:	e0833002 	add	r3, r3, r2
40008430:	e1a03083 	lsl	r3, r3, #1
40008434:	e0632001 	rsb	r2, r3, r1
40008438:	e6ef3072 	uxtb	r3, r2
4000843c:	e2833030 	add	r3, r3, #48	; 0x30
40008440:	e6ef3073 	uxtb	r3, r3
40008444:	e5c03000 	strb	r3, [r0]
40008448:	e51b3008 	ldr	r3, [fp, #-8]
4000844c:	e2833001 	add	r3, r3, #1
40008450:	e51b2014 	ldr	r2, [fp, #-20]
40008454:	e0823003 	add	r3, r2, r3
40008458:	e3a02000 	mov	r2, #0
4000845c:	e5c32000 	strb	r2, [r3]
40008460:	e24bd004 	sub	sp, fp, #4
40008464:	e8bd8800 	pop	{fp, pc}
40008468:	cccccccd 	.word	0xcccccccd

4000846c <itox>:
4000846c:	e92d4800 	push	{fp, lr}
40008470:	e28db004 	add	fp, sp, #4
40008474:	e24dd010 	sub	sp, sp, #16
40008478:	e50b0010 	str	r0, [fp, #-16]
4000847c:	e50b1014 	str	r1, [fp, #-20]
40008480:	e51b3010 	ldr	r3, [fp, #-16]
40008484:	e353000f 	cmp	r3, #15
40008488:	8a000014 	bhi	400084e0 <itox+0x74>
4000848c:	e51b3010 	ldr	r3, [fp, #-16]
40008490:	e3530009 	cmp	r3, #9
40008494:	9a000006 	bls	400084b4 <itox+0x48>
40008498:	e51b3010 	ldr	r3, [fp, #-16]
4000849c:	e6ef3073 	uxtb	r3, r3
400084a0:	e2833057 	add	r3, r3, #87	; 0x57
400084a4:	e6ef2073 	uxtb	r2, r3
400084a8:	e51b3014 	ldr	r3, [fp, #-20]
400084ac:	e5c32000 	strb	r2, [r3]
400084b0:	ea000005 	b	400084cc <itox+0x60>
400084b4:	e51b3010 	ldr	r3, [fp, #-16]
400084b8:	e6ef3073 	uxtb	r3, r3
400084bc:	e2833030 	add	r3, r3, #48	; 0x30
400084c0:	e6ef2073 	uxtb	r2, r3
400084c4:	e51b3014 	ldr	r3, [fp, #-20]
400084c8:	e5c32000 	strb	r2, [r3]
400084cc:	e51b3014 	ldr	r3, [fp, #-20]
400084d0:	e2833001 	add	r3, r3, #1
400084d4:	e3a02000 	mov	r2, #0
400084d8:	e5c32000 	strb	r2, [r3]
400084dc:	ea00002f 	b	400085a0 <itox+0x134>
400084e0:	e51b3010 	ldr	r3, [fp, #-16]
400084e4:	e1a03223 	lsr	r3, r3, #4
400084e8:	e1a00003 	mov	r0, r3
400084ec:	e51b1014 	ldr	r1, [fp, #-20]
400084f0:	ebffffdd 	bl	4000846c <itox>
400084f4:	e3a03000 	mov	r3, #0
400084f8:	e50b3008 	str	r3, [fp, #-8]
400084fc:	ea000002 	b	4000850c <itox+0xa0>
40008500:	e51b3008 	ldr	r3, [fp, #-8]
40008504:	e2833001 	add	r3, r3, #1
40008508:	e50b3008 	str	r3, [fp, #-8]
4000850c:	e51b3008 	ldr	r3, [fp, #-8]
40008510:	e51b2014 	ldr	r2, [fp, #-20]
40008514:	e0823003 	add	r3, r2, r3
40008518:	e5d33000 	ldrb	r3, [r3]
4000851c:	e3530000 	cmp	r3, #0
40008520:	1afffff6 	bne	40008500 <itox+0x94>
40008524:	e51b3010 	ldr	r3, [fp, #-16]
40008528:	e203300f 	and	r3, r3, #15
4000852c:	e3530009 	cmp	r3, #9
40008530:	9a00000a 	bls	40008560 <itox+0xf4>
40008534:	e51b3008 	ldr	r3, [fp, #-8]
40008538:	e51b2014 	ldr	r2, [fp, #-20]
4000853c:	e0823003 	add	r3, r2, r3
40008540:	e51b2010 	ldr	r2, [fp, #-16]
40008544:	e6ef2072 	uxtb	r2, r2
40008548:	e202200f 	and	r2, r2, #15
4000854c:	e6ef2072 	uxtb	r2, r2
40008550:	e2822057 	add	r2, r2, #87	; 0x57
40008554:	e6ef2072 	uxtb	r2, r2
40008558:	e5c32000 	strb	r2, [r3]
4000855c:	ea000009 	b	40008588 <itox+0x11c>
40008560:	e51b3008 	ldr	r3, [fp, #-8]
40008564:	e51b2014 	ldr	r2, [fp, #-20]
40008568:	e0823003 	add	r3, r2, r3
4000856c:	e51b2010 	ldr	r2, [fp, #-16]
40008570:	e6ef2072 	uxtb	r2, r2
40008574:	e202200f 	and	r2, r2, #15
40008578:	e6ef2072 	uxtb	r2, r2
4000857c:	e2822030 	add	r2, r2, #48	; 0x30
40008580:	e6ef2072 	uxtb	r2, r2
40008584:	e5c32000 	strb	r2, [r3]
40008588:	e51b3008 	ldr	r3, [fp, #-8]
4000858c:	e2833001 	add	r3, r3, #1
40008590:	e51b2014 	ldr	r2, [fp, #-20]
40008594:	e0823003 	add	r3, r2, r3
40008598:	e3a02000 	mov	r2, #0
4000859c:	e5c32000 	strb	r2, [r3]
400085a0:	e24bd004 	sub	sp, fp, #4
400085a4:	e8bd8800 	pop	{fp, pc}

400085a8 <uprintf>:
400085a8:	e92d000f 	push	{r0, r1, r2, r3}
400085ac:	e92d4800 	push	{fp, lr}
400085b0:	e28db004 	add	fp, sp, #4
400085b4:	e24dd028 	sub	sp, sp, #40	; 0x28
400085b8:	e28b3004 	add	r3, fp, #4
400085bc:	e2833004 	add	r3, r3, #4
400085c0:	e50b300c 	str	r3, [fp, #-12]
400085c4:	ea00006a 	b	40008774 <uprintf+0x1cc>
400085c8:	e59b3004 	ldr	r3, [fp, #4]
400085cc:	e5d33000 	ldrb	r3, [r3]
400085d0:	e3530025 	cmp	r3, #37	; 0x25
400085d4:	0a000004 	beq	400085ec <uprintf+0x44>
400085d8:	e59b3004 	ldr	r3, [fp, #4]
400085dc:	e5d33000 	ldrb	r3, [r3]
400085e0:	e1a00003 	mov	r0, r3
400085e4:	ebffff23 	bl	40008278 <uart_send>
400085e8:	ea00005e 	b	40008768 <uprintf+0x1c0>
400085ec:	e59b3004 	ldr	r3, [fp, #4]
400085f0:	e2833001 	add	r3, r3, #1
400085f4:	e58b3004 	str	r3, [fp, #4]
400085f8:	e59b3004 	ldr	r3, [fp, #4]
400085fc:	e5d33000 	ldrb	r3, [r3]
40008600:	e2433063 	sub	r3, r3, #99	; 0x63
40008604:	e3530015 	cmp	r3, #21
40008608:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
4000860c:	ea000054 	b	40008764 <uprintf+0x1bc>
40008610:	40008668 	.word	0x40008668
40008614:	400086bc 	.word	0x400086bc
40008618:	40008764 	.word	0x40008764
4000861c:	40008764 	.word	0x40008764
40008620:	40008764 	.word	0x40008764
40008624:	40008764 	.word	0x40008764
40008628:	40008764 	.word	0x40008764
4000862c:	40008764 	.word	0x40008764
40008630:	40008764 	.word	0x40008764
40008634:	40008764 	.word	0x40008764
40008638:	40008764 	.word	0x40008764
4000863c:	40008764 	.word	0x40008764
40008640:	40008764 	.word	0x40008764
40008644:	40008764 	.word	0x40008764
40008648:	40008764 	.word	0x40008764
4000864c:	40008764 	.word	0x40008764
40008650:	40008694 	.word	0x40008694
40008654:	40008764 	.word	0x40008764
40008658:	40008764 	.word	0x40008764
4000865c:	40008764 	.word	0x40008764
40008660:	40008764 	.word	0x40008764
40008664:	40008720 	.word	0x40008720
40008668:	e51b300c 	ldr	r3, [fp, #-12]
4000866c:	e5933000 	ldr	r3, [r3]
40008670:	e50b3010 	str	r3, [fp, #-16]
40008674:	e51b300c 	ldr	r3, [fp, #-12]
40008678:	e2833004 	add	r3, r3, #4
4000867c:	e50b300c 	str	r3, [fp, #-12]
40008680:	e51b3010 	ldr	r3, [fp, #-16]
40008684:	e6ef3073 	uxtb	r3, r3
40008688:	e1a00003 	mov	r0, r3
4000868c:	ebfffef9 	bl	40008278 <uart_send>
40008690:	ea000034 	b	40008768 <uprintf+0x1c0>
40008694:	e51b300c 	ldr	r3, [fp, #-12]
40008698:	e5933000 	ldr	r3, [r3]
4000869c:	e50b3014 	str	r3, [fp, #-20]
400086a0:	e51b300c 	ldr	r3, [fp, #-12]
400086a4:	e2833004 	add	r3, r3, #4
400086a8:	e50b300c 	str	r3, [fp, #-12]
400086ac:	e51b3014 	ldr	r3, [fp, #-20]
400086b0:	e1a00003 	mov	r0, r3
400086b4:	ebffff06 	bl	400082d4 <puts_>
400086b8:	ea00002a 	b	40008768 <uprintf+0x1c0>
400086bc:	e51b300c 	ldr	r3, [fp, #-12]
400086c0:	e5933000 	ldr	r3, [r3]
400086c4:	e50b3018 	str	r3, [fp, #-24]
400086c8:	e51b300c 	ldr	r3, [fp, #-12]
400086cc:	e2833004 	add	r3, r3, #4
400086d0:	e50b300c 	str	r3, [fp, #-12]
400086d4:	e51b3018 	ldr	r3, [fp, #-24]
400086d8:	e50b3008 	str	r3, [fp, #-8]
400086dc:	e51b3008 	ldr	r3, [fp, #-8]
400086e0:	e3530000 	cmp	r3, #0
400086e4:	aa000004 	bge	400086fc <uprintf+0x154>
400086e8:	e3a0002d 	mov	r0, #45	; 0x2d
400086ec:	ebfffee1 	bl	40008278 <uart_send>
400086f0:	e51b3008 	ldr	r3, [fp, #-8]
400086f4:	e2633000 	rsb	r3, r3, #0
400086f8:	e50b3008 	str	r3, [fp, #-8]
400086fc:	e51b2008 	ldr	r2, [fp, #-8]
40008700:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008704:	e1a00002 	mov	r0, r2
40008708:	e1a01003 	mov	r1, r3
4000870c:	ebffff17 	bl	40008370 <itod>
40008710:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008714:	e1a00003 	mov	r0, r3
40008718:	ebfffeed 	bl	400082d4 <puts_>
4000871c:	ea000011 	b	40008768 <uprintf+0x1c0>
40008720:	e51b300c 	ldr	r3, [fp, #-12]
40008724:	e5933000 	ldr	r3, [r3]
40008728:	e50b301c 	str	r3, [fp, #-28]
4000872c:	e51b300c 	ldr	r3, [fp, #-12]
40008730:	e2833004 	add	r3, r3, #4
40008734:	e50b300c 	str	r3, [fp, #-12]
40008738:	e51b301c 	ldr	r3, [fp, #-28]
4000873c:	e50b3008 	str	r3, [fp, #-8]
40008740:	e51b2008 	ldr	r2, [fp, #-8]
40008744:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008748:	e1a00002 	mov	r0, r2
4000874c:	e1a01003 	mov	r1, r3
40008750:	ebffff45 	bl	4000846c <itox>
40008754:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008758:	e1a00003 	mov	r0, r3
4000875c:	ebfffedc 	bl	400082d4 <puts_>
40008760:	ea000000 	b	40008768 <uprintf+0x1c0>
40008764:	e1a00000 	nop			; (mov r0, r0)
40008768:	e59b3004 	ldr	r3, [fp, #4]
4000876c:	e2833001 	add	r3, r3, #1
40008770:	e58b3004 	str	r3, [fp, #4]
40008774:	e59b3004 	ldr	r3, [fp, #4]
40008778:	e5d33000 	ldrb	r3, [r3]
4000877c:	e3530000 	cmp	r3, #0
40008780:	1affff90 	bne	400085c8 <uprintf+0x20>
40008784:	e3a03000 	mov	r3, #0
40008788:	e50b300c 	str	r3, [fp, #-12]
4000878c:	e3a03000 	mov	r3, #0
40008790:	e1a00003 	mov	r0, r3
40008794:	e24bd004 	sub	sp, fp, #4
40008798:	e8bd4800 	pop	{fp, lr}
4000879c:	e28dd010 	add	sp, sp, #16
400087a0:	e12fff1e 	bx	lr
