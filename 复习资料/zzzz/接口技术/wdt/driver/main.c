/*
 * main.c
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */
#include <uart.h>
#include <wdt.h>
void delay(int count)
{
	while (count--);
}

void do_svc(void)
{
	uprintf("this is svc!!!\n");
}

int num;
void main(void)
{

	uart_init();
	 gic_init();


	wdt_timer();


}

