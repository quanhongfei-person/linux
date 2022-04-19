/*
 * irq.c
 *
 *  Created on: Jul 29, 2018
 *      Author: linux
 */

#include <irq.h>

irq_handler_t irq_handler[160];   //定义函数指针数组



void do_irq(void)
{
	irq_handler_t handler;
	int num = ICCIAR_CPUn&0x3ff; //读取完成传递的中断编号（gic会将完成传递的中断标号保存）
	ICCEOIR_CPUn = num;  //从激活队列清除制定编号中断
	uprintf("irq num = %d\n", num);
	handler = irq_handler[num];
	handler();  //函数执行
}

void gic_init(void)
{
	ICDDCR = 0x1; //gic时能
	ICCICR_CPUn = 0x1;  //cpu0控制接口时能
	ICCPMR_CPUn = 0XFF;  //设置cpu0接口的优先级mask
}

void request_irq(int irqnum, unsigned char lev, void (*do_is)(void))
{
	*(ICDISER_CPU+irqnum/32) |= 0x1<< (irqnum%32); //设置irqnum编号中断使能
	*(ICDIPR_CPU+irqnum/4) &= ~(0xff<<((irqnum%4)*8));//设置irqnum编号中断优先级
	*(ICDIPR_CPU+irqnum/4) |= (lev<<((irqnum%4)*8));//设置irqnum编号中断优先级
	*(ICDIPTR_CPU+irqnum/4) &= ~(0xff<<((irqnum%4)*8));
	*(ICDIPTR_CPU+irqnum/4) |= (0x1<<((irqnum%4)*8));////设置irqnum编号中断目标处理器
	irq_handler[irqnum] = do_is;   //注册中断处理函数
}
