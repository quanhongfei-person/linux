/*
 * pwm.h
 *
 *  Created on: Aug 24, 2018
 *      Author: linux
 */

#ifndef PWM_H_
#define PWM_H_


#define TCFG0 *(unsigned int *)0x139d0000
#define TCFG1 *(unsigned int *)0x139d0004
#define TCMPB0 *(unsigned int *)0x139d0010
#define TCNTB0 *(unsigned int *)0x139d000c
#define TCON *(unsigned int *)0x139d0008

#define TINT_CSTAT *(unsigned int *)0x139d0044

extern void pwm0_init(void);


extern void timer_init(void);
extern void do_timer(void);

#endif /* PWM_H_ */
