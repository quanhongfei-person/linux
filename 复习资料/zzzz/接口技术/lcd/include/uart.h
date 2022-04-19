/*
 * uart.h
 *
 *  Created on: Jul 27, 2018
 *      Author: linux
 */

#ifndef UART_H_
#define UART_H_
#define GPA0CON *(unsigned int *)0x11400000
#define ULCONn *(unsigned int *)0x13800000
#define UCONn *(unsigned int *)0x13800004
#define UFRACVALn *(unsigned int *)0x1380002c
#define UBRDIVn *(unsigned int *)0x13800028
#define UTXHn *(unsigned int *)0x13800020
#define URXHn *(unsigned int *)0x13800024
#define UTRSTATn *(unsigned int *)0x13800010
extern void uart_init(void);


extern void puts_(char * info);
extern void gets_(char *cmd);


#endif /* UART_H_ */
