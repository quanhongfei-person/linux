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

#define ICDDCR *(unsigned int *)0x10490000
#define ICCICR_CPUn *(unsigned int *)0x10480000
#define ICCPMR_CPUn *(unsigned int *)0x10480004
#define ICDISER2_CPU0 *(unsigned int *)0x10490108
#define ICDIPR_CPU *(unsigned int *)0x10490444
#define ICDIPTR_CPU *(unsigned int *)0x10490844
#define ICCIAR_CPUn  *(unsigned int *)0x1048000c
#define ICCEOIR_CPUn  *(unsigned int *)0x10480010
extern void timer_init(void);
extern void do_timer(void);

#endif /* PWM_H_ */
