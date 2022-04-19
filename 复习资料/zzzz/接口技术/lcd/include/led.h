/*
 * led.h
 *
 *  Created on: Jul 25, 2018
 *      Author: linux
 */

#ifndef LED_H_
#define LED_H_
#define GPM4CON *((unsigned int *)0x110002e0)
#define GPM4DAT *((unsigned int *)0x110002e4)
extern void led_init(void);
extern void led_off(void);
extern void led_on(void);

#endif /* LED_H_ */
