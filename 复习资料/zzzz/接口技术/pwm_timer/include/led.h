/*
 * led.h
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */

#ifndef LED_H_
#define LED_H_


#define GPM4CON *(unsigned int *)0x110002e0
#define GPM4DAT *(unsigned int *)0x110002e4
extern void led_init();
extern void led_on();
extern void led_off();

#endif /* LED_H_ */
