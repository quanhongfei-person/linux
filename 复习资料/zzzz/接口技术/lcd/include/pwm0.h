/*
 * pwm0.h
 *
 *  Created on: Jul 26, 2018
 *      Author: linux
 */

#ifndef PWM0_H_
#define PWM0_H_
#define GPD0CON *((unsigned int *)0x114000A0)
#define GPD0DAT *((unsigned int *)0x114000A4)
#define TCFG0 *((unsigned int *)0x139d0000)
#define TCFG1 *((unsigned int *)0x139d0004)
#define TCNTB0 *((unsigned int *)0x139d000c)
#define TCNTB2 *((unsigned int *)0x139d0024)
#define TCMPB0 *((unsigned int *)0x139d0010)
#define TCON *((unsigned int *)0x139d0008)
#define TINT_CSTAT *((unsigned int *)0x139d0044)



extern void pwm0_init(int count);
extern void timer0_init(int s);
extern void do_timer0(void);

#endif /* PWM0_H_ */
