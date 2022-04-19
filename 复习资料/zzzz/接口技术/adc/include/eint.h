/*
 * eint.h
 *
 *  Created on: Aug 26, 2018
 *      Author: linux
 */

#ifndef EINT_H_
#define EINT_H_

#define GPX3CON *(unsigned int *)0x11000c60
#define EXT_INT43CON *(unsigned int *)0x11000e0c
#define EXT_INT43_FLTCON0 *(unsigned int *)0x11000e98
#define EXT_INT43_MASK *(unsigned int *)0x11000f0c
#define EXT_INT43_PEND  *(unsigned int *)0x11000f4c
extern void do_eint(void);
extern void eint_init(void);

#endif /* EINT_H_ */
