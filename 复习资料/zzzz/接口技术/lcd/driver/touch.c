/*
 * touch.c
 *
 *  Created on: Aug 1, 2018
 *      Author: linux
 */
#include <touch.h>
int x, y;
void do_touch(void)
{
	char data[5];
	EXT_INT41_PEND |= 0x1<<6;
	if (read_data_num(0x38, 0x2, data, 5) < 0)
		if (read_data_num(0x38, 0x2, data, 5) < 0)
			return ;
		int num = data[0]&0xf;

		if (num < 1 && num > 2)
			return;
		x = ((data[1]&0xf)<<8)|(data[2]);
		y = ((data[3]&0xf)<<8)|(data[4]);
		uprintf("x = %d   y = %d\n", x, y);
}

void touch_init(void)
{
	GPX1CON |= 0xf<<24;
	EXT_INT41CON &= ~(0xf<<24);
	EXT_INT41CON |= (0x2<<24);
	EXT_INT41_FLTCON1 |= 0x3<<22;
	EXT_INT41_MASK &= ~(0x1<<6);
	request_irq(62, 0x1, do_touch);
}



