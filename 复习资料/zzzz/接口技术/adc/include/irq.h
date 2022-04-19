/*
 * irq.h
 *
 *  Created on: Aug 26, 2018
 *      Author: linux
 */

#ifndef IRQ_H_
#define IRQ_H_

typedef void (*irq_handler_t)(void );


#define ICDDCR *(unsigned int *)0x10490000
#define ICCICR_CPUn *(unsigned int *)0x10480000
#define ICCPMR_CPUn *(unsigned int *)0x10480004
#define ICDISER2_CPU0 (unsigned int *)0x10490100
#define ICDIPR_CPU (unsigned int *)0x10490400
#define ICDIPTR_CPU (unsigned int *)0x10490800
#define ICCIAR_CPUn  *(unsigned int *)0x1048000c
#define ICCEOIR_CPUn  *(unsigned int *)0x10480010


#endif /* IRQ_H_ */
