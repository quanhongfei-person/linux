/*
 * main.c
 *
 *  Created on: Aug 22, 2018
 *      Author: linux
 */

void delay(int count)
{
	while (count--);
}

void main(void)
{

	led_init();
	while (1) {
		led_off();
		delay(0x2fffff);
		led_on();
		delay(0x2fffff);
	}
}



