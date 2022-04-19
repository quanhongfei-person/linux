/*
 * pwm0.c
 *
 *  Created on: Jul 26, 2018
 *      Author: linux
 */
#include <pwm0.h>
#include <irq.h>



void do_timer2(void)
{

	TINT_CSTAT |= 0x1<<7; //清除中断标志
	uprintf("this is timer2 !!!\n");
}

int flag = 1;
void do_timer0(void)
{

	TINT_CSTAT |= 0x1<<5; //清除中断标志
	uprintf("this is timer0 !!!\n");
	if (flag) {
	led_on();
		flag = 0;
	}
	else {
		led_off();
		flag = 1;
	}
}

void pwm0_init(int count)
{
	//io

	//？？目标频率  占空比  1KHZ  50%
	//pwm的默认频率  100MHZ

	TCFG0 = 99;  // 100MHZ/（99+1）
	TCFG1 &= ~0xf; //设置二级分频值为1   1MHZ
	TCNTB0  = count; //被减值
	TCMPB0 = TCNTB0 >> 1;
	TCON = 0x1<<1;  //实时更新TCNTB0和TCMPB0到减法计数器
	TCON &= ~0X2;
	TCON |= (0X1<<3);

}

void pwm_enable()
{
	GPD0CON &= ~0xf;
	GPD0CON |= 0x2; //设置引脚作用为pwm功能
	TCON |= (0X1);
}

void pwm_disable()
{
	TCON &= ~(0X1);
	GPD0CON &= ~0xf;
}

void set_per(int count)
{
	TCNTB0  = count; //被减值
	TCMPB0 = TCNTB0 >> 1;
}



void timer0_init(int s)
{
	//pwm的默认频率  100MHZ

	TCFG0 |= 99;  // 100MHZ/（99+1）
	TCFG1 &= ~0xf; //设置二级分频值为1   1MHZ
	TCNTB0  = s*1000000; //被减值
	TCON |= 0x1<<1;  //实时更新TCNTB0和TCMPB0到减法计数器
	TCON &= ~0X2;
	TCON |= (0x1)|(0X1<<3);
	TINT_CSTAT |= 0x1;  //使能timer0中断
#define TIMER0 69

	request_irq(69, 0x12, do_timer0);
}

void timer2_init(int s)
{
	//pwm的默认频率  100MHZ

	TCFG0 |= 99<<8;  // 100MHZ/（99+1）
	TCFG1 &= ~(0xf<<8); //设置二级分频值为1   1MHZ
	TCNTB2  = s*1000000; //被减值
	TCON |= 0x1<<13;  //实时更新TCNTB2和TCMPB0到减法计数器
	TCON &= ~(0X1<<13);
	TCON |= (0x1<<12)|(0X1<<15);
	TINT_CSTAT |= 0x1<<2;  //使能timer2中断
#define TIMER2 71

	request_irq(71, 0x11, do_timer2);
}


