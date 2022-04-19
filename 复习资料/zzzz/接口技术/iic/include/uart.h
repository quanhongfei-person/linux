/*
 * uart.h
 *
 *  Created on: Aug 23, 2018
 *      Author: linux
 */

#ifndef UART_H_
#define UART_H_

#define GPA0CON *(unsigned int *)0x11400000
#define ULCONn *(unsigned int *)0x13800000
#define UBRDIVn *(unsigned int *)0x13800028
#define UFRACVALn *(unsigned int *)0x1380002c
#define UTXHn *(unsigned int *)0x13800020
#define URXHn *(unsigned int *)0x13800024
#define UTRSTATn *(unsigned int *)0x13800010
#define UCONn *(unsigned int *)0x13800004
extern void uart_init(void);
extern void uart_send(char s);
extern char uart_rev(void);



#endif /* UART_H_ */
