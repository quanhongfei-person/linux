/*
 * eint.c
 *
 *  Created on: Jul 29, 2018
 *      Author: linux
 */
#include <eint.h>
#include <pwm0.h>

void do_eint26(void)
{
	if (EXT_INT43_PEND & (0x1<<2)) {
		EXT_INT43_PEND |= 0x1<<2;
		uprintf("this is key1 !!!\n");
	}
	if (EXT_INT43_PEND & (0x1<<3)) {
		EXT_INT43_PEND |= 0x1<<3;
		uprintf("this is key2 !!!\n");
	}
}


void eint_init()
{
	//io
	GPX3CON |= 0xff<<8;  //设置引脚作用为 中断功能
	EXT_INT43CON &= ~(0x77<<8);  //设置低电平触发
	EXT_INT43CON |= (0x22<<8);  //设置下降沿触发
	EXT_INT43_FLTCON0  |= 0x303<<22;//设置数字滤波
	EXT_INT43_MASK &= ~(0x3<<2);//使能中断
#define EINT  64
	request_irq(64, 0x9, do_eint26);
}



