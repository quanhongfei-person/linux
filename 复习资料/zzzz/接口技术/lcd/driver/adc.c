/*
 * adc.c
 *
 *  Created on: Jul 31, 2018
 *      Author: linux
 */

#include <adc.h>

void do_adc(void)  //adc转换完成才会执行
{
	int value;
	if (ISTR2 & (0x1<<19))
	{
		CLRINTADC = 1;
		value = ADCDAT & 0xfff;
		uprintf("value = %d\n", value);
	}
}

void adc_init(void)
{
	ADCCON = (0x1<<16)|(0x1<<14)|(132<<6);//设置12位模式，使能分频，分频值为132  start模式
	IESR2 |= 0x1<<19;  //使能adc中断
	request_irq(42, 0x4, do_adc);
}

void mode_read(void)
{
	ADCCON = (0x1<<16)|(0x1<<14)|(132<<6)|(0x1<<1);//设置12位模式，使能分频，分频值为132  read模式
}

void start(void)
{
	ADCCON |= 0x1;  //start信号
}

void read_start(void)
{
	int value;
	value = ADCDAT & 0xfff;
}

void read_value(void)
{
	int value;
	while(!(ADCCON&(0x1<<15))); //阻塞等待ad转换完毕
	value = ADCDAT & 0xfff;
	uprintf("value = %d\n", value);
}


