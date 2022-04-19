/*
 * led.c
 *
 *  Created on: Jul 25, 2018
 *      Author: linux
 */
#include <led.h>
void led_init(void)
{
	GPM4CON = 0x1111;
}

void led_on(void)
{
	GPM4DAT = 0x0;
}

void led_off(void)
{
	GPM4DAT = 0xf;
}



