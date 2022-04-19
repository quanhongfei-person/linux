#define GPX3CON *(unsigned int *)0x11000c60
#define GPX3DAT *(unsigned int *)0x11000c64

void key_init(void)
{
	GPX3CON &= ~(0XF<<8);//设置GPX3[2]引脚作用为输入状态
}

int key_stat()
{
	if (GPX3DAT & (0X1<<2))
		return 0;
	
}
