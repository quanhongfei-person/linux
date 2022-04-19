/*
 * uart.c
 *
 *  Created on: Jul 27, 2018
 *      Author: linux
 */

#include <uart.h>

void uart_init(void)
{
	//io
	GPA0CON |= 0x22; //设置引脚作用为uart
	ULCONn = 0x3;   //8n1设置
	UCONn = 0x5;  //使能电路工作，中断或轮循模式
	UFRACVALn = 4;  //115200s
	UBRDIVn = 53;
}

void put_char(char c)
{
	while (!(UTRSTATn & 0x1<<1));//阻塞等待，数据发送完毕
	UTXHn = c;
	if ('\n' == c)
		put_char('\r');
}

void puts_(char * info)
{
	while (*info != '\0') {
		put_char(*info);
		info++;
	}
	//send_byte('\n');
}

static char recv_byte(void)
{
	char s;
	while (!(UTRSTATn & 0x1));//阻塞等待，数据接收完毕
	s = URXHn;
	if ('\r' == s)
		s = '\n';
	put_char(s);
	return s;
}

void gets_(char *cmd)
{
	char s;
	while (1) {
		s = recv_byte();
		if ('\n' == s)
			break;
		*cmd = s;
		cmd++;
	}
	*cmd = '\0';
}
