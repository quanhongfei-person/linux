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
	pwm0_init();
	__asm__ (
	"mov r0, %[num1]\n" // %1表示num
	"mov %[re], r0\n"  //%0表示ret
	:[re]"=&r"(ret),[re1]"+&r"(ret1)    //
	:[num1]"r"(num)
	:"r0"
	);
	uprintf("ret = %d\n", ret);
}



