/*
 * key.c
 *
 *  Created on: Jul 25, 2018
 *      Author: linux
 */
#include <key.h>
void key_init(void)
{
	GPX3CON &= ~(0xf<<8);//设置引脚作用，输入状态
}



