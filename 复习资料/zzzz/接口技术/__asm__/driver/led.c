
#include <led.h>

void led_init()
{
	GPM4CON &= ~(0xf<<12);
	GPM4CON |= 0x1<<12;//设置引脚作用 GPM4[3]为输出
}

void led_on()
{	
	GPM4DAT &= ~(0x1<<3);//设置GPM4[3]引脚输出低电平
}

void led_off()
{
	GPM4DAT |= 0X1<<3;
}




