/*
 * iic.c
 *
 *  Created on: Aug 27, 2018
 *      Author: linux
 */

#include <iic.h>

void iic_init(void)
{
	//io
	GPD1CON &= ~0xff;
	GPD1CON |= 0x22;//设置GPD1[0]  GPD1[1]  为iic功能
	I2CCONn = (0x1<<7)|(0x1<<5)|(0x1<<6);  //使能ACK 使能中断 设置时钟为： 100MHZ/512/1
	I2CSTATn = 0x1<<4; //使能收发
}

void clear_pending(void) //下次操作开始
{
	I2CCONn &= ~(0x1<<4);
}

int wait_pend(void)  //上次操作结束
{
	int num = 0xffff;
	while (num--) {
		if (I2CCONn & 0x1<<4)
			return 0;
	}
	return -1;
}

void stop(void)
{
	int num = 0x1000;
	I2CSTATn = 0XD0; //4412以主机发送模式发送stop信号
	clear_pending();
	while(num--);
}

int  iic_write(unsigned char addr,  char data_addr, char data)
{
	char addr_data[2];
	addr_data[0] = data_addr;
	addr_data[1] = data;
	int ret = -1;
	I2CDSn = addr<<1;//将从机地址+写标志写入缓存区
	I2CSTATn = 0xf0;//4412以主机发送模式发送start信号
	clear_pending(); //开始发送
	if (wait_pend() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	int i;
	for (i = 0; i < sizeof(addr_data); i++) {
		I2CDSn = addr_data[i];
		clear_pending(); //开始发送
		if (wait_pend() < 0) {//等待数据发送完毕
			stop();
			return ret;
		}
		if (I2CSTATn & 0x1) {  //判断ack
			stop();
			return ret;
		}
	}

	ret = 0;
	stop();

	return ret;
}




int  iic_read(unsigned char addr,  char data_addr, char *data)
{
	int ret = -1;

	I2CDSn = addr<<1;//将从机地址+写标志写入缓存区
	I2CSTATn = 0xf0;//4412以主机发送模式发送start信号
	clear_pending(); //开始发送
	if (wait_pend() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	I2CDSn = data_addr;//从机寄存器地址
	clear_pending(); //开始发送
	if (wait_pend() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	//以上是定位过程
	I2CDSn = (addr<<1)|1;//从机地址+读标志
	I2CSTATn = 0xb0;//4412以主机模式发送start信号
	clear_pending(); //开始发送
	if (wait_pend() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}

	///开始接收数据
	clear_pending(); //开始接收
	if (wait_pend() < 0) { //接收完毕
		stop();
		return ret;
	}
	*data = I2CDSn; //读取数据

	ret =  0;
	stop();
	return ret;
}
