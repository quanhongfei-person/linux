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



	uart_init();
	pwm0_init();
	__asm__ (
	"svc #12\n"
	);
}



