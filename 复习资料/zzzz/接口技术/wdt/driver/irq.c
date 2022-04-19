/*
 * irq.c
 *
 *  Created on: Aug 26, 2018
 *      Author: linux
 */
#include<irq.h>
irq_handler_t irq_handler[160];
void do_irq(void)
{
	irq_handler_t handler;
	int num;
	num = ICCIAR_CPUn & 0x3ff; //读取完成传递的中断信号编号， gic会自动将完成传递的中断编号记录
	ICCEOIR_CPUn = num; //从激活队列清除num编号的中断
	uprintf("irqnum = %d\n", num);
	handler = irq_handler[num];
	handler();// 函数调用
}


void gic_init(void)
{
	ICDDCR = 0x1;  //使能GIC
	ICCICR_CPUn = 0x1; // 使能cpu0控制接口
	ICCPMR_CPUn = 0xff; // 设置cpu0的优先级mask为0xff
}

void request_irq(int irqnum, char lev, void (*do_is)(void))
{
	*(ICDISER2_CPU0+irqnum/32) |= 0x1<<(irqnum%32);  //完成cpu0控制接口 irqnum编号中断使能
	*(ICDIPR_CPU+irqnum/4) &= ~(0xff<<((irqnum%4)*8));
	*(ICDIPR_CPU+irqnum/4) |= (lev<<((irqnum%4)*8));//完成cpu0控制接口 irqnum编号中断优先级设置
	*(ICDIPTR_CPU+irqnum/4) &= ~(0xff<<((irqnum%4)*8));
	*(ICDIPTR_CPU+irqnum/4) |= (0x1<<((irqnum%4)*8));//完成cpu0控制接口 irqnum编号中断目标处理器
	irq_handler[irqnum] = do_is;
}

