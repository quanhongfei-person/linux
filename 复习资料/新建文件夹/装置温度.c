#include<reg52.h>
#define uint unsigned int
#define uchar unsigned char

sbit  lcdrs=P2^7;//数据命令端口
sbit  lcdrw=P2^6;//读写端口.我们在这里只写/
sbit  lcden=P2^5;//使能端口。
sbit DQ=P1^1;//ds18b20 端口
sbit K1=P2^2;//按键控制报警阈值，高低温阈值的加减 高温阀值加
sbit K2=P2^1;//高温阀值减
sbit K3=P2^4;//低温阀值加
sbit K4=P2^3;//低温阀值减
sbit beep=P2^0;
int H_WD=45,L_WD=25,flag=1;
uint temp,Temp_H,Temp_L;
uchar code table1[]="              ";
uchar code table2[]="              ";
void delay(uint z)
{
	uint x,y;
	for(x=0;x<z;x++)
	for(y=0;y<110;y++);
}
void delay1(unsigned int i)//延时函数
{
	while(i--);
}
void Init_DS18B20(void)
{
	unsigned char x=0;
	DQ = 1;    //DQ复位
	delay1(8);  //稍做延时
	DQ = 0;    //单片机将DQ拉低
	delay1(80); //精确延时 大于 480us
	DQ = 1;    //拉高总线
	delay1(10);
	x=DQ;      //稍做延时后 如果x=0则初始化成功 x=1则初始化失败
	delay(5);
}
/***************************************************************/
/*                    读一个字节                               */
/***************************************************************/
unsigned char ReadOneChar(void)
{
	unsigned char i=0;
	unsigned char dat = 0;
	for (i=8;i>0;i--)
	{
		DQ = 0; // 给脉冲信号
		dat>>=1;
		DQ = 1; // 给脉冲信号
		if(DQ)
		dat|=0x80;
		delay1(5);
	}
	return(dat);
}
/***************************************************************/
/*                写一个字节                                   */
/***************************************************************/
void WriteOneChar(unsigned char dat)
{
	unsigned char i=0;
	for (i=8; i>0; i--)
	{
		DQ = 0;
		DQ = dat&0x01;
		delay1(5);
		DQ = 1;
		dat>>=1;
	}
	delay1(5);
}
/***************************************************************/
/*                  读取温度                                   */
/***************************************************************/
unsigned int ReadTemperature(void)
{
	unsigned char a=0;
	unsigned int b=0;
	unsigned int t=0;
	Init_DS18B20();
	WriteOneChar(0xCC); // 跳过读序号列号的操作
	WriteOneChar(0x44); // 启动温度转换
	delay1(200);
	Init_DS18B20();
	WriteOneChar(0xCC); //跳过读序号列号的操作
	WriteOneChar(0xBE); //读取温度寄存器等（共可读9个寄存器） 前两个就是温度
	a=ReadOneChar();  //低位
	b=ReadOneChar();  //高位
	b<<=8;	
	t=a+b;
	return(t);
}
void write_com(uchar com)
{
	lcdrs=0;                //写指令时RS=L
	lcden=0;             
	P0=com;                  //给端口送指令
	delay(5);              //延时5MS 
	lcden=1;              //使能端高电平有效 
	delay(5);
	lcden=0;
}
void write_date(uchar date)
{
	lcdrs=1;                //写数据时RS=L
	lcden=0;             
	P0=date;                  //给端口送数据
	delay(5);              //延时5MS 
	lcden=1;              //使能端高电平有效 
	delay(5);
	lcden=0;
}
void init()
{
	
	uchar num;
	lcdrw=0;//写信号拉低
	lcden=0;//使能端拉低
	write_com(0x38);          //开显示
	write_com(0x0c);        //0e开显示不显示光标
	write_com(0x06);        //每写一个地址和光标加一 
	write_com(0x01);          //显示清零
	write_com(0x80);        //第一行的初始地址为0x80
	for(num=0;num<14;num++)//循环的数字要看上面的占多少个字符
	{
		write_date(table1[num]);//多了和少了都不会对的。
		delay(5);
	}
	write_com(0x80+0x40);  //第二行初始地址为0x80+0x40
	for(num=0;num<14;num++)
	{
		write_date(table2[num]);
		delay(5);
	}
}
void keyscan()
{
	if(K1==0)
	{
		delay(20);
		if(K1==0)
		{
			H_WD++;
			while(!K1);
		}
	}
	if(K2==0)
	{
		delay(20);
		if(K2==0)
		{
			H_WD--;
			while(!K2);
		}
	}
	if(K3==0)
	{
		delay(20);
		if(K3==0)
		{
			L_WD++;
			while(!K3);
		}
	}
	if(K4==0)
	{
		delay(20);
		if(K4==0)
		{
			L_WD--;
			while(!K4);
		}
	}
}
void main()
{
	init();
	beep=1;
	while(1)
	{
		temp=ReadTemperature();//温度读取
		if(temp&0x8000)//判断
		{
			flag=0;//负号标志
			temp=~temp;  // 取反加1
			temp +=1;
		}
		else
		{
			temp=temp;
			flag=1;//温度为正标志位1
		}
		Temp_H=temp>>4;//温度高4位
		write_com(0x80+0x40);
		if(flag==0)
		{
			write_date(0xB0);
		}//负号标志
		else
		{
			write_date(0x20+11);	
		}//正号标志.
		write_com(0x80+0x41);
		write_date(0x30+Temp_H/10);//显示温度的十位
		write_date(0x30+Temp_H%10);//显示温度的各位
		Temp_L=temp&0x0F;
		Temp_L=Temp_L*6;//小数近似处理
		write_com(0x80+0x43);
		write_date(0x2e);//显示小数点
		write_date(0x30+Temp_L/10);//显示温度的小数
		write_date(0x40+3);
		keyscan();//按键扫描
		if((Temp_H*10+Temp_L/10)>(H_WD*10)&&(flag==1)||(Temp_H*10+Temp_L/10)<(L_WD*10)&&(flag==1))//温度判断
		{
			beep=0;
			delay(500);
		}
		else
		{
			beep=1;//蜂鸣器不报警
		}
		write_com(0x80+10);//高上线
		write_date(0x30+H_WD/10);
		write_date(0x30+H_WD%10);
		write_date(0x40+3);
		write_com(0x80+0x40+10);//低下线
		write_date(0x30+L_WD/10);
		write_date(0x30+L_WD%10);
		write_date(0x40+3);   
	}
}