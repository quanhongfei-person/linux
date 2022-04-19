/*
 * beep.h
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */

#ifndef BEEP_H_
#define BEEP_H_

#define GPD0CON *(unsigned int *)0x114000A0
#define GPD0DAT *(unsigned int *)0x114000A4
extern void beep_init();
extern void beep_on();
extern void beep_off();


#endif /* BEEP_H_ */
