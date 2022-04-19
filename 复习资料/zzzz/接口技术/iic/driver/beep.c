/*
 * beep.c
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */

#include <beep.h>

void beep_init()
{
	GPD0CON &= ~(0xf);
	GPD0CON |= 0x1;//设置引脚作用 GPD0[0]为输出
}

void beep_on()
{
	GPD0DAT |= (0x1);//设置GPD0[0]引脚输出低电平
}

void beep_off()
{
	GPD0DAT &= ~0X1;
}



