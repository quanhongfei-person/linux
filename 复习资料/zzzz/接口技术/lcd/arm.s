
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
40008020:	40008040 	.word	0x40008040

40008024 <_software_interrupt>:
40008024:	40008040 	.word	0x40008040

40008028 <_prefetch_abort>:
40008028:	4000804c 	.word	0x4000804c

4000802c <_data_abort>:
4000802c:	4000804c 	.word	0x4000804c

40008030 <_not_used>:
40008030:	11223344 	.word	0x11223344

40008034 <_irq>:
40008034:	4000804c 	.word	0x4000804c

40008038 <_fiq>:
40008038:	4000805c 	.word	0x4000805c

4000803c <_pad>:
4000803c:	12345678 	.word	0x12345678

40008040 <_end_vect>:
40008040:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008044:	eb000025 	bl	400080e0 <do_svc>
40008048:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

4000804c <data_abort>:
4000804c:	e24ee004 	sub	lr, lr, #4
40008050:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008054:	eb0003a9 	bl	40008f00 <do_irq>
40008058:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

4000805c <bss_start>:
4000805c:	40009c34 	.word	0x40009c34

40008060 <bss_end>:
40008060:	40009f24 	.word	0x40009f24

40008064 <reset>:
40008064:	e59f0028 	ldr	r0, [pc, #40]	; 40008094 <bss_clear+0x10>
40008068:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
4000806c:	e10f0000 	mrs	r0, CPSR
40008070:	e3c00080 	bic	r0, r0, #128	; 0x80
40008074:	e129f000 	msr	CPSR_fc, r0

40008078 <clear_bss>:
40008078:	e51f0024 	ldr	r0, [pc, #-36]	; 4000805c <bss_start>
4000807c:	e51f1024 	ldr	r1, [pc, #-36]	; 40008060 <bss_end>
40008080:	e3a02000 	mov	r2, #0

40008084 <bss_clear>:
40008084:	e4802004 	str	r2, [r0], #4
40008088:	e1500001 	cmp	r0, r1
4000808c:	1afffffc 	bne	40008084 <bss_clear>
40008090:	ea000018 	b	400080f8 <main>
40008094:	40008000 	.word	0x40008000

40008098 <delay>:
40008098:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000809c:	e28db000 	add	fp, sp, #0
400080a0:	e24dd004 	sub	sp, sp, #4
400080a4:	e50b0004 	str	r0, [fp, #-4]
400080a8:	e1a00000 	nop			; (mov r0, r0)
400080ac:	e51b3004 	ldr	r3, [fp, #-4]
400080b0:	e3530000 	cmp	r3, #0
400080b4:	03a03000 	moveq	r3, #0
400080b8:	13a03001 	movne	r3, #1
400080bc:	e6ef3073 	uxtb	r3, r3
400080c0:	e51b2004 	ldr	r2, [fp, #-4]
400080c4:	e2422001 	sub	r2, r2, #1
400080c8:	e50b2004 	str	r2, [fp, #-4]
400080cc:	e3530000 	cmp	r3, #0
400080d0:	1afffff5 	bne	400080ac <delay+0x14>
400080d4:	e28bd000 	add	sp, fp, #0
400080d8:	e8bd0800 	pop	{fp}
400080dc:	e12fff1e 	bx	lr

400080e0 <do_svc>:
400080e0:	e92d4800 	push	{fp, lr}
400080e4:	e28db004 	add	fp, sp, #4
400080e8:	e59f0004 	ldr	r0, [pc, #4]	; 400080f4 <do_svc+0x14>
400080ec:	eb0002c1 	bl	40008bf8 <uprintf>
400080f0:	e8bd8800 	pop	{fp, pc}
400080f4:	40009b10 	.word	0x40009b10

400080f8 <main>:
400080f8:	e92d4800 	push	{fp, lr}
400080fc:	e28db004 	add	fp, sp, #4
40008100:	e24dd008 	sub	sp, sp, #8
40008104:	e3a03000 	mov	r3, #0
40008108:	e50b300c 	str	r3, [fp, #-12]
4000810c:	e3a03000 	mov	r3, #0
40008110:	e54b3008 	strb	r3, [fp, #-8]
40008114:	eb000163 	bl	400086a8 <uart_init>
40008118:	eb000392 	bl	40008f68 <gic_init>
4000811c:	eb000656 	bl	40009a7c <touch_init>
40008120:	eb0004cb 	bl	40009454 <iic_init>
40008124:	ea000002 	b	40008134 <main+0x3c>
40008128:	e1a00000 	nop			; (mov r0, r0)
4000812c:	ea000000 	b	40008134 <main+0x3c>
40008130:	e1a00000 	nop			; (mov r0, r0)
40008134:	e59f3090 	ldr	r3, [pc, #144]	; 400081cc <main+0xd4>
40008138:	e5933000 	ldr	r3, [r3]
4000813c:	e3530000 	cmp	r3, #0
40008140:	da00000d 	ble	4000817c <main+0x84>
40008144:	e59f3080 	ldr	r3, [pc, #128]	; 400081cc <main+0xd4>
40008148:	e5932000 	ldr	r2, [r3]
4000814c:	e59f307c 	ldr	r3, [pc, #124]	; 400081d0 <main+0xd8>
40008150:	e1520003 	cmp	r2, r3
40008154:	ca000008 	bgt	4000817c <main+0x84>
40008158:	e59f3074 	ldr	r3, [pc, #116]	; 400081d4 <main+0xdc>
4000815c:	e3a02000 	mov	r2, #0
40008160:	e5832000 	str	r2, [r3]
40008164:	e59f3068 	ldr	r3, [pc, #104]	; 400081d4 <main+0xdc>
40008168:	e5932000 	ldr	r2, [r3]
4000816c:	e59f3058 	ldr	r3, [pc, #88]	; 400081cc <main+0xd4>
40008170:	e5832000 	str	r2, [r3]
40008174:	e59f005c 	ldr	r0, [pc, #92]	; 400081d8 <main+0xe0>
40008178:	eb00029e 	bl	40008bf8 <uprintf>
4000817c:	e59f3048 	ldr	r3, [pc, #72]	; 400081cc <main+0xd4>
40008180:	e5932000 	ldr	r2, [r3]
40008184:	e59f3044 	ldr	r3, [pc, #68]	; 400081d0 <main+0xd8>
40008188:	e1520003 	cmp	r2, r3
4000818c:	daffffe5 	ble	40008128 <main+0x30>
40008190:	e59f3034 	ldr	r3, [pc, #52]	; 400081cc <main+0xd4>
40008194:	e5932000 	ldr	r2, [r3]
40008198:	e59f303c 	ldr	r3, [pc, #60]	; 400081dc <main+0xe4>
4000819c:	e1520003 	cmp	r2, r3
400081a0:	caffffe2 	bgt	40008130 <main+0x38>
400081a4:	e59f3028 	ldr	r3, [pc, #40]	; 400081d4 <main+0xdc>
400081a8:	e3a02000 	mov	r2, #0
400081ac:	e5832000 	str	r2, [r3]
400081b0:	e59f301c 	ldr	r3, [pc, #28]	; 400081d4 <main+0xdc>
400081b4:	e5932000 	ldr	r2, [r3]
400081b8:	e59f300c 	ldr	r3, [pc, #12]	; 400081cc <main+0xd4>
400081bc:	e5832000 	str	r2, [r3]
400081c0:	e59f0018 	ldr	r0, [pc, #24]	; 400081e0 <main+0xe8>
400081c4:	eb00028b 	bl	40008bf8 <uprintf>
400081c8:	eaffffd9 	b	40008134 <main+0x3c>
400081cc:	40009f1c 	.word	0x40009f1c
400081d0:	0000018f 	.word	0x0000018f
400081d4:	40009f20 	.word	0x40009f20
400081d8:	40009b24 	.word	0x40009b24
400081dc:	0000031e 	.word	0x0000031e
400081e0:	40009b2c 	.word	0x40009b2c

400081e4 <led_init>:
400081e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400081e8:	e28db000 	add	fp, sp, #0
400081ec:	e59f3010 	ldr	r3, [pc, #16]	; 40008204 <led_init+0x20>
400081f0:	e59f2010 	ldr	r2, [pc, #16]	; 40008208 <led_init+0x24>
400081f4:	e5832000 	str	r2, [r3]
400081f8:	e28bd000 	add	sp, fp, #0
400081fc:	e8bd0800 	pop	{fp}
40008200:	e12fff1e 	bx	lr
40008204:	110002e0 	.word	0x110002e0
40008208:	00001111 	.word	0x00001111

4000820c <led_on>:
4000820c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008210:	e28db000 	add	fp, sp, #0
40008214:	e59f3010 	ldr	r3, [pc, #16]	; 4000822c <led_on+0x20>
40008218:	e3a02000 	mov	r2, #0
4000821c:	e5832000 	str	r2, [r3]
40008220:	e28bd000 	add	sp, fp, #0
40008224:	e8bd0800 	pop	{fp}
40008228:	e12fff1e 	bx	lr
4000822c:	110002e4 	.word	0x110002e4

40008230 <led_off>:
40008230:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008234:	e28db000 	add	fp, sp, #0
40008238:	e59f3010 	ldr	r3, [pc, #16]	; 40008250 <led_off+0x20>
4000823c:	e3a0200f 	mov	r2, #15
40008240:	e5832000 	str	r2, [r3]
40008244:	e28bd000 	add	sp, fp, #0
40008248:	e8bd0800 	pop	{fp}
4000824c:	e12fff1e 	bx	lr
40008250:	110002e4 	.word	0x110002e4

40008254 <key_init>:
40008254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008258:	e28db000 	add	fp, sp, #0
4000825c:	e59f3018 	ldr	r3, [pc, #24]	; 4000827c <key_init+0x28>
40008260:	e59f2014 	ldr	r2, [pc, #20]	; 4000827c <key_init+0x28>
40008264:	e5922000 	ldr	r2, [r2]
40008268:	e3c22c0f 	bic	r2, r2, #3840	; 0xf00
4000826c:	e5832000 	str	r2, [r3]
40008270:	e28bd000 	add	sp, fp, #0
40008274:	e8bd0800 	pop	{fp}
40008278:	e12fff1e 	bx	lr
4000827c:	11000c60 	.word	0x11000c60

40008280 <beep_init>:
40008280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008284:	e28db000 	add	fp, sp, #0
40008288:	e59f3010 	ldr	r3, [pc, #16]	; 400082a0 <beep_init+0x20>
4000828c:	e3a02001 	mov	r2, #1
40008290:	e5832000 	str	r2, [r3]
40008294:	e28bd000 	add	sp, fp, #0
40008298:	e8bd0800 	pop	{fp}
4000829c:	e12fff1e 	bx	lr
400082a0:	114000a0 	.word	0x114000a0

400082a4 <beep_on>:
400082a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400082a8:	e28db000 	add	fp, sp, #0
400082ac:	e59f3010 	ldr	r3, [pc, #16]	; 400082c4 <beep_on+0x20>
400082b0:	e3a02001 	mov	r2, #1
400082b4:	e5832000 	str	r2, [r3]
400082b8:	e28bd000 	add	sp, fp, #0
400082bc:	e8bd0800 	pop	{fp}
400082c0:	e12fff1e 	bx	lr
400082c4:	114000a4 	.word	0x114000a4

400082c8 <beep_off>:
400082c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400082cc:	e28db000 	add	fp, sp, #0
400082d0:	e59f3010 	ldr	r3, [pc, #16]	; 400082e8 <beep_off+0x20>
400082d4:	e3a02000 	mov	r2, #0
400082d8:	e5832000 	str	r2, [r3]
400082dc:	e28bd000 	add	sp, fp, #0
400082e0:	e8bd0800 	pop	{fp}
400082e4:	e12fff1e 	bx	lr
400082e8:	114000a4 	.word	0x114000a4

400082ec <do_timer2>:
400082ec:	e92d4800 	push	{fp, lr}
400082f0:	e28db004 	add	fp, sp, #4
400082f4:	e59f3018 	ldr	r3, [pc, #24]	; 40008314 <do_timer2+0x28>
400082f8:	e59f2014 	ldr	r2, [pc, #20]	; 40008314 <do_timer2+0x28>
400082fc:	e5922000 	ldr	r2, [r2]
40008300:	e3822080 	orr	r2, r2, #128	; 0x80
40008304:	e5832000 	str	r2, [r3]
40008308:	e59f0008 	ldr	r0, [pc, #8]	; 40008318 <do_timer2+0x2c>
4000830c:	eb000239 	bl	40008bf8 <uprintf>
40008310:	e8bd8800 	pop	{fp, pc}
40008314:	139d0044 	.word	0x139d0044
40008318:	40009b34 	.word	0x40009b34

4000831c <do_timer0>:
4000831c:	e92d4800 	push	{fp, lr}
40008320:	e28db004 	add	fp, sp, #4
40008324:	e59f304c 	ldr	r3, [pc, #76]	; 40008378 <do_timer0+0x5c>
40008328:	e59f2048 	ldr	r2, [pc, #72]	; 40008378 <do_timer0+0x5c>
4000832c:	e5922000 	ldr	r2, [r2]
40008330:	e3822020 	orr	r2, r2, #32
40008334:	e5832000 	str	r2, [r3]
40008338:	e59f003c 	ldr	r0, [pc, #60]	; 4000837c <do_timer0+0x60>
4000833c:	eb00022d 	bl	40008bf8 <uprintf>
40008340:	e59f3038 	ldr	r3, [pc, #56]	; 40008380 <do_timer0+0x64>
40008344:	e5933000 	ldr	r3, [r3]
40008348:	e3530000 	cmp	r3, #0
4000834c:	0a000004 	beq	40008364 <do_timer0+0x48>
40008350:	ebffffad 	bl	4000820c <led_on>
40008354:	e59f3024 	ldr	r3, [pc, #36]	; 40008380 <do_timer0+0x64>
40008358:	e3a02000 	mov	r2, #0
4000835c:	e5832000 	str	r2, [r3]
40008360:	ea000003 	b	40008374 <do_timer0+0x58>
40008364:	ebffffb1 	bl	40008230 <led_off>
40008368:	e59f3010 	ldr	r3, [pc, #16]	; 40008380 <do_timer0+0x64>
4000836c:	e3a02001 	mov	r2, #1
40008370:	e5832000 	str	r2, [r3]
40008374:	e8bd8800 	pop	{fp, pc}
40008378:	139d0044 	.word	0x139d0044
4000837c:	40009b48 	.word	0x40009b48
40008380:	40009c30 	.word	0x40009c30

40008384 <pwm0_init>:
40008384:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008388:	e28db000 	add	fp, sp, #0
4000838c:	e24dd004 	sub	sp, sp, #4
40008390:	e50b0004 	str	r0, [fp, #-4]
40008394:	e59f3078 	ldr	r3, [pc, #120]	; 40008414 <pwm0_init+0x90>
40008398:	e3a02063 	mov	r2, #99	; 0x63
4000839c:	e5832000 	str	r2, [r3]
400083a0:	e59f3070 	ldr	r3, [pc, #112]	; 40008418 <pwm0_init+0x94>
400083a4:	e59f206c 	ldr	r2, [pc, #108]	; 40008418 <pwm0_init+0x94>
400083a8:	e5922000 	ldr	r2, [r2]
400083ac:	e3c2200f 	bic	r2, r2, #15
400083b0:	e5832000 	str	r2, [r3]
400083b4:	e59f3060 	ldr	r3, [pc, #96]	; 4000841c <pwm0_init+0x98>
400083b8:	e51b2004 	ldr	r2, [fp, #-4]
400083bc:	e5832000 	str	r2, [r3]
400083c0:	e59f3058 	ldr	r3, [pc, #88]	; 40008420 <pwm0_init+0x9c>
400083c4:	e59f2050 	ldr	r2, [pc, #80]	; 4000841c <pwm0_init+0x98>
400083c8:	e5922000 	ldr	r2, [r2]
400083cc:	e1a020a2 	lsr	r2, r2, #1
400083d0:	e5832000 	str	r2, [r3]
400083d4:	e59f3048 	ldr	r3, [pc, #72]	; 40008424 <pwm0_init+0xa0>
400083d8:	e3a02002 	mov	r2, #2
400083dc:	e5832000 	str	r2, [r3]
400083e0:	e59f303c 	ldr	r3, [pc, #60]	; 40008424 <pwm0_init+0xa0>
400083e4:	e59f2038 	ldr	r2, [pc, #56]	; 40008424 <pwm0_init+0xa0>
400083e8:	e5922000 	ldr	r2, [r2]
400083ec:	e3c22002 	bic	r2, r2, #2
400083f0:	e5832000 	str	r2, [r3]
400083f4:	e59f3028 	ldr	r3, [pc, #40]	; 40008424 <pwm0_init+0xa0>
400083f8:	e59f2024 	ldr	r2, [pc, #36]	; 40008424 <pwm0_init+0xa0>
400083fc:	e5922000 	ldr	r2, [r2]
40008400:	e3822008 	orr	r2, r2, #8
40008404:	e5832000 	str	r2, [r3]
40008408:	e28bd000 	add	sp, fp, #0
4000840c:	e8bd0800 	pop	{fp}
40008410:	e12fff1e 	bx	lr
40008414:	139d0000 	.word	0x139d0000
40008418:	139d0004 	.word	0x139d0004
4000841c:	139d000c 	.word	0x139d000c
40008420:	139d0010 	.word	0x139d0010
40008424:	139d0008 	.word	0x139d0008

40008428 <pwm_enable>:
40008428:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000842c:	e28db000 	add	fp, sp, #0
40008430:	e59f3040 	ldr	r3, [pc, #64]	; 40008478 <pwm_enable+0x50>
40008434:	e59f203c 	ldr	r2, [pc, #60]	; 40008478 <pwm_enable+0x50>
40008438:	e5922000 	ldr	r2, [r2]
4000843c:	e3c2200f 	bic	r2, r2, #15
40008440:	e5832000 	str	r2, [r3]
40008444:	e59f302c 	ldr	r3, [pc, #44]	; 40008478 <pwm_enable+0x50>
40008448:	e59f2028 	ldr	r2, [pc, #40]	; 40008478 <pwm_enable+0x50>
4000844c:	e5922000 	ldr	r2, [r2]
40008450:	e3822002 	orr	r2, r2, #2
40008454:	e5832000 	str	r2, [r3]
40008458:	e59f301c 	ldr	r3, [pc, #28]	; 4000847c <pwm_enable+0x54>
4000845c:	e59f2018 	ldr	r2, [pc, #24]	; 4000847c <pwm_enable+0x54>
40008460:	e5922000 	ldr	r2, [r2]
40008464:	e3822001 	orr	r2, r2, #1
40008468:	e5832000 	str	r2, [r3]
4000846c:	e28bd000 	add	sp, fp, #0
40008470:	e8bd0800 	pop	{fp}
40008474:	e12fff1e 	bx	lr
40008478:	114000a0 	.word	0x114000a0
4000847c:	139d0008 	.word	0x139d0008

40008480 <pwm_disable>:
40008480:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008484:	e28db000 	add	fp, sp, #0
40008488:	e59f302c 	ldr	r3, [pc, #44]	; 400084bc <pwm_disable+0x3c>
4000848c:	e59f2028 	ldr	r2, [pc, #40]	; 400084bc <pwm_disable+0x3c>
40008490:	e5922000 	ldr	r2, [r2]
40008494:	e3c22001 	bic	r2, r2, #1
40008498:	e5832000 	str	r2, [r3]
4000849c:	e59f301c 	ldr	r3, [pc, #28]	; 400084c0 <pwm_disable+0x40>
400084a0:	e59f2018 	ldr	r2, [pc, #24]	; 400084c0 <pwm_disable+0x40>
400084a4:	e5922000 	ldr	r2, [r2]
400084a8:	e3c2200f 	bic	r2, r2, #15
400084ac:	e5832000 	str	r2, [r3]
400084b0:	e28bd000 	add	sp, fp, #0
400084b4:	e8bd0800 	pop	{fp}
400084b8:	e12fff1e 	bx	lr
400084bc:	139d0008 	.word	0x139d0008
400084c0:	114000a0 	.word	0x114000a0

400084c4 <set_per>:
400084c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400084c8:	e28db000 	add	fp, sp, #0
400084cc:	e24dd004 	sub	sp, sp, #4
400084d0:	e50b0004 	str	r0, [fp, #-4]
400084d4:	e59f3024 	ldr	r3, [pc, #36]	; 40008500 <set_per+0x3c>
400084d8:	e51b2004 	ldr	r2, [fp, #-4]
400084dc:	e5832000 	str	r2, [r3]
400084e0:	e59f301c 	ldr	r3, [pc, #28]	; 40008504 <set_per+0x40>
400084e4:	e59f2014 	ldr	r2, [pc, #20]	; 40008500 <set_per+0x3c>
400084e8:	e5922000 	ldr	r2, [r2]
400084ec:	e1a020a2 	lsr	r2, r2, #1
400084f0:	e5832000 	str	r2, [r3]
400084f4:	e28bd000 	add	sp, fp, #0
400084f8:	e8bd0800 	pop	{fp}
400084fc:	e12fff1e 	bx	lr
40008500:	139d000c 	.word	0x139d000c
40008504:	139d0010 	.word	0x139d0010

40008508 <timer0_init>:
40008508:	e92d4800 	push	{fp, lr}
4000850c:	e28db004 	add	fp, sp, #4
40008510:	e24dd004 	sub	sp, sp, #4
40008514:	e50b0008 	str	r0, [fp, #-8]
40008518:	e59f309c 	ldr	r3, [pc, #156]	; 400085bc <timer0_init+0xb4>
4000851c:	e59f2098 	ldr	r2, [pc, #152]	; 400085bc <timer0_init+0xb4>
40008520:	e5922000 	ldr	r2, [r2]
40008524:	e3822063 	orr	r2, r2, #99	; 0x63
40008528:	e5832000 	str	r2, [r3]
4000852c:	e59f308c 	ldr	r3, [pc, #140]	; 400085c0 <timer0_init+0xb8>
40008530:	e59f2088 	ldr	r2, [pc, #136]	; 400085c0 <timer0_init+0xb8>
40008534:	e5922000 	ldr	r2, [r2]
40008538:	e3c2200f 	bic	r2, r2, #15
4000853c:	e5832000 	str	r2, [r3]
40008540:	e59f307c 	ldr	r3, [pc, #124]	; 400085c4 <timer0_init+0xbc>
40008544:	e51b2008 	ldr	r2, [fp, #-8]
40008548:	e59f1078 	ldr	r1, [pc, #120]	; 400085c8 <timer0_init+0xc0>
4000854c:	e0020291 	mul	r2, r1, r2
40008550:	e5832000 	str	r2, [r3]
40008554:	e59f3070 	ldr	r3, [pc, #112]	; 400085cc <timer0_init+0xc4>
40008558:	e59f206c 	ldr	r2, [pc, #108]	; 400085cc <timer0_init+0xc4>
4000855c:	e5922000 	ldr	r2, [r2]
40008560:	e3822002 	orr	r2, r2, #2
40008564:	e5832000 	str	r2, [r3]
40008568:	e59f305c 	ldr	r3, [pc, #92]	; 400085cc <timer0_init+0xc4>
4000856c:	e59f2058 	ldr	r2, [pc, #88]	; 400085cc <timer0_init+0xc4>
40008570:	e5922000 	ldr	r2, [r2]
40008574:	e3c22002 	bic	r2, r2, #2
40008578:	e5832000 	str	r2, [r3]
4000857c:	e59f3048 	ldr	r3, [pc, #72]	; 400085cc <timer0_init+0xc4>
40008580:	e59f2044 	ldr	r2, [pc, #68]	; 400085cc <timer0_init+0xc4>
40008584:	e5922000 	ldr	r2, [r2]
40008588:	e3822009 	orr	r2, r2, #9
4000858c:	e5832000 	str	r2, [r3]
40008590:	e59f3038 	ldr	r3, [pc, #56]	; 400085d0 <timer0_init+0xc8>
40008594:	e59f2034 	ldr	r2, [pc, #52]	; 400085d0 <timer0_init+0xc8>
40008598:	e5922000 	ldr	r2, [r2]
4000859c:	e3822001 	orr	r2, r2, #1
400085a0:	e5832000 	str	r2, [r3]
400085a4:	e3a00045 	mov	r0, #69	; 0x45
400085a8:	e3a01012 	mov	r1, #18
400085ac:	e59f2020 	ldr	r2, [pc, #32]	; 400085d4 <timer0_init+0xcc>
400085b0:	eb00027d 	bl	40008fac <request_irq>
400085b4:	e24bd004 	sub	sp, fp, #4
400085b8:	e8bd8800 	pop	{fp, pc}
400085bc:	139d0000 	.word	0x139d0000
400085c0:	139d0004 	.word	0x139d0004
400085c4:	139d000c 	.word	0x139d000c
400085c8:	000f4240 	.word	0x000f4240
400085cc:	139d0008 	.word	0x139d0008
400085d0:	139d0044 	.word	0x139d0044
400085d4:	4000831c 	.word	0x4000831c

400085d8 <timer2_init>:
400085d8:	e92d4800 	push	{fp, lr}
400085dc:	e28db004 	add	fp, sp, #4
400085e0:	e24dd004 	sub	sp, sp, #4
400085e4:	e50b0008 	str	r0, [fp, #-8]
400085e8:	e59f309c 	ldr	r3, [pc, #156]	; 4000868c <timer2_init+0xb4>
400085ec:	e59f2098 	ldr	r2, [pc, #152]	; 4000868c <timer2_init+0xb4>
400085f0:	e5922000 	ldr	r2, [r2]
400085f4:	e3822c63 	orr	r2, r2, #25344	; 0x6300
400085f8:	e5832000 	str	r2, [r3]
400085fc:	e59f308c 	ldr	r3, [pc, #140]	; 40008690 <timer2_init+0xb8>
40008600:	e59f2088 	ldr	r2, [pc, #136]	; 40008690 <timer2_init+0xb8>
40008604:	e5922000 	ldr	r2, [r2]
40008608:	e3c22c0f 	bic	r2, r2, #3840	; 0xf00
4000860c:	e5832000 	str	r2, [r3]
40008610:	e59f307c 	ldr	r3, [pc, #124]	; 40008694 <timer2_init+0xbc>
40008614:	e51b2008 	ldr	r2, [fp, #-8]
40008618:	e59f1078 	ldr	r1, [pc, #120]	; 40008698 <timer2_init+0xc0>
4000861c:	e0020291 	mul	r2, r1, r2
40008620:	e5832000 	str	r2, [r3]
40008624:	e59f3070 	ldr	r3, [pc, #112]	; 4000869c <timer2_init+0xc4>
40008628:	e59f206c 	ldr	r2, [pc, #108]	; 4000869c <timer2_init+0xc4>
4000862c:	e5922000 	ldr	r2, [r2]
40008630:	e3822a02 	orr	r2, r2, #8192	; 0x2000
40008634:	e5832000 	str	r2, [r3]
40008638:	e59f305c 	ldr	r3, [pc, #92]	; 4000869c <timer2_init+0xc4>
4000863c:	e59f2058 	ldr	r2, [pc, #88]	; 4000869c <timer2_init+0xc4>
40008640:	e5922000 	ldr	r2, [r2]
40008644:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
40008648:	e5832000 	str	r2, [r3]
4000864c:	e59f3048 	ldr	r3, [pc, #72]	; 4000869c <timer2_init+0xc4>
40008650:	e59f2044 	ldr	r2, [pc, #68]	; 4000869c <timer2_init+0xc4>
40008654:	e5922000 	ldr	r2, [r2]
40008658:	e3822a09 	orr	r2, r2, #36864	; 0x9000
4000865c:	e5832000 	str	r2, [r3]
40008660:	e59f3038 	ldr	r3, [pc, #56]	; 400086a0 <timer2_init+0xc8>
40008664:	e59f2034 	ldr	r2, [pc, #52]	; 400086a0 <timer2_init+0xc8>
40008668:	e5922000 	ldr	r2, [r2]
4000866c:	e3822004 	orr	r2, r2, #4
40008670:	e5832000 	str	r2, [r3]
40008674:	e3a00047 	mov	r0, #71	; 0x47
40008678:	e3a01011 	mov	r1, #17
4000867c:	e59f2020 	ldr	r2, [pc, #32]	; 400086a4 <timer2_init+0xcc>
40008680:	eb000249 	bl	40008fac <request_irq>
40008684:	e24bd004 	sub	sp, fp, #4
40008688:	e8bd8800 	pop	{fp, pc}
4000868c:	139d0000 	.word	0x139d0000
40008690:	139d0004 	.word	0x139d0004
40008694:	139d0024 	.word	0x139d0024
40008698:	000f4240 	.word	0x000f4240
4000869c:	139d0008 	.word	0x139d0008
400086a0:	139d0044 	.word	0x139d0044
400086a4:	400082ec 	.word	0x400082ec

400086a8 <uart_init>:
400086a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400086ac:	e28db000 	add	fp, sp, #0
400086b0:	e3a03545 	mov	r3, #289406976	; 0x11400000
400086b4:	e3a02545 	mov	r2, #289406976	; 0x11400000
400086b8:	e5922000 	ldr	r2, [r2]
400086bc:	e3822022 	orr	r2, r2, #34	; 0x22
400086c0:	e5832000 	str	r2, [r3]
400086c4:	e3a0354e 	mov	r3, #327155712	; 0x13800000
400086c8:	e3a02003 	mov	r2, #3
400086cc:	e5832000 	str	r2, [r3]
400086d0:	e59f3028 	ldr	r3, [pc, #40]	; 40008700 <uart_init+0x58>
400086d4:	e3a02005 	mov	r2, #5
400086d8:	e5832000 	str	r2, [r3]
400086dc:	e59f3020 	ldr	r3, [pc, #32]	; 40008704 <uart_init+0x5c>
400086e0:	e3a02004 	mov	r2, #4
400086e4:	e5832000 	str	r2, [r3]
400086e8:	e59f3018 	ldr	r3, [pc, #24]	; 40008708 <uart_init+0x60>
400086ec:	e3a02035 	mov	r2, #53	; 0x35
400086f0:	e5832000 	str	r2, [r3]
400086f4:	e28bd000 	add	sp, fp, #0
400086f8:	e8bd0800 	pop	{fp}
400086fc:	e12fff1e 	bx	lr
40008700:	13800004 	.word	0x13800004
40008704:	1380002c 	.word	0x1380002c
40008708:	13800028 	.word	0x13800028

4000870c <put_char>:
4000870c:	e92d4800 	push	{fp, lr}
40008710:	e28db004 	add	fp, sp, #4
40008714:	e24dd004 	sub	sp, sp, #4
40008718:	e1a03000 	mov	r3, r0
4000871c:	e54b3008 	strb	r3, [fp, #-8]
40008720:	e1a00000 	nop			; (mov r0, r0)
40008724:	e59f3034 	ldr	r3, [pc, #52]	; 40008760 <put_char+0x54>
40008728:	e5933000 	ldr	r3, [r3]
4000872c:	e2033002 	and	r3, r3, #2
40008730:	e3530000 	cmp	r3, #0
40008734:	0afffffa 	beq	40008724 <put_char+0x18>
40008738:	e59f3024 	ldr	r3, [pc, #36]	; 40008764 <put_char+0x58>
4000873c:	e55b2008 	ldrb	r2, [fp, #-8]
40008740:	e5832000 	str	r2, [r3]
40008744:	e55b3008 	ldrb	r3, [fp, #-8]
40008748:	e353000a 	cmp	r3, #10
4000874c:	1a000001 	bne	40008758 <put_char+0x4c>
40008750:	e3a0000d 	mov	r0, #13
40008754:	ebffffec 	bl	4000870c <put_char>
40008758:	e24bd004 	sub	sp, fp, #4
4000875c:	e8bd8800 	pop	{fp, pc}
40008760:	13800010 	.word	0x13800010
40008764:	13800020 	.word	0x13800020

40008768 <puts_>:
40008768:	e92d4800 	push	{fp, lr}
4000876c:	e28db004 	add	fp, sp, #4
40008770:	e24dd004 	sub	sp, sp, #4
40008774:	e50b0008 	str	r0, [fp, #-8]
40008778:	ea000006 	b	40008798 <puts_+0x30>
4000877c:	e51b3008 	ldr	r3, [fp, #-8]
40008780:	e5d33000 	ldrb	r3, [r3]
40008784:	e1a00003 	mov	r0, r3
40008788:	ebffffdf 	bl	4000870c <put_char>
4000878c:	e51b3008 	ldr	r3, [fp, #-8]
40008790:	e2833001 	add	r3, r3, #1
40008794:	e50b3008 	str	r3, [fp, #-8]
40008798:	e51b3008 	ldr	r3, [fp, #-8]
4000879c:	e5d33000 	ldrb	r3, [r3]
400087a0:	e3530000 	cmp	r3, #0
400087a4:	1afffff4 	bne	4000877c <puts_+0x14>
400087a8:	e24bd004 	sub	sp, fp, #4
400087ac:	e8bd8800 	pop	{fp, pc}

400087b0 <recv_byte>:
400087b0:	e92d4800 	push	{fp, lr}
400087b4:	e28db004 	add	fp, sp, #4
400087b8:	e24dd004 	sub	sp, sp, #4
400087bc:	e1a00000 	nop			; (mov r0, r0)
400087c0:	e59f3048 	ldr	r3, [pc, #72]	; 40008810 <recv_byte+0x60>
400087c4:	e5933000 	ldr	r3, [r3]
400087c8:	e2033001 	and	r3, r3, #1
400087cc:	e3530000 	cmp	r3, #0
400087d0:	0afffffa 	beq	400087c0 <recv_byte+0x10>
400087d4:	e59f3038 	ldr	r3, [pc, #56]	; 40008814 <recv_byte+0x64>
400087d8:	e5933000 	ldr	r3, [r3]
400087dc:	e54b3005 	strb	r3, [fp, #-5]
400087e0:	e55b3005 	ldrb	r3, [fp, #-5]
400087e4:	e353000d 	cmp	r3, #13
400087e8:	1a000001 	bne	400087f4 <recv_byte+0x44>
400087ec:	e3a0300a 	mov	r3, #10
400087f0:	e54b3005 	strb	r3, [fp, #-5]
400087f4:	e55b3005 	ldrb	r3, [fp, #-5]
400087f8:	e1a00003 	mov	r0, r3
400087fc:	ebffffc2 	bl	4000870c <put_char>
40008800:	e55b3005 	ldrb	r3, [fp, #-5]
40008804:	e1a00003 	mov	r0, r3
40008808:	e24bd004 	sub	sp, fp, #4
4000880c:	e8bd8800 	pop	{fp, pc}
40008810:	13800010 	.word	0x13800010
40008814:	13800024 	.word	0x13800024

40008818 <gets_>:
40008818:	e92d4800 	push	{fp, lr}
4000881c:	e28db004 	add	fp, sp, #4
40008820:	e24dd008 	sub	sp, sp, #8
40008824:	e50b000c 	str	r0, [fp, #-12]
40008828:	ebffffe0 	bl	400087b0 <recv_byte>
4000882c:	e1a03000 	mov	r3, r0
40008830:	e54b3005 	strb	r3, [fp, #-5]
40008834:	e55b3005 	ldrb	r3, [fp, #-5]
40008838:	e353000a 	cmp	r3, #10
4000883c:	1a000004 	bne	40008854 <gets_+0x3c>
40008840:	e51b300c 	ldr	r3, [fp, #-12]
40008844:	e3a02000 	mov	r2, #0
40008848:	e5c32000 	strb	r2, [r3]
4000884c:	e24bd004 	sub	sp, fp, #4
40008850:	e8bd8800 	pop	{fp, pc}
40008854:	e51b300c 	ldr	r3, [fp, #-12]
40008858:	e55b2005 	ldrb	r2, [fp, #-5]
4000885c:	e5c32000 	strb	r2, [r3]
40008860:	e51b300c 	ldr	r3, [fp, #-12]
40008864:	e2833001 	add	r3, r3, #1
40008868:	e50b300c 	str	r3, [fp, #-12]
4000886c:	eaffffed 	b	40008828 <gets_+0x10>
	...

40008880 <__aeabi_idiv>:
40008880:	e3510000 	cmp	r1, #0
40008884:	e020c001 	eor	ip, r0, r1
40008888:	0a000042 	beq	40008998 <Ldiv0>
4000888c:	42611000 	rsbmi	r1, r1, #0
40008890:	e2512001 	subs	r2, r1, #1
40008894:	0a000027 	beq	40008938 <__aeabi_idiv+0xb8>
40008898:	e1b03000 	movs	r3, r0
4000889c:	42603000 	rsbmi	r3, r0, #0
400088a0:	e1530001 	cmp	r3, r1
400088a4:	9a000026 	bls	40008944 <__aeabi_idiv+0xc4>
400088a8:	e1110002 	tst	r1, r2
400088ac:	0a000028 	beq	40008954 <__aeabi_idiv+0xd4>
400088b0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
400088b4:	01a01181 	lsleq	r1, r1, #3
400088b8:	03a02008 	moveq	r2, #8
400088bc:	13a02001 	movne	r2, #1
400088c0:	e3510201 	cmp	r1, #268435456	; 0x10000000
400088c4:	31510003 	cmpcc	r1, r3
400088c8:	31a01201 	lslcc	r1, r1, #4
400088cc:	31a02202 	lslcc	r2, r2, #4
400088d0:	3afffffa 	bcc	400088c0 <__aeabi_idiv+0x40>
400088d4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
400088d8:	31510003 	cmpcc	r1, r3
400088dc:	31a01081 	lslcc	r1, r1, #1
400088e0:	31a02082 	lslcc	r2, r2, #1
400088e4:	3afffffa 	bcc	400088d4 <__aeabi_idiv+0x54>
400088e8:	e3a00000 	mov	r0, #0
400088ec:	e1530001 	cmp	r3, r1
400088f0:	20433001 	subcs	r3, r3, r1
400088f4:	21800002 	orrcs	r0, r0, r2
400088f8:	e15300a1 	cmp	r3, r1, lsr #1
400088fc:	204330a1 	subcs	r3, r3, r1, lsr #1
40008900:	218000a2 	orrcs	r0, r0, r2, lsr #1
40008904:	e1530121 	cmp	r3, r1, lsr #2
40008908:	20433121 	subcs	r3, r3, r1, lsr #2
4000890c:	21800122 	orrcs	r0, r0, r2, lsr #2
40008910:	e15301a1 	cmp	r3, r1, lsr #3
40008914:	204331a1 	subcs	r3, r3, r1, lsr #3
40008918:	218001a2 	orrcs	r0, r0, r2, lsr #3
4000891c:	e3530000 	cmp	r3, #0
40008920:	11b02222 	lsrsne	r2, r2, #4
40008924:	11a01221 	lsrne	r1, r1, #4
40008928:	1affffef 	bne	400088ec <__aeabi_idiv+0x6c>
4000892c:	e35c0000 	cmp	ip, #0
40008930:	42600000 	rsbmi	r0, r0, #0
40008934:	e1a0f00e 	mov	pc, lr
40008938:	e13c0000 	teq	ip, r0
4000893c:	42600000 	rsbmi	r0, r0, #0
40008940:	e1a0f00e 	mov	pc, lr
40008944:	33a00000 	movcc	r0, #0
40008948:	01a00fcc 	asreq	r0, ip, #31
4000894c:	03800001 	orreq	r0, r0, #1
40008950:	e1a0f00e 	mov	pc, lr
40008954:	e3510801 	cmp	r1, #65536	; 0x10000
40008958:	21a01821 	lsrcs	r1, r1, #16
4000895c:	23a02010 	movcs	r2, #16
40008960:	33a02000 	movcc	r2, #0
40008964:	e3510c01 	cmp	r1, #256	; 0x100
40008968:	21a01421 	lsrcs	r1, r1, #8
4000896c:	22822008 	addcs	r2, r2, #8
40008970:	e3510010 	cmp	r1, #16
40008974:	21a01221 	lsrcs	r1, r1, #4
40008978:	22822004 	addcs	r2, r2, #4
4000897c:	e3510004 	cmp	r1, #4
40008980:	82822003 	addhi	r2, r2, #3
40008984:	908220a1 	addls	r2, r2, r1, lsr #1
40008988:	e35c0000 	cmp	ip, #0
4000898c:	e1a00233 	lsr	r0, r3, r2
40008990:	42600000 	rsbmi	r0, r0, #0
40008994:	e1a0f00e 	mov	pc, lr

40008998 <Ldiv0>:
40008998:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
4000899c:	e3a00000 	mov	r0, #0
400089a0:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
400089a4:	e320f000 	nop	{0}
400089a8:	e320f000 	nop	{0}
400089ac:	e320f000 	nop	{0}
400089b0:	e320f000 	nop	{0}
400089b4:	e320f000 	nop	{0}
400089b8:	e320f000 	nop	{0}
400089bc:	e320f000 	nop	{0}

400089c0 <itod>:
400089c0:	e92d4800 	push	{fp, lr}
400089c4:	e28db004 	add	fp, sp, #4
400089c8:	e24dd00c 	sub	sp, sp, #12
400089cc:	e50b000c 	str	r0, [fp, #-12]
400089d0:	e50b1010 	str	r1, [fp, #-16]
400089d4:	e51b300c 	ldr	r3, [fp, #-12]
400089d8:	e3530009 	cmp	r3, #9
400089dc:	8a00000a 	bhi	40008a0c <itod+0x4c>
400089e0:	e51b300c 	ldr	r3, [fp, #-12]
400089e4:	e6ef3073 	uxtb	r3, r3
400089e8:	e2833030 	add	r3, r3, #48	; 0x30
400089ec:	e6ef2073 	uxtb	r2, r3
400089f0:	e51b3010 	ldr	r3, [fp, #-16]
400089f4:	e5c32000 	strb	r2, [r3]
400089f8:	e51b3010 	ldr	r3, [fp, #-16]
400089fc:	e2833001 	add	r3, r3, #1
40008a00:	e3a02000 	mov	r2, #0
40008a04:	e5c32000 	strb	r2, [r3]
40008a08:	ea000028 	b	40008ab0 <itod+0xf0>
40008a0c:	e51b200c 	ldr	r2, [fp, #-12]
40008a10:	e59f30a0 	ldr	r3, [pc, #160]	; 40008ab8 <itod+0xf8>
40008a14:	e0831293 	umull	r1, r3, r3, r2
40008a18:	e1a031a3 	lsr	r3, r3, #3
40008a1c:	e1a00003 	mov	r0, r3
40008a20:	e51b1010 	ldr	r1, [fp, #-16]
40008a24:	ebffffe5 	bl	400089c0 <itod>
40008a28:	e3a03000 	mov	r3, #0
40008a2c:	e50b3008 	str	r3, [fp, #-8]
40008a30:	ea000002 	b	40008a40 <itod+0x80>
40008a34:	e51b3008 	ldr	r3, [fp, #-8]
40008a38:	e2833001 	add	r3, r3, #1
40008a3c:	e50b3008 	str	r3, [fp, #-8]
40008a40:	e51b3008 	ldr	r3, [fp, #-8]
40008a44:	e51b2010 	ldr	r2, [fp, #-16]
40008a48:	e0823003 	add	r3, r2, r3
40008a4c:	e5d33000 	ldrb	r3, [r3]
40008a50:	e3530000 	cmp	r3, #0
40008a54:	1afffff6 	bne	40008a34 <itod+0x74>
40008a58:	e51b3008 	ldr	r3, [fp, #-8]
40008a5c:	e51b2010 	ldr	r2, [fp, #-16]
40008a60:	e0820003 	add	r0, r2, r3
40008a64:	e51b100c 	ldr	r1, [fp, #-12]
40008a68:	e59f3048 	ldr	r3, [pc, #72]	; 40008ab8 <itod+0xf8>
40008a6c:	e0832193 	umull	r2, r3, r3, r1
40008a70:	e1a021a3 	lsr	r2, r3, #3
40008a74:	e1a03002 	mov	r3, r2
40008a78:	e1a03103 	lsl	r3, r3, #2
40008a7c:	e0833002 	add	r3, r3, r2
40008a80:	e1a03083 	lsl	r3, r3, #1
40008a84:	e0632001 	rsb	r2, r3, r1
40008a88:	e6ef3072 	uxtb	r3, r2
40008a8c:	e2833030 	add	r3, r3, #48	; 0x30
40008a90:	e6ef3073 	uxtb	r3, r3
40008a94:	e5c03000 	strb	r3, [r0]
40008a98:	e51b3008 	ldr	r3, [fp, #-8]
40008a9c:	e2833001 	add	r3, r3, #1
40008aa0:	e51b2010 	ldr	r2, [fp, #-16]
40008aa4:	e0823003 	add	r3, r2, r3
40008aa8:	e3a02000 	mov	r2, #0
40008aac:	e5c32000 	strb	r2, [r3]
40008ab0:	e24bd004 	sub	sp, fp, #4
40008ab4:	e8bd8800 	pop	{fp, pc}
40008ab8:	cccccccd 	.word	0xcccccccd

40008abc <itox>:
40008abc:	e92d4800 	push	{fp, lr}
40008ac0:	e28db004 	add	fp, sp, #4
40008ac4:	e24dd00c 	sub	sp, sp, #12
40008ac8:	e50b000c 	str	r0, [fp, #-12]
40008acc:	e50b1010 	str	r1, [fp, #-16]
40008ad0:	e51b300c 	ldr	r3, [fp, #-12]
40008ad4:	e353000f 	cmp	r3, #15
40008ad8:	8a000014 	bhi	40008b30 <itox+0x74>
40008adc:	e51b300c 	ldr	r3, [fp, #-12]
40008ae0:	e3530009 	cmp	r3, #9
40008ae4:	9a000006 	bls	40008b04 <itox+0x48>
40008ae8:	e51b300c 	ldr	r3, [fp, #-12]
40008aec:	e6ef3073 	uxtb	r3, r3
40008af0:	e2833057 	add	r3, r3, #87	; 0x57
40008af4:	e6ef2073 	uxtb	r2, r3
40008af8:	e51b3010 	ldr	r3, [fp, #-16]
40008afc:	e5c32000 	strb	r2, [r3]
40008b00:	ea000005 	b	40008b1c <itox+0x60>
40008b04:	e51b300c 	ldr	r3, [fp, #-12]
40008b08:	e6ef3073 	uxtb	r3, r3
40008b0c:	e2833030 	add	r3, r3, #48	; 0x30
40008b10:	e6ef2073 	uxtb	r2, r3
40008b14:	e51b3010 	ldr	r3, [fp, #-16]
40008b18:	e5c32000 	strb	r2, [r3]
40008b1c:	e51b3010 	ldr	r3, [fp, #-16]
40008b20:	e2833001 	add	r3, r3, #1
40008b24:	e3a02000 	mov	r2, #0
40008b28:	e5c32000 	strb	r2, [r3]
40008b2c:	ea00002f 	b	40008bf0 <itox+0x134>
40008b30:	e51b300c 	ldr	r3, [fp, #-12]
40008b34:	e1a03223 	lsr	r3, r3, #4
40008b38:	e1a00003 	mov	r0, r3
40008b3c:	e51b1010 	ldr	r1, [fp, #-16]
40008b40:	ebffffdd 	bl	40008abc <itox>
40008b44:	e3a03000 	mov	r3, #0
40008b48:	e50b3008 	str	r3, [fp, #-8]
40008b4c:	ea000002 	b	40008b5c <itox+0xa0>
40008b50:	e51b3008 	ldr	r3, [fp, #-8]
40008b54:	e2833001 	add	r3, r3, #1
40008b58:	e50b3008 	str	r3, [fp, #-8]
40008b5c:	e51b3008 	ldr	r3, [fp, #-8]
40008b60:	e51b2010 	ldr	r2, [fp, #-16]
40008b64:	e0823003 	add	r3, r2, r3
40008b68:	e5d33000 	ldrb	r3, [r3]
40008b6c:	e3530000 	cmp	r3, #0
40008b70:	1afffff6 	bne	40008b50 <itox+0x94>
40008b74:	e51b300c 	ldr	r3, [fp, #-12]
40008b78:	e203300f 	and	r3, r3, #15
40008b7c:	e3530009 	cmp	r3, #9
40008b80:	9a00000a 	bls	40008bb0 <itox+0xf4>
40008b84:	e51b3008 	ldr	r3, [fp, #-8]
40008b88:	e51b2010 	ldr	r2, [fp, #-16]
40008b8c:	e0823003 	add	r3, r2, r3
40008b90:	e51b200c 	ldr	r2, [fp, #-12]
40008b94:	e6ef2072 	uxtb	r2, r2
40008b98:	e202200f 	and	r2, r2, #15
40008b9c:	e6ef2072 	uxtb	r2, r2
40008ba0:	e2822057 	add	r2, r2, #87	; 0x57
40008ba4:	e6ef2072 	uxtb	r2, r2
40008ba8:	e5c32000 	strb	r2, [r3]
40008bac:	ea000009 	b	40008bd8 <itox+0x11c>
40008bb0:	e51b3008 	ldr	r3, [fp, #-8]
40008bb4:	e51b2010 	ldr	r2, [fp, #-16]
40008bb8:	e0823003 	add	r3, r2, r3
40008bbc:	e51b200c 	ldr	r2, [fp, #-12]
40008bc0:	e6ef2072 	uxtb	r2, r2
40008bc4:	e202200f 	and	r2, r2, #15
40008bc8:	e6ef2072 	uxtb	r2, r2
40008bcc:	e2822030 	add	r2, r2, #48	; 0x30
40008bd0:	e6ef2072 	uxtb	r2, r2
40008bd4:	e5c32000 	strb	r2, [r3]
40008bd8:	e51b3008 	ldr	r3, [fp, #-8]
40008bdc:	e2833001 	add	r3, r3, #1
40008be0:	e51b2010 	ldr	r2, [fp, #-16]
40008be4:	e0823003 	add	r3, r2, r3
40008be8:	e3a02000 	mov	r2, #0
40008bec:	e5c32000 	strb	r2, [r3]
40008bf0:	e24bd004 	sub	sp, fp, #4
40008bf4:	e8bd8800 	pop	{fp, pc}

40008bf8 <uprintf>:
40008bf8:	e92d000f 	push	{r0, r1, r2, r3}
40008bfc:	e92d4800 	push	{fp, lr}
40008c00:	e28db004 	add	fp, sp, #4
40008c04:	e24dd028 	sub	sp, sp, #40	; 0x28
40008c08:	e28b3004 	add	r3, fp, #4
40008c0c:	e2833004 	add	r3, r3, #4
40008c10:	e50b300c 	str	r3, [fp, #-12]
40008c14:	ea000069 	b	40008dc0 <uprintf+0x1c8>
40008c18:	e59b3004 	ldr	r3, [fp, #4]
40008c1c:	e5d33000 	ldrb	r3, [r3]
40008c20:	e3530025 	cmp	r3, #37	; 0x25
40008c24:	0a000004 	beq	40008c3c <uprintf+0x44>
40008c28:	e59b3004 	ldr	r3, [fp, #4]
40008c2c:	e5d33000 	ldrb	r3, [r3]
40008c30:	e1a00003 	mov	r0, r3
40008c34:	ebfffeb4 	bl	4000870c <put_char>
40008c38:	ea00005d 	b	40008db4 <uprintf+0x1bc>
40008c3c:	e59b3004 	ldr	r3, [fp, #4]
40008c40:	e2833001 	add	r3, r3, #1
40008c44:	e58b3004 	str	r3, [fp, #4]
40008c48:	e59b3004 	ldr	r3, [fp, #4]
40008c4c:	e5d33000 	ldrb	r3, [r3]
40008c50:	e2433063 	sub	r3, r3, #99	; 0x63
40008c54:	e3530015 	cmp	r3, #21
40008c58:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
40008c5c:	ea000053 	b	40008db0 <uprintf+0x1b8>
40008c60:	40008cb8 	.word	0x40008cb8
40008c64:	40008d08 	.word	0x40008d08
40008c68:	40008db0 	.word	0x40008db0
40008c6c:	40008db0 	.word	0x40008db0
40008c70:	40008db0 	.word	0x40008db0
40008c74:	40008db0 	.word	0x40008db0
40008c78:	40008db0 	.word	0x40008db0
40008c7c:	40008db0 	.word	0x40008db0
40008c80:	40008db0 	.word	0x40008db0
40008c84:	40008db0 	.word	0x40008db0
40008c88:	40008db0 	.word	0x40008db0
40008c8c:	40008db0 	.word	0x40008db0
40008c90:	40008db0 	.word	0x40008db0
40008c94:	40008db0 	.word	0x40008db0
40008c98:	40008db0 	.word	0x40008db0
40008c9c:	40008db0 	.word	0x40008db0
40008ca0:	40008ce0 	.word	0x40008ce0
40008ca4:	40008db0 	.word	0x40008db0
40008ca8:	40008db0 	.word	0x40008db0
40008cac:	40008db0 	.word	0x40008db0
40008cb0:	40008db0 	.word	0x40008db0
40008cb4:	40008d6c 	.word	0x40008d6c
40008cb8:	e51b300c 	ldr	r3, [fp, #-12]
40008cbc:	e5933000 	ldr	r3, [r3]
40008cc0:	e50b3010 	str	r3, [fp, #-16]
40008cc4:	e51b300c 	ldr	r3, [fp, #-12]
40008cc8:	e2833004 	add	r3, r3, #4
40008ccc:	e50b300c 	str	r3, [fp, #-12]
40008cd0:	e51b3010 	ldr	r3, [fp, #-16]
40008cd4:	e1a00003 	mov	r0, r3
40008cd8:	ebfffe8b 	bl	4000870c <put_char>
40008cdc:	ea000034 	b	40008db4 <uprintf+0x1bc>
40008ce0:	e51b300c 	ldr	r3, [fp, #-12]
40008ce4:	e5933000 	ldr	r3, [r3]
40008ce8:	e50b3014 	str	r3, [fp, #-20]
40008cec:	e51b300c 	ldr	r3, [fp, #-12]
40008cf0:	e2833004 	add	r3, r3, #4
40008cf4:	e50b300c 	str	r3, [fp, #-12]
40008cf8:	e51b3014 	ldr	r3, [fp, #-20]
40008cfc:	e1a00003 	mov	r0, r3
40008d00:	ebfffe98 	bl	40008768 <puts_>
40008d04:	ea00002a 	b	40008db4 <uprintf+0x1bc>
40008d08:	e51b300c 	ldr	r3, [fp, #-12]
40008d0c:	e5933000 	ldr	r3, [r3]
40008d10:	e50b3018 	str	r3, [fp, #-24]
40008d14:	e51b300c 	ldr	r3, [fp, #-12]
40008d18:	e2833004 	add	r3, r3, #4
40008d1c:	e50b300c 	str	r3, [fp, #-12]
40008d20:	e51b3018 	ldr	r3, [fp, #-24]
40008d24:	e50b3008 	str	r3, [fp, #-8]
40008d28:	e51b3008 	ldr	r3, [fp, #-8]
40008d2c:	e3530000 	cmp	r3, #0
40008d30:	aa000004 	bge	40008d48 <uprintf+0x150>
40008d34:	e3a0002d 	mov	r0, #45	; 0x2d
40008d38:	ebfffe73 	bl	4000870c <put_char>
40008d3c:	e51b3008 	ldr	r3, [fp, #-8]
40008d40:	e2633000 	rsb	r3, r3, #0
40008d44:	e50b3008 	str	r3, [fp, #-8]
40008d48:	e51b2008 	ldr	r2, [fp, #-8]
40008d4c:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008d50:	e1a00002 	mov	r0, r2
40008d54:	e1a01003 	mov	r1, r3
40008d58:	ebffff18 	bl	400089c0 <itod>
40008d5c:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008d60:	e1a00003 	mov	r0, r3
40008d64:	ebfffe7f 	bl	40008768 <puts_>
40008d68:	ea000011 	b	40008db4 <uprintf+0x1bc>
40008d6c:	e51b300c 	ldr	r3, [fp, #-12]
40008d70:	e5933000 	ldr	r3, [r3]
40008d74:	e50b301c 	str	r3, [fp, #-28]
40008d78:	e51b300c 	ldr	r3, [fp, #-12]
40008d7c:	e2833004 	add	r3, r3, #4
40008d80:	e50b300c 	str	r3, [fp, #-12]
40008d84:	e51b301c 	ldr	r3, [fp, #-28]
40008d88:	e50b3008 	str	r3, [fp, #-8]
40008d8c:	e51b2008 	ldr	r2, [fp, #-8]
40008d90:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008d94:	e1a00002 	mov	r0, r2
40008d98:	e1a01003 	mov	r1, r3
40008d9c:	ebffff46 	bl	40008abc <itox>
40008da0:	e24b302c 	sub	r3, fp, #44	; 0x2c
40008da4:	e1a00003 	mov	r0, r3
40008da8:	ebfffe6e 	bl	40008768 <puts_>
40008dac:	ea000000 	b	40008db4 <uprintf+0x1bc>
40008db0:	e1a00000 	nop			; (mov r0, r0)
40008db4:	e59b3004 	ldr	r3, [fp, #4]
40008db8:	e2833001 	add	r3, r3, #1
40008dbc:	e58b3004 	str	r3, [fp, #4]
40008dc0:	e59b3004 	ldr	r3, [fp, #4]
40008dc4:	e5d33000 	ldrb	r3, [r3]
40008dc8:	e3530000 	cmp	r3, #0
40008dcc:	1affff91 	bne	40008c18 <uprintf+0x20>
40008dd0:	e3a03000 	mov	r3, #0
40008dd4:	e50b300c 	str	r3, [fp, #-12]
40008dd8:	e3a03000 	mov	r3, #0
40008ddc:	e1a00003 	mov	r0, r3
40008de0:	e24bd004 	sub	sp, fp, #4
40008de4:	e8bd4800 	pop	{fp, lr}
40008de8:	e28dd010 	add	sp, sp, #16
40008dec:	e12fff1e 	bx	lr

40008df0 <do_eint26>:
40008df0:	e92d4800 	push	{fp, lr}
40008df4:	e28db004 	add	fp, sp, #4
40008df8:	e59f305c 	ldr	r3, [pc, #92]	; 40008e5c <do_eint26+0x6c>
40008dfc:	e5933000 	ldr	r3, [r3]
40008e00:	e2033004 	and	r3, r3, #4
40008e04:	e3530000 	cmp	r3, #0
40008e08:	0a000006 	beq	40008e28 <do_eint26+0x38>
40008e0c:	e59f3048 	ldr	r3, [pc, #72]	; 40008e5c <do_eint26+0x6c>
40008e10:	e59f2044 	ldr	r2, [pc, #68]	; 40008e5c <do_eint26+0x6c>
40008e14:	e5922000 	ldr	r2, [r2]
40008e18:	e3822004 	orr	r2, r2, #4
40008e1c:	e5832000 	str	r2, [r3]
40008e20:	e59f0038 	ldr	r0, [pc, #56]	; 40008e60 <do_eint26+0x70>
40008e24:	ebffff73 	bl	40008bf8 <uprintf>
40008e28:	e59f302c 	ldr	r3, [pc, #44]	; 40008e5c <do_eint26+0x6c>
40008e2c:	e5933000 	ldr	r3, [r3]
40008e30:	e2033008 	and	r3, r3, #8
40008e34:	e3530000 	cmp	r3, #0
40008e38:	0a000006 	beq	40008e58 <do_eint26+0x68>
40008e3c:	e59f3018 	ldr	r3, [pc, #24]	; 40008e5c <do_eint26+0x6c>
40008e40:	e59f2014 	ldr	r2, [pc, #20]	; 40008e5c <do_eint26+0x6c>
40008e44:	e5922000 	ldr	r2, [r2]
40008e48:	e3822008 	orr	r2, r2, #8
40008e4c:	e5832000 	str	r2, [r3]
40008e50:	e59f000c 	ldr	r0, [pc, #12]	; 40008e64 <do_eint26+0x74>
40008e54:	ebffff67 	bl	40008bf8 <uprintf>
40008e58:	e8bd8800 	pop	{fp, pc}
40008e5c:	11000f4c 	.word	0x11000f4c
40008e60:	40009b5c 	.word	0x40009b5c
40008e64:	40009b70 	.word	0x40009b70

40008e68 <eint_init>:
40008e68:	e92d4800 	push	{fp, lr}
40008e6c:	e28db004 	add	fp, sp, #4
40008e70:	e59f3074 	ldr	r3, [pc, #116]	; 40008eec <eint_init+0x84>
40008e74:	e59f2070 	ldr	r2, [pc, #112]	; 40008eec <eint_init+0x84>
40008e78:	e5922000 	ldr	r2, [r2]
40008e7c:	e3822cff 	orr	r2, r2, #65280	; 0xff00
40008e80:	e5832000 	str	r2, [r3]
40008e84:	e59f3064 	ldr	r3, [pc, #100]	; 40008ef0 <eint_init+0x88>
40008e88:	e59f2060 	ldr	r2, [pc, #96]	; 40008ef0 <eint_init+0x88>
40008e8c:	e5922000 	ldr	r2, [r2]
40008e90:	e3c22c77 	bic	r2, r2, #30464	; 0x7700
40008e94:	e5832000 	str	r2, [r3]
40008e98:	e59f3050 	ldr	r3, [pc, #80]	; 40008ef0 <eint_init+0x88>
40008e9c:	e59f204c 	ldr	r2, [pc, #76]	; 40008ef0 <eint_init+0x88>
40008ea0:	e5922000 	ldr	r2, [r2]
40008ea4:	e3822c22 	orr	r2, r2, #8704	; 0x2200
40008ea8:	e5832000 	str	r2, [r3]
40008eac:	e59f2040 	ldr	r2, [pc, #64]	; 40008ef4 <eint_init+0x8c>
40008eb0:	e59f303c 	ldr	r3, [pc, #60]	; 40008ef4 <eint_init+0x8c>
40008eb4:	e5933000 	ldr	r3, [r3]
40008eb8:	e3833103 	orr	r3, r3, #-1073741824	; 0xc0000000
40008ebc:	e3833503 	orr	r3, r3, #12582912	; 0xc00000
40008ec0:	e5823000 	str	r3, [r2]
40008ec4:	e59f302c 	ldr	r3, [pc, #44]	; 40008ef8 <eint_init+0x90>
40008ec8:	e59f2028 	ldr	r2, [pc, #40]	; 40008ef8 <eint_init+0x90>
40008ecc:	e5922000 	ldr	r2, [r2]
40008ed0:	e3c2200c 	bic	r2, r2, #12
40008ed4:	e5832000 	str	r2, [r3]
40008ed8:	e3a00040 	mov	r0, #64	; 0x40
40008edc:	e3a01009 	mov	r1, #9
40008ee0:	e59f2014 	ldr	r2, [pc, #20]	; 40008efc <eint_init+0x94>
40008ee4:	eb000030 	bl	40008fac <request_irq>
40008ee8:	e8bd8800 	pop	{fp, pc}
40008eec:	11000c60 	.word	0x11000c60
40008ef0:	11000e0c 	.word	0x11000e0c
40008ef4:	11000e98 	.word	0x11000e98
40008ef8:	11000f0c 	.word	0x11000f0c
40008efc:	40008df0 	.word	0x40008df0

40008f00 <do_irq>:
40008f00:	e92d4800 	push	{fp, lr}
40008f04:	e28db004 	add	fp, sp, #4
40008f08:	e24dd008 	sub	sp, sp, #8
40008f0c:	e59f3044 	ldr	r3, [pc, #68]	; 40008f58 <do_irq+0x58>
40008f10:	e5933000 	ldr	r3, [r3]
40008f14:	e1a03b03 	lsl	r3, r3, #22
40008f18:	e1a03b23 	lsr	r3, r3, #22
40008f1c:	e50b3008 	str	r3, [fp, #-8]
40008f20:	e59f3034 	ldr	r3, [pc, #52]	; 40008f5c <do_irq+0x5c>
40008f24:	e51b2008 	ldr	r2, [fp, #-8]
40008f28:	e5832000 	str	r2, [r3]
40008f2c:	e59f002c 	ldr	r0, [pc, #44]	; 40008f60 <do_irq+0x60>
40008f30:	e51b1008 	ldr	r1, [fp, #-8]
40008f34:	ebffff2f 	bl	40008bf8 <uprintf>
40008f38:	e59f3024 	ldr	r3, [pc, #36]	; 40008f64 <do_irq+0x64>
40008f3c:	e51b2008 	ldr	r2, [fp, #-8]
40008f40:	e7933102 	ldr	r3, [r3, r2, lsl #2]
40008f44:	e50b300c 	str	r3, [fp, #-12]
40008f48:	e51b300c 	ldr	r3, [fp, #-12]
40008f4c:	e12fff33 	blx	r3
40008f50:	e24bd004 	sub	sp, fp, #4
40008f54:	e8bd8800 	pop	{fp, pc}
40008f58:	1048000c 	.word	0x1048000c
40008f5c:	10480010 	.word	0x10480010
40008f60:	40009b84 	.word	0x40009b84
40008f64:	40009c98 	.word	0x40009c98

40008f68 <gic_init>:
40008f68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008f6c:	e28db000 	add	fp, sp, #0
40008f70:	e59f3028 	ldr	r3, [pc, #40]	; 40008fa0 <gic_init+0x38>
40008f74:	e3a02001 	mov	r2, #1
40008f78:	e5832000 	str	r2, [r3]
40008f7c:	e59f3020 	ldr	r3, [pc, #32]	; 40008fa4 <gic_init+0x3c>
40008f80:	e3a02001 	mov	r2, #1
40008f84:	e5832000 	str	r2, [r3]
40008f88:	e59f3018 	ldr	r3, [pc, #24]	; 40008fa8 <gic_init+0x40>
40008f8c:	e3a020ff 	mov	r2, #255	; 0xff
40008f90:	e5832000 	str	r2, [r3]
40008f94:	e28bd000 	add	sp, fp, #0
40008f98:	e8bd0800 	pop	{fp}
40008f9c:	e12fff1e 	bx	lr
40008fa0:	10490000 	.word	0x10490000
40008fa4:	10480000 	.word	0x10480000
40008fa8:	10480004 	.word	0x10480004

40008fac <request_irq>:
40008fac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40008fb0:	e28db000 	add	fp, sp, #0
40008fb4:	e24dd00c 	sub	sp, sp, #12
40008fb8:	e50b0004 	str	r0, [fp, #-4]
40008fbc:	e1a03001 	mov	r3, r1
40008fc0:	e50b200c 	str	r2, [fp, #-12]
40008fc4:	e54b3008 	strb	r3, [fp, #-8]
40008fc8:	e51b3004 	ldr	r3, [fp, #-4]
40008fcc:	e283201f 	add	r2, r3, #31
40008fd0:	e3530000 	cmp	r3, #0
40008fd4:	b1a03002 	movlt	r3, r2
40008fd8:	e1a032c3 	asr	r3, r3, #5
40008fdc:	e1a02003 	mov	r2, r3
40008fe0:	e1a03002 	mov	r3, r2
40008fe4:	e1a01103 	lsl	r1, r3, #2
40008fe8:	e59f31ec 	ldr	r3, [pc, #492]	; 400091dc <request_irq+0x230>
40008fec:	e0813003 	add	r3, r1, r3
40008ff0:	e1a01102 	lsl	r1, r2, #2
40008ff4:	e59f21e0 	ldr	r2, [pc, #480]	; 400091dc <request_irq+0x230>
40008ff8:	e0812002 	add	r2, r1, r2
40008ffc:	e5920000 	ldr	r0, [r2]
40009000:	e51b1004 	ldr	r1, [fp, #-4]
40009004:	e1a02fc1 	asr	r2, r1, #31
40009008:	e1a02da2 	lsr	r2, r2, #27
4000900c:	e0811002 	add	r1, r1, r2
40009010:	e201101f 	and	r1, r1, #31
40009014:	e0622001 	rsb	r2, r2, r1
40009018:	e3a01001 	mov	r1, #1
4000901c:	e1a02211 	lsl	r2, r1, r2
40009020:	e1802002 	orr	r2, r0, r2
40009024:	e5832000 	str	r2, [r3]
40009028:	e51b3004 	ldr	r3, [fp, #-4]
4000902c:	e2832003 	add	r2, r3, #3
40009030:	e3530000 	cmp	r3, #0
40009034:	b1a03002 	movlt	r3, r2
40009038:	e1a03143 	asr	r3, r3, #2
4000903c:	e1a02003 	mov	r2, r3
40009040:	e1a03002 	mov	r3, r2
40009044:	e1a01103 	lsl	r1, r3, #2
40009048:	e59f3190 	ldr	r3, [pc, #400]	; 400091e0 <request_irq+0x234>
4000904c:	e0813003 	add	r3, r1, r3
40009050:	e1a01102 	lsl	r1, r2, #2
40009054:	e59f2184 	ldr	r2, [pc, #388]	; 400091e0 <request_irq+0x234>
40009058:	e0812002 	add	r2, r1, r2
4000905c:	e5920000 	ldr	r0, [r2]
40009060:	e51b1004 	ldr	r1, [fp, #-4]
40009064:	e1a02fc1 	asr	r2, r1, #31
40009068:	e1a02f22 	lsr	r2, r2, #30
4000906c:	e0811002 	add	r1, r1, r2
40009070:	e2011003 	and	r1, r1, #3
40009074:	e0622001 	rsb	r2, r2, r1
40009078:	e1a02182 	lsl	r2, r2, #3
4000907c:	e3a010ff 	mov	r1, #255	; 0xff
40009080:	e1a02211 	lsl	r2, r1, r2
40009084:	e1e02002 	mvn	r2, r2
40009088:	e0002002 	and	r2, r0, r2
4000908c:	e5832000 	str	r2, [r3]
40009090:	e51b3004 	ldr	r3, [fp, #-4]
40009094:	e2832003 	add	r2, r3, #3
40009098:	e3530000 	cmp	r3, #0
4000909c:	b1a03002 	movlt	r3, r2
400090a0:	e1a03143 	asr	r3, r3, #2
400090a4:	e1a02003 	mov	r2, r3
400090a8:	e1a03002 	mov	r3, r2
400090ac:	e1a01103 	lsl	r1, r3, #2
400090b0:	e59f3128 	ldr	r3, [pc, #296]	; 400091e0 <request_irq+0x234>
400090b4:	e0813003 	add	r3, r1, r3
400090b8:	e1a01102 	lsl	r1, r2, #2
400090bc:	e59f211c 	ldr	r2, [pc, #284]	; 400091e0 <request_irq+0x234>
400090c0:	e0812002 	add	r2, r1, r2
400090c4:	e5920000 	ldr	r0, [r2]
400090c8:	e55bc008 	ldrb	ip, [fp, #-8]
400090cc:	e51b1004 	ldr	r1, [fp, #-4]
400090d0:	e1a02fc1 	asr	r2, r1, #31
400090d4:	e1a02f22 	lsr	r2, r2, #30
400090d8:	e0811002 	add	r1, r1, r2
400090dc:	e2011003 	and	r1, r1, #3
400090e0:	e0622001 	rsb	r2, r2, r1
400090e4:	e1a02182 	lsl	r2, r2, #3
400090e8:	e1a0221c 	lsl	r2, ip, r2
400090ec:	e1802002 	orr	r2, r0, r2
400090f0:	e5832000 	str	r2, [r3]
400090f4:	e51b3004 	ldr	r3, [fp, #-4]
400090f8:	e2832003 	add	r2, r3, #3
400090fc:	e3530000 	cmp	r3, #0
40009100:	b1a03002 	movlt	r3, r2
40009104:	e1a03143 	asr	r3, r3, #2
40009108:	e1a02003 	mov	r2, r3
4000910c:	e1a03002 	mov	r3, r2
40009110:	e1a01103 	lsl	r1, r3, #2
40009114:	e59f30c8 	ldr	r3, [pc, #200]	; 400091e4 <request_irq+0x238>
40009118:	e0813003 	add	r3, r1, r3
4000911c:	e1a01102 	lsl	r1, r2, #2
40009120:	e59f20bc 	ldr	r2, [pc, #188]	; 400091e4 <request_irq+0x238>
40009124:	e0812002 	add	r2, r1, r2
40009128:	e5920000 	ldr	r0, [r2]
4000912c:	e51b1004 	ldr	r1, [fp, #-4]
40009130:	e1a02fc1 	asr	r2, r1, #31
40009134:	e1a02f22 	lsr	r2, r2, #30
40009138:	e0811002 	add	r1, r1, r2
4000913c:	e2011003 	and	r1, r1, #3
40009140:	e0622001 	rsb	r2, r2, r1
40009144:	e1a02182 	lsl	r2, r2, #3
40009148:	e3a010ff 	mov	r1, #255	; 0xff
4000914c:	e1a02211 	lsl	r2, r1, r2
40009150:	e1e02002 	mvn	r2, r2
40009154:	e0002002 	and	r2, r0, r2
40009158:	e5832000 	str	r2, [r3]
4000915c:	e51b3004 	ldr	r3, [fp, #-4]
40009160:	e2832003 	add	r2, r3, #3
40009164:	e3530000 	cmp	r3, #0
40009168:	b1a03002 	movlt	r3, r2
4000916c:	e1a03143 	asr	r3, r3, #2
40009170:	e1a02003 	mov	r2, r3
40009174:	e1a03002 	mov	r3, r2
40009178:	e1a01103 	lsl	r1, r3, #2
4000917c:	e59f3060 	ldr	r3, [pc, #96]	; 400091e4 <request_irq+0x238>
40009180:	e0813003 	add	r3, r1, r3
40009184:	e1a01102 	lsl	r1, r2, #2
40009188:	e59f2054 	ldr	r2, [pc, #84]	; 400091e4 <request_irq+0x238>
4000918c:	e0812002 	add	r2, r1, r2
40009190:	e5920000 	ldr	r0, [r2]
40009194:	e51b1004 	ldr	r1, [fp, #-4]
40009198:	e1a02fc1 	asr	r2, r1, #31
4000919c:	e1a02f22 	lsr	r2, r2, #30
400091a0:	e0811002 	add	r1, r1, r2
400091a4:	e2011003 	and	r1, r1, #3
400091a8:	e0622001 	rsb	r2, r2, r1
400091ac:	e1a02182 	lsl	r2, r2, #3
400091b0:	e3a01001 	mov	r1, #1
400091b4:	e1a02211 	lsl	r2, r1, r2
400091b8:	e1802002 	orr	r2, r0, r2
400091bc:	e5832000 	str	r2, [r3]
400091c0:	e59f3020 	ldr	r3, [pc, #32]	; 400091e8 <request_irq+0x23c>
400091c4:	e51b2004 	ldr	r2, [fp, #-4]
400091c8:	e51b100c 	ldr	r1, [fp, #-12]
400091cc:	e7831102 	str	r1, [r3, r2, lsl #2]
400091d0:	e28bd000 	add	sp, fp, #0
400091d4:	e8bd0800 	pop	{fp}
400091d8:	e12fff1e 	bx	lr
400091dc:	10490100 	.word	0x10490100
400091e0:	10490400 	.word	0x10490400
400091e4:	10490800 	.word	0x10490800
400091e8:	40009c98 	.word	0x40009c98

400091ec <wdt_init>:
400091ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400091f0:	e28db000 	add	fp, sp, #0
400091f4:	e59f3034 	ldr	r3, [pc, #52]	; 40009230 <wdt_init+0x44>
400091f8:	e3a02000 	mov	r2, #0
400091fc:	e5832000 	str	r2, [r3]
40009200:	e59f302c 	ldr	r3, [pc, #44]	; 40009234 <wdt_init+0x48>
40009204:	e3a02000 	mov	r2, #0
40009208:	e5832000 	str	r2, [r3]
4000920c:	e59f3024 	ldr	r3, [pc, #36]	; 40009238 <wdt_init+0x4c>
40009210:	e59f2024 	ldr	r2, [pc, #36]	; 4000923c <wdt_init+0x50>
40009214:	e5832000 	str	r2, [r3]
40009218:	e59f3020 	ldr	r3, [pc, #32]	; 40009240 <wdt_init+0x54>
4000921c:	e59f2020 	ldr	r2, [pc, #32]	; 40009244 <wdt_init+0x58>
40009220:	e5832000 	str	r2, [r3]
40009224:	e28bd000 	add	sp, fp, #0
40009228:	e8bd0800 	pop	{fp}
4000922c:	e12fff1e 	bx	lr
40009230:	10020408 	.word	0x10020408
40009234:	1002040c 	.word	0x1002040c
40009238:	10060008 	.word	0x10060008
4000923c:	000023c4 	.word	0x000023c4
40009240:	10060000 	.word	0x10060000
40009244:	0000ff39 	.word	0x0000ff39

40009248 <do_wdt>:
40009248:	e92d4800 	push	{fp, lr}
4000924c:	e28db004 	add	fp, sp, #4
40009250:	e59f3010 	ldr	r3, [pc, #16]	; 40009268 <do_wdt+0x20>
40009254:	e3a02001 	mov	r2, #1
40009258:	e5832000 	str	r2, [r3]
4000925c:	e59f0008 	ldr	r0, [pc, #8]	; 4000926c <do_wdt+0x24>
40009260:	ebfffe64 	bl	40008bf8 <uprintf>
40009264:	e8bd8800 	pop	{fp, pc}
40009268:	1006000c 	.word	0x1006000c
4000926c:	40009b94 	.word	0x40009b94

40009270 <wdt_timer>:
40009270:	e92d4800 	push	{fp, lr}
40009274:	e28db004 	add	fp, sp, #4
40009278:	e59f3030 	ldr	r3, [pc, #48]	; 400092b0 <wdt_timer+0x40>
4000927c:	e59f2030 	ldr	r2, [pc, #48]	; 400092b4 <wdt_timer+0x44>
40009280:	e5832000 	str	r2, [r3]
40009284:	e59f302c 	ldr	r3, [pc, #44]	; 400092b8 <wdt_timer+0x48>
40009288:	e59f2024 	ldr	r2, [pc, #36]	; 400092b4 <wdt_timer+0x44>
4000928c:	e5832000 	str	r2, [r3]
40009290:	e59f3024 	ldr	r3, [pc, #36]	; 400092bc <wdt_timer+0x4c>
40009294:	e59f2024 	ldr	r2, [pc, #36]	; 400092c0 <wdt_timer+0x50>
40009298:	e5832000 	str	r2, [r3]
4000929c:	e3a0004b 	mov	r0, #75	; 0x4b
400092a0:	e3a01003 	mov	r1, #3
400092a4:	e59f2018 	ldr	r2, [pc, #24]	; 400092c4 <wdt_timer+0x54>
400092a8:	ebffff3f 	bl	40008fac <request_irq>
400092ac:	e8bd8800 	pop	{fp, pc}
400092b0:	10060004 	.word	0x10060004
400092b4:	00000bec 	.word	0x00000bec
400092b8:	10060008 	.word	0x10060008
400092bc:	10060000 	.word	0x10060000
400092c0:	0000ff3c 	.word	0x0000ff3c
400092c4:	40009248 	.word	0x40009248

400092c8 <do_adc>:
400092c8:	e92d4800 	push	{fp, lr}
400092cc:	e28db004 	add	fp, sp, #4
400092d0:	e24dd004 	sub	sp, sp, #4
400092d4:	e59f3040 	ldr	r3, [pc, #64]	; 4000931c <do_adc+0x54>
400092d8:	e5933000 	ldr	r3, [r3]
400092dc:	e2033702 	and	r3, r3, #524288	; 0x80000
400092e0:	e3530000 	cmp	r3, #0
400092e4:	0a00000a 	beq	40009314 <do_adc+0x4c>
400092e8:	e59f3030 	ldr	r3, [pc, #48]	; 40009320 <do_adc+0x58>
400092ec:	e3a02001 	mov	r2, #1
400092f0:	e5832000 	str	r2, [r3]
400092f4:	e59f3028 	ldr	r3, [pc, #40]	; 40009324 <do_adc+0x5c>
400092f8:	e5933000 	ldr	r3, [r3]
400092fc:	e1a03a03 	lsl	r3, r3, #20
40009300:	e1a03a23 	lsr	r3, r3, #20
40009304:	e50b3008 	str	r3, [fp, #-8]
40009308:	e59f0018 	ldr	r0, [pc, #24]	; 40009328 <do_adc+0x60>
4000930c:	e51b1008 	ldr	r1, [fp, #-8]
40009310:	ebfffe38 	bl	40008bf8 <uprintf>
40009314:	e24bd004 	sub	sp, fp, #4
40009318:	e8bd8800 	pop	{fp, pc}
4000931c:	10440028 	.word	0x10440028
40009320:	126c0018 	.word	0x126c0018
40009324:	126c000c 	.word	0x126c000c
40009328:	40009bac 	.word	0x40009bac

4000932c <adc_init>:
4000932c:	e92d4800 	push	{fp, lr}
40009330:	e28db004 	add	fp, sp, #4
40009334:	e59f302c 	ldr	r3, [pc, #44]	; 40009368 <adc_init+0x3c>
40009338:	e59f202c 	ldr	r2, [pc, #44]	; 4000936c <adc_init+0x40>
4000933c:	e5832000 	str	r2, [r3]
40009340:	e59f3028 	ldr	r3, [pc, #40]	; 40009370 <adc_init+0x44>
40009344:	e59f2024 	ldr	r2, [pc, #36]	; 40009370 <adc_init+0x44>
40009348:	e5922000 	ldr	r2, [r2]
4000934c:	e3822702 	orr	r2, r2, #524288	; 0x80000
40009350:	e5832000 	str	r2, [r3]
40009354:	e3a0002a 	mov	r0, #42	; 0x2a
40009358:	e3a01004 	mov	r1, #4
4000935c:	e59f2010 	ldr	r2, [pc, #16]	; 40009374 <adc_init+0x48>
40009360:	ebffff11 	bl	40008fac <request_irq>
40009364:	e8bd8800 	pop	{fp, pc}
40009368:	126c0000 	.word	0x126c0000
4000936c:	00016100 	.word	0x00016100
40009370:	10440020 	.word	0x10440020
40009374:	400092c8 	.word	0x400092c8

40009378 <mode_read>:
40009378:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
4000937c:	e28db000 	add	fp, sp, #0
40009380:	e59f3010 	ldr	r3, [pc, #16]	; 40009398 <mode_read+0x20>
40009384:	e59f2010 	ldr	r2, [pc, #16]	; 4000939c <mode_read+0x24>
40009388:	e5832000 	str	r2, [r3]
4000938c:	e28bd000 	add	sp, fp, #0
40009390:	e8bd0800 	pop	{fp}
40009394:	e12fff1e 	bx	lr
40009398:	126c0000 	.word	0x126c0000
4000939c:	00016102 	.word	0x00016102

400093a0 <start>:
400093a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400093a4:	e28db000 	add	fp, sp, #0
400093a8:	e59f3018 	ldr	r3, [pc, #24]	; 400093c8 <start+0x28>
400093ac:	e59f2014 	ldr	r2, [pc, #20]	; 400093c8 <start+0x28>
400093b0:	e5922000 	ldr	r2, [r2]
400093b4:	e3822001 	orr	r2, r2, #1
400093b8:	e5832000 	str	r2, [r3]
400093bc:	e28bd000 	add	sp, fp, #0
400093c0:	e8bd0800 	pop	{fp}
400093c4:	e12fff1e 	bx	lr
400093c8:	126c0000 	.word	0x126c0000

400093cc <read_start>:
400093cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400093d0:	e28db000 	add	fp, sp, #0
400093d4:	e24dd004 	sub	sp, sp, #4
400093d8:	e59f3018 	ldr	r3, [pc, #24]	; 400093f8 <read_start+0x2c>
400093dc:	e5933000 	ldr	r3, [r3]
400093e0:	e1a03a03 	lsl	r3, r3, #20
400093e4:	e1a03a23 	lsr	r3, r3, #20
400093e8:	e50b3004 	str	r3, [fp, #-4]
400093ec:	e28bd000 	add	sp, fp, #0
400093f0:	e8bd0800 	pop	{fp}
400093f4:	e12fff1e 	bx	lr
400093f8:	126c000c 	.word	0x126c000c

400093fc <read_value>:
400093fc:	e92d4800 	push	{fp, lr}
40009400:	e28db004 	add	fp, sp, #4
40009404:	e24dd004 	sub	sp, sp, #4
40009408:	e1a00000 	nop			; (mov r0, r0)
4000940c:	e59f3034 	ldr	r3, [pc, #52]	; 40009448 <read_value+0x4c>
40009410:	e5933000 	ldr	r3, [r3]
40009414:	e2033902 	and	r3, r3, #32768	; 0x8000
40009418:	e3530000 	cmp	r3, #0
4000941c:	0afffffa 	beq	4000940c <read_value+0x10>
40009420:	e59f3024 	ldr	r3, [pc, #36]	; 4000944c <read_value+0x50>
40009424:	e5933000 	ldr	r3, [r3]
40009428:	e1a03a03 	lsl	r3, r3, #20
4000942c:	e1a03a23 	lsr	r3, r3, #20
40009430:	e50b3008 	str	r3, [fp, #-8]
40009434:	e59f0014 	ldr	r0, [pc, #20]	; 40009450 <read_value+0x54>
40009438:	e51b1008 	ldr	r1, [fp, #-8]
4000943c:	ebfffded 	bl	40008bf8 <uprintf>
40009440:	e24bd004 	sub	sp, fp, #4
40009444:	e8bd8800 	pop	{fp, pc}
40009448:	126c0000 	.word	0x126c0000
4000944c:	126c000c 	.word	0x126c000c
40009450:	40009bac 	.word	0x40009bac

40009454 <iic_init>:
40009454:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
40009458:	e28db000 	add	fp, sp, #0
4000945c:	e59f3030 	ldr	r3, [pc, #48]	; 40009494 <iic_init+0x40>
40009460:	e59f202c 	ldr	r2, [pc, #44]	; 40009494 <iic_init+0x40>
40009464:	e5922000 	ldr	r2, [r2]
40009468:	e3822c22 	orr	r2, r2, #8704	; 0x2200
4000946c:	e5832000 	str	r2, [r3]
40009470:	e59f3020 	ldr	r3, [pc, #32]	; 40009498 <iic_init+0x44>
40009474:	e3a020e0 	mov	r2, #224	; 0xe0
40009478:	e5832000 	str	r2, [r3]
4000947c:	e59f3018 	ldr	r3, [pc, #24]	; 4000949c <iic_init+0x48>
40009480:	e3a02010 	mov	r2, #16
40009484:	e5832000 	str	r2, [r3]
40009488:	e28bd000 	add	sp, fp, #0
4000948c:	e8bd0800 	pop	{fp}
40009490:	e12fff1e 	bx	lr
40009494:	114000c0 	.word	0x114000c0
40009498:	13870000 	.word	0x13870000
4000949c:	13870004 	.word	0x13870004

400094a0 <clear>:
400094a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400094a4:	e28db000 	add	fp, sp, #0
400094a8:	e59f3018 	ldr	r3, [pc, #24]	; 400094c8 <clear+0x28>
400094ac:	e59f2014 	ldr	r2, [pc, #20]	; 400094c8 <clear+0x28>
400094b0:	e5922000 	ldr	r2, [r2]
400094b4:	e3c22010 	bic	r2, r2, #16
400094b8:	e5832000 	str	r2, [r3]
400094bc:	e28bd000 	add	sp, fp, #0
400094c0:	e8bd0800 	pop	{fp}
400094c4:	e12fff1e 	bx	lr
400094c8:	13870000 	.word	0x13870000

400094cc <wait_pending>:
400094cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
400094d0:	e28db000 	add	fp, sp, #0
400094d4:	e24dd004 	sub	sp, sp, #4
400094d8:	e3a03801 	mov	r3, #65536	; 0x10000
400094dc:	e50b3004 	str	r3, [fp, #-4]
400094e0:	ea000006 	b	40009500 <wait_pending+0x34>
400094e4:	e59f3050 	ldr	r3, [pc, #80]	; 4000953c <wait_pending+0x70>
400094e8:	e5933000 	ldr	r3, [r3]
400094ec:	e2033010 	and	r3, r3, #16
400094f0:	e3530000 	cmp	r3, #0
400094f4:	0a000001 	beq	40009500 <wait_pending+0x34>
400094f8:	e3a03000 	mov	r3, #0
400094fc:	ea00000a 	b	4000952c <wait_pending+0x60>
40009500:	e51b3004 	ldr	r3, [fp, #-4]
40009504:	e3530000 	cmp	r3, #0
40009508:	03a03000 	moveq	r3, #0
4000950c:	13a03001 	movne	r3, #1
40009510:	e6ef3073 	uxtb	r3, r3
40009514:	e51b2004 	ldr	r2, [fp, #-4]
40009518:	e2422001 	sub	r2, r2, #1
4000951c:	e50b2004 	str	r2, [fp, #-4]
40009520:	e3530000 	cmp	r3, #0
40009524:	1affffee 	bne	400094e4 <wait_pending+0x18>
40009528:	e3e03000 	mvn	r3, #0
4000952c:	e1a00003 	mov	r0, r3
40009530:	e28bd000 	add	sp, fp, #0
40009534:	e8bd0800 	pop	{fp}
40009538:	e12fff1e 	bx	lr
4000953c:	13870000 	.word	0x13870000

40009540 <stop>:
40009540:	e92d4800 	push	{fp, lr}
40009544:	e28db004 	add	fp, sp, #4
40009548:	e24dd004 	sub	sp, sp, #4
4000954c:	e3a03ffa 	mov	r3, #1000	; 0x3e8
40009550:	e50b3008 	str	r3, [fp, #-8]
40009554:	e59f303c 	ldr	r3, [pc, #60]	; 40009598 <stop+0x58>
40009558:	e3a020d0 	mov	r2, #208	; 0xd0
4000955c:	e5832000 	str	r2, [r3]
40009560:	ebffffce 	bl	400094a0 <clear>
40009564:	e1a00000 	nop			; (mov r0, r0)
40009568:	e51b3008 	ldr	r3, [fp, #-8]
4000956c:	e3530000 	cmp	r3, #0
40009570:	03a03000 	moveq	r3, #0
40009574:	13a03001 	movne	r3, #1
40009578:	e6ef3073 	uxtb	r3, r3
4000957c:	e51b2008 	ldr	r2, [fp, #-8]
40009580:	e2422001 	sub	r2, r2, #1
40009584:	e50b2008 	str	r2, [fp, #-8]
40009588:	e3530000 	cmp	r3, #0
4000958c:	1afffff5 	bne	40009568 <stop+0x28>
40009590:	e24bd004 	sub	sp, fp, #4
40009594:	e8bd8800 	pop	{fp, pc}
40009598:	13870004 	.word	0x13870004

4000959c <send_byte>:
4000959c:	e92d4800 	push	{fp, lr}
400095a0:	e28db004 	add	fp, sp, #4
400095a4:	e24dd008 	sub	sp, sp, #8
400095a8:	e1a03000 	mov	r3, r0
400095ac:	e54b300c 	strb	r3, [fp, #-12]
400095b0:	e3e03000 	mvn	r3, #0
400095b4:	e50b3008 	str	r3, [fp, #-8]
400095b8:	e59f3060 	ldr	r3, [pc, #96]	; 40009620 <send_byte+0x84>
400095bc:	e55b200c 	ldrb	r2, [fp, #-12]
400095c0:	e5832000 	str	r2, [r3]
400095c4:	ebffffb5 	bl	400094a0 <clear>
400095c8:	ebffffbf 	bl	400094cc <wait_pending>
400095cc:	e1a03000 	mov	r3, r0
400095d0:	e3530000 	cmp	r3, #0
400095d4:	aa000002 	bge	400095e4 <send_byte+0x48>
400095d8:	ebffffd8 	bl	40009540 <stop>
400095dc:	e51b3008 	ldr	r3, [fp, #-8]
400095e0:	ea00000b 	b	40009614 <send_byte+0x78>
400095e4:	e59f3038 	ldr	r3, [pc, #56]	; 40009624 <send_byte+0x88>
400095e8:	e5933000 	ldr	r3, [r3]
400095ec:	e2033001 	and	r3, r3, #1
400095f0:	e6ef3073 	uxtb	r3, r3
400095f4:	e3530000 	cmp	r3, #0
400095f8:	0a000002 	beq	40009608 <send_byte+0x6c>
400095fc:	ebffffcf 	bl	40009540 <stop>
40009600:	e51b3008 	ldr	r3, [fp, #-8]
40009604:	ea000002 	b	40009614 <send_byte+0x78>
40009608:	e3a03000 	mov	r3, #0
4000960c:	e50b3008 	str	r3, [fp, #-8]
40009610:	e51b3008 	ldr	r3, [fp, #-8]
40009614:	e1a00003 	mov	r0, r3
40009618:	e24bd004 	sub	sp, fp, #4
4000961c:	e8bd8800 	pop	{fp, pc}
40009620:	1387000c 	.word	0x1387000c
40009624:	13870004 	.word	0x13870004

40009628 <recv_byte>:
40009628:	e92d4800 	push	{fp, lr}
4000962c:	e28db004 	add	fp, sp, #4
40009630:	e24dd008 	sub	sp, sp, #8
40009634:	e50b000c 	str	r0, [fp, #-12]
40009638:	e3e03000 	mvn	r3, #0
4000963c:	e50b3008 	str	r3, [fp, #-8]
40009640:	ebffff96 	bl	400094a0 <clear>
40009644:	ebffffa0 	bl	400094cc <wait_pending>
40009648:	e1a03000 	mov	r3, r0
4000964c:	e3530000 	cmp	r3, #0
40009650:	aa000002 	bge	40009660 <recv_byte+0x38>
40009654:	ebffffb9 	bl	40009540 <stop>
40009658:	e51b3008 	ldr	r3, [fp, #-8]
4000965c:	ea000007 	b	40009680 <recv_byte+0x58>
40009660:	e59f3024 	ldr	r3, [pc, #36]	; 4000968c <recv_byte+0x64>
40009664:	e5933000 	ldr	r3, [r3]
40009668:	e6ef2073 	uxtb	r2, r3
4000966c:	e51b300c 	ldr	r3, [fp, #-12]
40009670:	e5c32000 	strb	r2, [r3]
40009674:	e3a03000 	mov	r3, #0
40009678:	e50b3008 	str	r3, [fp, #-8]
4000967c:	e51b3008 	ldr	r3, [fp, #-8]
40009680:	e1a00003 	mov	r0, r3
40009684:	e24bd004 	sub	sp, fp, #4
40009688:	e8bd8800 	pop	{fp, pc}
4000968c:	1387000c 	.word	0x1387000c

40009690 <read_data>:
40009690:	e92d4800 	push	{fp, lr}
40009694:	e28db004 	add	fp, sp, #4
40009698:	e24dd010 	sub	sp, sp, #16
4000969c:	e1a03001 	mov	r3, r1
400096a0:	e50b2014 	str	r2, [fp, #-20]
400096a4:	e1a02000 	mov	r2, r0
400096a8:	e54b200c 	strb	r2, [fp, #-12]
400096ac:	e54b3010 	strb	r3, [fp, #-16]
400096b0:	e3e03000 	mvn	r3, #0
400096b4:	e50b3008 	str	r3, [fp, #-8]
400096b8:	e59f311c 	ldr	r3, [pc, #284]	; 400097dc <read_data+0x14c>
400096bc:	e55b200c 	ldrb	r2, [fp, #-12]
400096c0:	e1a02082 	lsl	r2, r2, #1
400096c4:	e5832000 	str	r2, [r3]
400096c8:	e59f3110 	ldr	r3, [pc, #272]	; 400097e0 <read_data+0x150>
400096cc:	e3a020f0 	mov	r2, #240	; 0xf0
400096d0:	e5832000 	str	r2, [r3]
400096d4:	ebffff71 	bl	400094a0 <clear>
400096d8:	ebffff7b 	bl	400094cc <wait_pending>
400096dc:	e1a03000 	mov	r3, r0
400096e0:	e3530000 	cmp	r3, #0
400096e4:	aa000002 	bge	400096f4 <read_data+0x64>
400096e8:	ebffff94 	bl	40009540 <stop>
400096ec:	e51b3008 	ldr	r3, [fp, #-8]
400096f0:	ea000036 	b	400097d0 <read_data+0x140>
400096f4:	e59f30e4 	ldr	r3, [pc, #228]	; 400097e0 <read_data+0x150>
400096f8:	e5933000 	ldr	r3, [r3]
400096fc:	e2033001 	and	r3, r3, #1
40009700:	e6ef3073 	uxtb	r3, r3
40009704:	e3530000 	cmp	r3, #0
40009708:	0a000002 	beq	40009718 <read_data+0x88>
4000970c:	ebffff8b 	bl	40009540 <stop>
40009710:	e51b3008 	ldr	r3, [fp, #-8]
40009714:	ea00002d 	b	400097d0 <read_data+0x140>
40009718:	e55b3010 	ldrb	r3, [fp, #-16]
4000971c:	e1a00003 	mov	r0, r3
40009720:	ebffff9d 	bl	4000959c <send_byte>
40009724:	e1a03000 	mov	r3, r0
40009728:	e3530000 	cmp	r3, #0
4000972c:	aa000002 	bge	4000973c <read_data+0xac>
40009730:	ebffff82 	bl	40009540 <stop>
40009734:	e51b3008 	ldr	r3, [fp, #-8]
40009738:	ea000024 	b	400097d0 <read_data+0x140>
4000973c:	ebffff7f 	bl	40009540 <stop>
40009740:	e59f3094 	ldr	r3, [pc, #148]	; 400097dc <read_data+0x14c>
40009744:	e55b200c 	ldrb	r2, [fp, #-12]
40009748:	e1a02082 	lsl	r2, r2, #1
4000974c:	e3822001 	orr	r2, r2, #1
40009750:	e5832000 	str	r2, [r3]
40009754:	e59f3084 	ldr	r3, [pc, #132]	; 400097e0 <read_data+0x150>
40009758:	e3a020b0 	mov	r2, #176	; 0xb0
4000975c:	e5832000 	str	r2, [r3]
40009760:	ebffff4e 	bl	400094a0 <clear>
40009764:	ebffff58 	bl	400094cc <wait_pending>
40009768:	e1a03000 	mov	r3, r0
4000976c:	e3530000 	cmp	r3, #0
40009770:	aa000002 	bge	40009780 <read_data+0xf0>
40009774:	ebffff71 	bl	40009540 <stop>
40009778:	e51b3008 	ldr	r3, [fp, #-8]
4000977c:	ea000013 	b	400097d0 <read_data+0x140>
40009780:	e59f3058 	ldr	r3, [pc, #88]	; 400097e0 <read_data+0x150>
40009784:	e5933000 	ldr	r3, [r3]
40009788:	e2033001 	and	r3, r3, #1
4000978c:	e6ef3073 	uxtb	r3, r3
40009790:	e3530000 	cmp	r3, #0
40009794:	0a000002 	beq	400097a4 <read_data+0x114>
40009798:	ebffff68 	bl	40009540 <stop>
4000979c:	e51b3008 	ldr	r3, [fp, #-8]
400097a0:	ea00000a 	b	400097d0 <read_data+0x140>
400097a4:	e51b0014 	ldr	r0, [fp, #-20]
400097a8:	ebffff9e 	bl	40009628 <recv_byte>
400097ac:	e1a03000 	mov	r3, r0
400097b0:	e3530000 	cmp	r3, #0
400097b4:	aa000002 	bge	400097c4 <read_data+0x134>
400097b8:	ebffff60 	bl	40009540 <stop>
400097bc:	e51b3008 	ldr	r3, [fp, #-8]
400097c0:	ea000002 	b	400097d0 <read_data+0x140>
400097c4:	e3a03000 	mov	r3, #0
400097c8:	e50b3008 	str	r3, [fp, #-8]
400097cc:	e51b3008 	ldr	r3, [fp, #-8]
400097d0:	e1a00003 	mov	r0, r3
400097d4:	e24bd004 	sub	sp, fp, #4
400097d8:	e8bd8800 	pop	{fp, pc}
400097dc:	1387000c 	.word	0x1387000c
400097e0:	13870004 	.word	0x13870004

400097e4 <read_data_num>:
400097e4:	e92d4800 	push	{fp, lr}
400097e8:	e28db004 	add	fp, sp, #4
400097ec:	e24dd018 	sub	sp, sp, #24
400097f0:	e50b2018 	str	r2, [fp, #-24]
400097f4:	e50b301c 	str	r3, [fp, #-28]
400097f8:	e1a03000 	mov	r3, r0
400097fc:	e54b3010 	strb	r3, [fp, #-16]
40009800:	e1a03001 	mov	r3, r1
40009804:	e54b3014 	strb	r3, [fp, #-20]
40009808:	e3e03000 	mvn	r3, #0
4000980c:	e50b300c 	str	r3, [fp, #-12]
40009810:	e59f3150 	ldr	r3, [pc, #336]	; 40009968 <read_data_num+0x184>
40009814:	e55b2010 	ldrb	r2, [fp, #-16]
40009818:	e1a02082 	lsl	r2, r2, #1
4000981c:	e5832000 	str	r2, [r3]
40009820:	e59f3144 	ldr	r3, [pc, #324]	; 4000996c <read_data_num+0x188>
40009824:	e3a020f0 	mov	r2, #240	; 0xf0
40009828:	e5832000 	str	r2, [r3]
4000982c:	ebffff1b 	bl	400094a0 <clear>
40009830:	ebffff25 	bl	400094cc <wait_pending>
40009834:	e1a03000 	mov	r3, r0
40009838:	e3530000 	cmp	r3, #0
4000983c:	aa000002 	bge	4000984c <read_data_num+0x68>
40009840:	ebffff3e 	bl	40009540 <stop>
40009844:	e51b300c 	ldr	r3, [fp, #-12]
40009848:	ea000043 	b	4000995c <read_data_num+0x178>
4000984c:	e59f3118 	ldr	r3, [pc, #280]	; 4000996c <read_data_num+0x188>
40009850:	e5933000 	ldr	r3, [r3]
40009854:	e2033001 	and	r3, r3, #1
40009858:	e6ef3073 	uxtb	r3, r3
4000985c:	e3530000 	cmp	r3, #0
40009860:	0a000002 	beq	40009870 <read_data_num+0x8c>
40009864:	ebffff35 	bl	40009540 <stop>
40009868:	e51b300c 	ldr	r3, [fp, #-12]
4000986c:	ea00003a 	b	4000995c <read_data_num+0x178>
40009870:	e55b3014 	ldrb	r3, [fp, #-20]
40009874:	e1a00003 	mov	r0, r3
40009878:	ebffff47 	bl	4000959c <send_byte>
4000987c:	e1a03000 	mov	r3, r0
40009880:	e3530000 	cmp	r3, #0
40009884:	aa000002 	bge	40009894 <read_data_num+0xb0>
40009888:	ebffff2c 	bl	40009540 <stop>
4000988c:	e51b300c 	ldr	r3, [fp, #-12]
40009890:	ea000031 	b	4000995c <read_data_num+0x178>
40009894:	ebffff29 	bl	40009540 <stop>
40009898:	e59f30c8 	ldr	r3, [pc, #200]	; 40009968 <read_data_num+0x184>
4000989c:	e55b2010 	ldrb	r2, [fp, #-16]
400098a0:	e1a02082 	lsl	r2, r2, #1
400098a4:	e3822001 	orr	r2, r2, #1
400098a8:	e5832000 	str	r2, [r3]
400098ac:	e59f30b8 	ldr	r3, [pc, #184]	; 4000996c <read_data_num+0x188>
400098b0:	e3a020b0 	mov	r2, #176	; 0xb0
400098b4:	e5832000 	str	r2, [r3]
400098b8:	ebfffef8 	bl	400094a0 <clear>
400098bc:	ebffff02 	bl	400094cc <wait_pending>
400098c0:	e1a03000 	mov	r3, r0
400098c4:	e3530000 	cmp	r3, #0
400098c8:	aa000002 	bge	400098d8 <read_data_num+0xf4>
400098cc:	ebffff1b 	bl	40009540 <stop>
400098d0:	e51b300c 	ldr	r3, [fp, #-12]
400098d4:	ea000020 	b	4000995c <read_data_num+0x178>
400098d8:	e59f308c 	ldr	r3, [pc, #140]	; 4000996c <read_data_num+0x188>
400098dc:	e5933000 	ldr	r3, [r3]
400098e0:	e2033001 	and	r3, r3, #1
400098e4:	e6ef3073 	uxtb	r3, r3
400098e8:	e3530000 	cmp	r3, #0
400098ec:	0a000002 	beq	400098fc <read_data_num+0x118>
400098f0:	ebffff12 	bl	40009540 <stop>
400098f4:	e51b300c 	ldr	r3, [fp, #-12]
400098f8:	ea000017 	b	4000995c <read_data_num+0x178>
400098fc:	e3a03000 	mov	r3, #0
40009900:	e50b3008 	str	r3, [fp, #-8]
40009904:	ea00000d 	b	40009940 <read_data_num+0x15c>
40009908:	e51b3008 	ldr	r3, [fp, #-8]
4000990c:	e51b2018 	ldr	r2, [fp, #-24]
40009910:	e0823003 	add	r3, r2, r3
40009914:	e1a00003 	mov	r0, r3
40009918:	ebffff42 	bl	40009628 <recv_byte>
4000991c:	e1a03000 	mov	r3, r0
40009920:	e3530000 	cmp	r3, #0
40009924:	aa000002 	bge	40009934 <read_data_num+0x150>
40009928:	ebffff04 	bl	40009540 <stop>
4000992c:	e51b300c 	ldr	r3, [fp, #-12]
40009930:	ea000009 	b	4000995c <read_data_num+0x178>
40009934:	e51b3008 	ldr	r3, [fp, #-8]
40009938:	e2833001 	add	r3, r3, #1
4000993c:	e50b3008 	str	r3, [fp, #-8]
40009940:	e51b2008 	ldr	r2, [fp, #-8]
40009944:	e51b301c 	ldr	r3, [fp, #-28]
40009948:	e1520003 	cmp	r2, r3
4000994c:	baffffed 	blt	40009908 <read_data_num+0x124>
40009950:	e3a03000 	mov	r3, #0
40009954:	e50b300c 	str	r3, [fp, #-12]
40009958:	e51b300c 	ldr	r3, [fp, #-12]
4000995c:	e1a00003 	mov	r0, r3
40009960:	e24bd004 	sub	sp, fp, #4
40009964:	e8bd8800 	pop	{fp, pc}
40009968:	1387000c 	.word	0x1387000c
4000996c:	13870004 	.word	0x13870004

40009970 <do_touch>:
40009970:	e92d4800 	push	{fp, lr}
40009974:	e28db004 	add	fp, sp, #4
40009978:	e24dd00c 	sub	sp, sp, #12
4000997c:	e59f30e8 	ldr	r3, [pc, #232]	; 40009a6c <do_touch+0xfc>
40009980:	e59f20e4 	ldr	r2, [pc, #228]	; 40009a6c <do_touch+0xfc>
40009984:	e5922000 	ldr	r2, [r2]
40009988:	e3822040 	orr	r2, r2, #64	; 0x40
4000998c:	e5832000 	str	r2, [r3]
40009990:	e24b3010 	sub	r3, fp, #16
40009994:	e3a00038 	mov	r0, #56	; 0x38
40009998:	e3a01002 	mov	r1, #2
4000999c:	e1a02003 	mov	r2, r3
400099a0:	e3a03005 	mov	r3, #5
400099a4:	ebffff8e 	bl	400097e4 <read_data_num>
400099a8:	e1a03000 	mov	r3, r0
400099ac:	e3530000 	cmp	r3, #0
400099b0:	aa000008 	bge	400099d8 <do_touch+0x68>
400099b4:	e24b3010 	sub	r3, fp, #16
400099b8:	e3a00038 	mov	r0, #56	; 0x38
400099bc:	e3a01002 	mov	r1, #2
400099c0:	e1a02003 	mov	r2, r3
400099c4:	e3a03005 	mov	r3, #5
400099c8:	ebffff85 	bl	400097e4 <read_data_num>
400099cc:	e1a03000 	mov	r3, r0
400099d0:	e3530000 	cmp	r3, #0
400099d4:	ba00001f 	blt	40009a58 <do_touch+0xe8>
400099d8:	e55b3010 	ldrb	r3, [fp, #-16]
400099dc:	e203300f 	and	r3, r3, #15
400099e0:	e50b3008 	str	r3, [fp, #-8]
400099e4:	e51b3008 	ldr	r3, [fp, #-8]
400099e8:	e3530000 	cmp	r3, #0
400099ec:	ca000002 	bgt	400099fc <do_touch+0x8c>
400099f0:	e51b3008 	ldr	r3, [fp, #-8]
400099f4:	e3530002 	cmp	r3, #2
400099f8:	ca000018 	bgt	40009a60 <do_touch+0xf0>
400099fc:	e55b300f 	ldrb	r3, [fp, #-15]
40009a00:	e203300f 	and	r3, r3, #15
40009a04:	e1a02403 	lsl	r2, r3, #8
40009a08:	e55b300e 	ldrb	r3, [fp, #-14]
40009a0c:	e1822003 	orr	r2, r2, r3
40009a10:	e59f3058 	ldr	r3, [pc, #88]	; 40009a70 <do_touch+0x100>
40009a14:	e5832000 	str	r2, [r3]
40009a18:	e55b300d 	ldrb	r3, [fp, #-13]
40009a1c:	e203300f 	and	r3, r3, #15
40009a20:	e1a02403 	lsl	r2, r3, #8
40009a24:	e55b300c 	ldrb	r3, [fp, #-12]
40009a28:	e1822003 	orr	r2, r2, r3
40009a2c:	e59f3040 	ldr	r3, [pc, #64]	; 40009a74 <do_touch+0x104>
40009a30:	e5832000 	str	r2, [r3]
40009a34:	e59f3034 	ldr	r3, [pc, #52]	; 40009a70 <do_touch+0x100>
40009a38:	e5932000 	ldr	r2, [r3]
40009a3c:	e59f3030 	ldr	r3, [pc, #48]	; 40009a74 <do_touch+0x104>
40009a40:	e5933000 	ldr	r3, [r3]
40009a44:	e59f002c 	ldr	r0, [pc, #44]	; 40009a78 <do_touch+0x108>
40009a48:	e1a01002 	mov	r1, r2
40009a4c:	e1a02003 	mov	r2, r3
40009a50:	ebfffc68 	bl	40008bf8 <uprintf>
40009a54:	ea000002 	b	40009a64 <do_touch+0xf4>
40009a58:	e1a00000 	nop			; (mov r0, r0)
40009a5c:	ea000000 	b	40009a64 <do_touch+0xf4>
40009a60:	e1a00000 	nop			; (mov r0, r0)
40009a64:	e24bd004 	sub	sp, fp, #4
40009a68:	e8bd8800 	pop	{fp, pc}
40009a6c:	11000f44 	.word	0x11000f44
40009a70:	40009f1c 	.word	0x40009f1c
40009a74:	40009f20 	.word	0x40009f20
40009a78:	40009bb8 	.word	0x40009bb8

40009a7c <touch_init>:
40009a7c:	e92d4800 	push	{fp, lr}
40009a80:	e28db004 	add	fp, sp, #4
40009a84:	e59f3070 	ldr	r3, [pc, #112]	; 40009afc <touch_init+0x80>
40009a88:	e59f206c 	ldr	r2, [pc, #108]	; 40009afc <touch_init+0x80>
40009a8c:	e5922000 	ldr	r2, [r2]
40009a90:	e382240f 	orr	r2, r2, #251658240	; 0xf000000
40009a94:	e5832000 	str	r2, [r3]
40009a98:	e59f3060 	ldr	r3, [pc, #96]	; 40009b00 <touch_init+0x84>
40009a9c:	e59f205c 	ldr	r2, [pc, #92]	; 40009b00 <touch_init+0x84>
40009aa0:	e5922000 	ldr	r2, [r2]
40009aa4:	e3c2240f 	bic	r2, r2, #251658240	; 0xf000000
40009aa8:	e5832000 	str	r2, [r3]
40009aac:	e59f304c 	ldr	r3, [pc, #76]	; 40009b00 <touch_init+0x84>
40009ab0:	e59f2048 	ldr	r2, [pc, #72]	; 40009b00 <touch_init+0x84>
40009ab4:	e5922000 	ldr	r2, [r2]
40009ab8:	e3822402 	orr	r2, r2, #33554432	; 0x2000000
40009abc:	e5832000 	str	r2, [r3]
40009ac0:	e59f303c 	ldr	r3, [pc, #60]	; 40009b04 <touch_init+0x88>
40009ac4:	e59f2038 	ldr	r2, [pc, #56]	; 40009b04 <touch_init+0x88>
40009ac8:	e5922000 	ldr	r2, [r2]
40009acc:	e3822503 	orr	r2, r2, #12582912	; 0xc00000
40009ad0:	e5832000 	str	r2, [r3]
40009ad4:	e59f302c 	ldr	r3, [pc, #44]	; 40009b08 <touch_init+0x8c>
40009ad8:	e59f2028 	ldr	r2, [pc, #40]	; 40009b08 <touch_init+0x8c>
40009adc:	e5922000 	ldr	r2, [r2]
40009ae0:	e3c22040 	bic	r2, r2, #64	; 0x40
40009ae4:	e5832000 	str	r2, [r3]
40009ae8:	e3a0003e 	mov	r0, #62	; 0x3e
40009aec:	e3a01001 	mov	r1, #1
40009af0:	e59f2014 	ldr	r2, [pc, #20]	; 40009b0c <touch_init+0x90>
40009af4:	ebfffd2c 	bl	40008fac <request_irq>
40009af8:	e8bd8800 	pop	{fp, pc}
40009afc:	11000c20 	.word	0x11000c20
40009b00:	11000e04 	.word	0x11000e04
40009b04:	11000e8c 	.word	0x11000e8c
40009b08:	11000f04 	.word	0x11000f04
40009b0c:	40009970 	.word	0x40009970
