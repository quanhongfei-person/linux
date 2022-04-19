/*
 * wdt.c
 *
 *  Created on: Jul 30, 2018
 *      Author: linux
 */


#include <wdt.h>
int num;
void wdt_init(void)
{
	//3S
	AUTOMATIC_WDT_RESET_DISABLE = 0;
	MASK_WDT_RESET_REQUEST = 0;
	WTCNT = 3052*3;
	WTCON = (0xff<<8)|(0x3<<3)|(0x1<<5)|(0x1); //设置分频系数 100mhz/256/128   使能wdt  使能复位
}

void do_wdt(void)
{
	WTCLRINT = 1;
	uprintf("this is wdt timer!!!!\n");
}

void wdt_timer(void)
{
	//3S
	WTDAT = 3052*1;
	WTCNT = 3052*1;
	WTCON = (0xff<<8)|(0x3<<3)|(0x1<<5)|(0x1<<2); //设置分频系数 100mhz/256/128   使能wdt  使能中断
#define WDT 75
	request_irq(75, 0x3, do_wdt);
}
