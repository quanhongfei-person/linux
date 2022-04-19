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
	pwm0_init();
}



