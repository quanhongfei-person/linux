/*
 * eint.h
 *
 *  Created on: Jul 29, 2018
 *      Author: linux
 */

#ifndef EINT_H_
#define EINT_H_


#define GPX3CON *((unsigned int *)0x11000c60)
#define GPX3DAT *((unsigned int *)0x11000c64)
#define EXT_INT43CON *((unsigned int *)0x11000e0c)
#define EXT_INT43_FLTCON0 *((unsigned int *)0x11000e98)
#define EXT_INT43_MASK  *((unsigned int *)0x11000f0c)
#define EXT_INT43_PEND  *((unsigned int *)0x11000f4c)

extern void eint_init();
extern void do_eint26(void);

#endif /* EINT_H_ */
