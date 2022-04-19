/*
 * main.c
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */
#include <uart.h>
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
	char c = 'a';
	int num = 100;
	int ret = -1;
	int ret1;

	uart_init();
	timer_init();

	while(1);
}



