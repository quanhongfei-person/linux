/*
 * wdt.c
 *
 *  Created on: Aug 26, 2018
 *      Author: linux
 */

#include <wdt.h>

void wdt_init(void)
{
	AUTOMATIC_WDT_RESET_DISABLE = 0X0;
	MASK_WDT_RESET_REQUEST = 0;
	WTCNT = 3052*3; //设置等待时间
	WTCON = (0xff<<8)|(0x3<<3)|(0x1<<5)|(0x1);//使能看门狗复位信号， 减法计数器频率 100MHZ/256/128 = 3051.7
}

void do_wdt(void)
{
	WTCLRINT = 0x1;//清除中断
	uprintf("this is wdt !!!\n");
}

void wdt_timer(void)
{
	WTDAT = WTCNT = 3052*3; //设置等待时间
	WTCON = (0xff<<8)|(0x3<<3)|(0x1<<5)|(0x1<<2);//使能看门狗中断信号， 减法计数器频率 100MHZ/256/128 = 3051.7
	request_irq(75, 0x13, do_wdt);
}


