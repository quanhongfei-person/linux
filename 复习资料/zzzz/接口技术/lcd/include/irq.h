/*
 * irq.h
 *
 *  Created on: Jul 29, 2018
 *      Author: linux
 */

#ifndef IRQ_H_
#define IRQ_H_

#define ICCIAR_CPUn *((unsigned int *)0x1048000c)
#define ICCEOIR_CPUn *((unsigned int *)0x10480010)
#define ICCICR_CPUn  *((unsigned int *)0x10480000)
#define ICDDCR  *((unsigned int *)0x10490000)
#define ICCPMR_CPUn *((unsigned int *)0x10480004)

#define ICDISER_CPU  ((unsigned int *)0x10490100)
#define ICDIPR_CPU  ((unsigned int *)0x10490400)
#define ICDIPTR_CPU ((unsigned int *)0x10490800)
 typedef void (*irq_handler_t)(void);//定义函数指针类型
 extern void gic_init(void);
 extern void request_irq(int irqnum, unsigned char lev, void (*do_is)(void));
 extern void do_irq(void);


#endif /* IRQ_H_ */
