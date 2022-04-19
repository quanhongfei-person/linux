/*
 * adc.c
 *
 *  Created on: Aug 27, 2018
 *      Author: linux
 */
#include <adc.h>

void do_adc(void)
{
	int adc;
	if (ISTR2 & 0x1<<19) {//判断adc中断标志
		CLRINTADC = 0x1; //清除中断
		adc = ADCDAT&0xfff;
		uprintf("adc = %d\n", adc);
	}
}

void adc_init(void)
{
	ADCMUX = 0;
	ADCCON = (0x1<<16)|(1<<14)|(132<<6)|(0x2);//设置12位  使能分频  读转换模式
}
void adc_start_init(void)
{
	ADCMUX = 0;
	ADCCON = (0x1<<16)|(1<<14)|(132<<6);//设置12位  使能分频  start转换模式
	IESR2 |= 0x1<<19;//使能adc中断
	request_irq(42, 0x23, do_adc);
}

void read_start(void)
{
	int adc;
	adc = ADCDAT;  //第一次读取
}

void start(void)
{
	ADCCON |= 0X1;  //发出start信号
}

void read_data(void)
{
	int adc;
	while(!(ADCCON & (0X1<<15))); //阻塞等待转换结束
	adc = ADCDAT&0xfff;
	uprintf("adc = %d\n", adc);
}
