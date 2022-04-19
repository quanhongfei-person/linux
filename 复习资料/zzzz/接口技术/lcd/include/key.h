/*
 * ley.h
 *
 *  Created on: Jul 25, 2018
 *      Author: linux
 */

#ifndef LEY_H_
#define LEY_H_

#define GPX3CON *((unsigned int *)0x11000c60)
#define GPX3DAT *((unsigned int *)0x11000c64)
extern void key_init(void);

#endif /* LEY_H_ */
