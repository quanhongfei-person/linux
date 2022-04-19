/*
 * lcd.c
 *
 *  Created on: Aug 2, 2018
 *      Author: linux
 */

#include <lcd.h>

void draw_point(int x, int y, int col)
{
	*((unsigned int *)FRAMEBUFFER+y*800+x) = col;
}

void display(int col)
{
	int x, y;
	for (y = 0; y < 480; y++) {
		for (x = 0; x < 800; x++) {
			draw_point(x, y, col);
		}
	}
}

void lcd_init(void)
{
	//io   设置引脚权限
	GPF0CON = 0x22222222;
	GPF1CON = 0x22222222;
	GPF2CON = 0x22222222;
	GPF3CON &= ~0xffff;
	GPF3CON |= 0x2222;
	VIDCON0 = (2<<6)|(0x3);//设置RGB（TTL）接口， 分频值 2 目标频率：33.3mhz  使能数据输出
	VIDCON1 = (0x1<<9)|(0x1<<7)|(0x1<<6)|(0x1<<5);  //使能时钟 上升沿发送数据 行场同步反转
	VIDTCON0 = (22<<16)|(21<<8)|(9);//设置帧同步时间
	VIDTCON1 = (45<<16)|(209<<8)|(19);//设置行同步时间
	VIDTCON2 = (479<<16)|(799);  //分辨率
	//lcd初始化
	//win设置
	WINCON0 = (1<<15)|(0xb<<2)|(0x1); //使能字交互，  RGB888  使能win0 输出
	SHADOWCON |= 0x1;  //使能通道0
	VIDOSD0A  = 0;//设置左上角坐标
	VIDOSD0B = (799<<11)|(479);//设置右下角坐标
	VIDOSD0C = 800*480; //win大小设置（内存大小）
	VIDW00ADD0B0 = FRAMEBUFFER;//显存起点
	VIDW00ADD1B0 =  VIDW00ADD0B0+ VIDOSD0C*4; //显存终点
}


