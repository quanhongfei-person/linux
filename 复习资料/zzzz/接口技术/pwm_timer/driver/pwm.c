/*
 * pwm.c
 *
 *  Created on: Aug 24, 2018
 *      Author: linux
 */
#include <beep.h>
#include <pwm.h>
void pwm0_init(void)
{
	//io
	GPD0CON &= ~0xf;
	GPD0CON |= 0X2; //设置引脚为pwm功能
	//1K  50%  pwm默认频率100MHZ
	TCFG0 &= ~0xff;
	TCFG0 |= 49;
	TCFG1 &= ~0xf;
	TCFG1 |= 1; //设置速率  100MHZ/(49+1)/2 = 1MHZ
	TCNTB0 = 1000; //
	TCMPB0 = TCNTB0>>1;
	TCON |= 0x1<<1;  //实时更新TCNTB0 TCMPB0到减法计数器
	TCON &= ~0X2;
	TCON |= (0X1)|(0X1<<3);//使能pwm电路（开始减）， 减为0时自动加载
}

void do_timer(void)
{
	int num;
	num = ICCIAR_CPUn & 0x3ff; //读取完成传递的中断信号编号， gic会自动将完成传递的中断编号记录
	ICCEOIR_CPUn = num; //从激活队列清除num编号的中断
	uprintf("irqnum = %d\n", num);
	TINT_CSTAT |= 0x1<<5;//清除中断标志
	uprintf("this is timer0!!!\n");
}

void timer_init(void)
{
	TCFG0 &= ~0xff;
	TCFG0 |= 49;
	TCFG1 &= ~0xf;
	TCFG1 |= 1; //设置速率  100MHZ/(49+1)/2 = 1MHZ
	TCNTB0 = 2000000; //2秒定时
	TCON |= 0x1<<1;  //实时更新TCNTB0 TCMPB0到减法计数器
	TCON &= ~0X2;
	TINT_CSTAT |= 0x1; //使能定时器0
	TCON |= (0X1)|(0X1<<3);//使能pwm电路（开始减）， 减为0时自动加载
#define TIMER0 69
	ICDDCR = 0x1;  //使能GIC
	ICCICR_CPUn = 0x1; // 使能cpu0控制接口
	ICCPMR_CPUn = 0xff; // 设置cpu0的优先级mask为0xff
	ICDISER2_CPU0 |= 0x1<<5; //设置cpu0控制接口 69号中断使能
	ICDIPR_CPU &= ~(0xff<<8);
	ICDIPR_CPU |= 0x1<<8;  //设置cpu0控制接口 69号中断的优先级
	ICDIPTR_CPU &= ~(0xff<<8);
	ICDIPTR_CPU |= 0x1<<8; //设置cpu0控制接口 69号中断发送给cpu0

}
