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
	char data = 0;
	uart_init();
	iic_init();
	while (iic_write(0x50, 0x1, 0x12) < 0 );
	while (iic_read(0x50, 0x1, &data) < 0 );
	uprintf("data = 0x%x\n", data);
}

