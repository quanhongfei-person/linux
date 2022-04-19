/*
 * iic.c
 *
 *  Created on: Aug 1, 2018
 *      Author: linux
 */
#include <iic.h>
void iic_init(void)
{
	//io
	GPD1CON |= 0x22<<8;
	I2CCONn = (0x1<<7)|(0x1<<5)|(0x1<<6); //使能ACK，使能中断/设置时钟为100000000/512
	I2CSTATn = 0x1<<4;
}

void clear(void)//下次操作开始
{
	I2CCONn &= ~(0x1<<4);//清除中断pending
}

int wait_pending() //等待上次操作结束
{
	int count = 0x10000;
	while (count--) {
		if (I2CCONn & 0x1<<4)  //中断置位
			return 0;
	}

	return -1;
}

void stop()
{
	int num = 1000;
	I2CSTATn = 0xd0; ////4412以主机发送模式发出stop信号
	clear();
	while (num--);
}

static int send_byte(char data)
{
	int ret = -1;
	I2CDSn = data;
	clear(); //开始发送
	if (wait_pending() < 0) { //判断发送是否成功
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) { //判断收否接收到ACK
		stop();
		return ret;
	}
	ret = 0;
	return ret;
}

static int recv_byte(char *data)
{
	int ret = -1;
	clear(); //开始接收
	if (wait_pending() < 0) { //判断接收是否成功
		stop();
		return ret;
	}
	*data = I2CDSn;
	ret = 0;
	return ret;
}

int read_data(unsigned char slave, unsigned char reg_addr, char *data)
{
	int ret = -1;

	I2CDSn = slave<<1; //从机地址+写标志
	I2CSTATn = 0xf0;//4412以主机发送模式发出start信号
	clear();
	if (wait_pending() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	if (send_byte(reg_addr) < 0) {
		stop();
		return ret;
	}
	stop();
	/************定位过程***********/
	I2CDSn = (slave<<1)|(0x1); //从机地址+读标志
	I2CSTATn = 0xb0;//4412以主机发送模式发出start信号
	clear();
	if (wait_pending() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}

	if (recv_byte(data) < 0) {
		stop();
		return ret;
	}

	ret = 0;
	return ret;
}


int read_data_num(unsigned char slave, unsigned char reg_addr, char *data, int num)
{
	int ret = -1;

	I2CDSn = slave<<1; //从机地址+写标志
	I2CSTATn = 0xf0;//4412以主机发送模式发出start信号
	clear();
	if (wait_pending() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	if (send_byte(reg_addr) < 0) {
		stop();
		return ret;
	}
	stop();
	/************定位过程***********/
	I2CDSn = (slave<<1)|(0x1); //从机地址+读标志
	I2CSTATn = 0xb0;//4412以主机发送模式发出start信号
	clear();
	if (wait_pending() < 0) {
		stop();
		return ret;
	}
	if (I2CSTATn & 0x1) {
		stop();
		return ret;
	}
	int i;
	for (i = 0; i < num; i++) {
		if (recv_byte(&data[i]) < 0) {
			stop();
			return ret;
		}
	}

	ret = 0;
	return ret;
}

