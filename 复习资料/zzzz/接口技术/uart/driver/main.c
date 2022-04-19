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

int num;
void main(void)
{
	char c = 'a';

	uart_init();
	beep_init();
	uprintf("a value is  %c   num = %d\n", c, num);
	uprintf("a value is  %c   num = %d\n", c, num);
}



