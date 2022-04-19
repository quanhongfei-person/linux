/*
 * wdt.h
 *
 *  Created on: Jul 30, 2018
 *      Author: linux
 */

#ifndef WDT_H_
#define WDT_H_

#define WTCON *((unsigned int *)0x10060000)
#define WTDAT *((unsigned int *)0x10060004)
#define WTCNT *((unsigned int *)0x10060008)
#define WTCLRINT *((unsigned int *)0x1006000c)
#define AUTOMATIC_WDT_RESET_DISABLE *((unsigned int *)0x10020408)
#define MASK_WDT_RESET_REQUEST *((unsigned int *)0x1002040c)



#endif /* WDT_H_ */
