/*
 * beep.c
 *
 *  Created on: Jul 25, 2018
 *      Author: linux
 */
#include <beep.h>
void beep_init(void)
{
	GPD0CON = 0x1;
}

void beep_on(void)
{
	GPD0DAT = 0X1;
}

void beep_off(void)
{
	GPD0DAT = 0X0;
}
