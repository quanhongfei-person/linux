/*
 * uart.c
 *
 *  Created on: Aug 23, 2018
 *      Author: linux
 */
#include <uart.h>

void uart_init(void)
{
	//IO设置
	GPA0CON &= ~0XFF;
	GPA0CON |= 0x22;  // 设置GPA0[0]  gpa0[1]为uart功能
	//115200 8n1
	ULCONn = 0x3;//设置8N1
	UCONn = 0x5;  //设置轮循和中断模式
	UBRDIVn = 53;
	UFRACVALn = 4; //115200
}

void uart_send(char s)
{
	while (!(UTRSTATn & 0x2)); //阻塞等待数据发送完毕
		UTXHn = s;
	if ('\n' == s)
		uart_send('\r');
}


void puts_(char *buff)
{
	while ('\0' != *buff) {
		uart_send(*buff);
		buff++;
	}
}

char uart_rev(void)
{
	char c;
	while (!(UTRSTATn & 0x1)); //阻塞等待数据接收完毕
	c = URXHn;
	uart_send(c);
	return c;
}

