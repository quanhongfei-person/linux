#define GPM4CON *(unsigned int *)0x110002e0
#define GPM4DAT *(unsigned int *)0x110002e4

#define GPD0CON *(unsigned int *)0x114000A0
#define GPD0DAT *(unsigned int *)0x114000A4
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

void beep_init()
{
	GPD0CON &= ~(0xf);
	GPD0CON |= 0x1;//设置引脚作用 GPD0[0]为输出
}

void beep_on()
{	
	GPD0DAT |= (0x1);//设置GPD0[0]引脚输出低电平
}

void beep_off()
{
	GPD0DAT &= ~0X1;
}
void delay(int count)
{
	while (count--);
}

int main(int num)
{
	led_init();
	beep_init();
	while(1) {
		led_on();
		beep_on();
		delay(0x2fffff);
		led_off();
		beep_off();
		delay(0x2fffff);
	}

	return 0;
}
