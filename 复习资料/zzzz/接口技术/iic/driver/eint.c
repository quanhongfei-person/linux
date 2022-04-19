/*
 * eint.c
 *
 *  Created on: Aug 26, 2018
 *      Author: linux
 */
#include <eint.h>
#include <pwm.h>

void do_eint(void)
{
	if (EXT_INT43_PEND&(0x1<<2)) {//判断具体信号产生
		uprintf("key1 ---------------\n");
		EXT_INT43_PEND |= 0x1<<2; //清除pending
	}
}

void eint_init(void)
{
	//IO 设置
	GPX3CON |= 0XF<<8;
	EXT_INT43CON &= ~(0x7<<8);
	EXT_INT43CON |= 0x2<<8; //设置下降沿触发
	EXT_INT43_FLTCON0 |= 0x3<<22;
	EXT_INT43_MASK &= ~(0x1<<2); //使能GPX[2]
	request_irq(64, 0x12, do_eint);
}


