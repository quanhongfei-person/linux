#include <key.h>
#include <pwm0.h>
#include <wdt.h>

extern int num;
void delay(int count)
{
	while (count--);
}

void do_svc(void)
{
	uprintf("this is svc !!!!\n");
}



char sou[100] = "nihao";
char cmd[100];
extern int x, y;
void main(void)
{
	char data[5] = {0};
	uart_init();
	gic_init();
	lcd_init();
	display(0xff0000);
}
