#define GPM4CON *(unsigned int *)0x110002e0
#define GPM4DAT *(unsigned int *)0x110002e4

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

void delay(int count)
{
	while (count--);
}

int main(int num)
{
	led_init();
	while(1) {
		led_on();
		delay(0x2fffff);
		led_off();
		delay(0x2fffff);
	}

	return 0;
}
