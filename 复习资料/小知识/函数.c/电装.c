附录二：
#include<reg52.h>
#define uint unsigned int    //类型声明
#define uchar unsigned char

sbit  lcdrs=P2^7;		//数据命令端口                   
sbit  lcdrw=P2^6;		//读写端口.我们在这里只写
sbit  lcden=P2^5;		//使能端口
sbit  DQ=P1^1;			//ds18b20 端口   （单总线DQ）
sbit  beep=P2^0;
//按键控制报警阈值，高低温阈值的加减//
sbit  K1=P2^2;		//高温阀值加
sbit  K2=P2^1;		//高温阀值减
sbit  K3=P2^4;		//低温阀值加
sbit  K4=P2^3;		//低温阀值减

int H_WD=45,L_WD=25,flag=1;

uint temp,Temp_H,Temp_L;

uchar code table1[]="              ";  //code是关键字，代表table1[]数组中数据在程序存储区，使用DPTR寻址
uchar code table2[]="              ";

//-----延时函数ms------//
void delay(uint z)
{
	uint x,y;
	for(x=0;x<z;x++)
	{
		for(y=0;y<110;y++);
	}
	
}

//------延时函数------//
void delay1(unsigned int i)
{
	while(i--);
}

//------18B20初始化------//  DQ = 0 480~960us后释放，
void Init_DS18B20(void)
{
	unsigned char x=0;
	DQ = 1;    	     //DQ复位
	delay1(8); 		 //稍做延时
	DQ = 0;    		 //单片机将DQ拉低
	delay1(80);		 //精确延时 大于 480us  （480~960us）
	DQ = 1;   		 //拉高总线
	delay1(10);
	x=DQ;      		 //稍做延时后 如果x=0总线上无器件应答，则初始化成功 x=1则初始化失败
	delay(5);
}
/***************************************************************/
/*                  从ds18B20中读一个字节                      */
/***************************************************************/
unsigned char ReadOneChar(void)  //DQ从高拉低，
{
	unsigned char i=0;
	unsigned char dat = 0;
	for (i=8;i>0;i--)
	{
		DQ = 0; 		// 给脉冲信号
		dat>>=1;        //
		DQ = 1; 		// 给脉冲信号
		if(DQ)
		dat|=0x80;   //dat = dat | 0x80;
		delay1(5);
	}
	return(dat);
}
/***************************************************************/
/*               写一个字节到ds18B20中                         */
/***************************************************************/
void WriteOneChar(unsigned char dat)  //单片机将DQ从高拉低
{   								  //采样到高电平向ds18B20写1；
	unsigned char i=0;				  //采样到低电平向ds18B20写0；
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
	WriteOneChar(0xCC); 	//跳过读序号列号的操作（总线上只有一个DS18B20时使用）
	WriteOneChar(0x44); 	//启动温度转换
	delay1(200);
	Init_DS18B20();
	WriteOneChar(0xCC); 	//跳过读序号列号的操作
	WriteOneChar(0xBE); 	//读取温度寄存器等（共可读9个寄存器） 前两个就是温度（读取暂存器中温度数据）
	a=ReadOneChar();  		//低位
	b=ReadOneChar();  		//高位
	b<<=8;      //1000 0000 0000 0000
	t=a+b;
	return(t);
}

//-----写命令------//   RS = L, RW = L,EN = H,P0 = com;
void write_com(uchar com)
{
	lcdrs=0;                //写指令时RS=L
	lcden=0;             
	P0=com;                 //给端口送指令
	delay(5);              	//延时5MS 
	lcden=1;              	//使能端高电平有效 
	delay(5);
	lcden=0;
}
//------写数据-------//   RS =H, RW =L,EN = H,P0 = data;
void write_date(uchar date)
{
	lcdrs=1;               	 //写数据时RS=L
	lcden=0;             
	P0=date;                 //给端口送数据
	delay(5);              	 //延时5MS 
	lcden=1;              	 //使能端高电平有效 
	delay(5);
	lcden=0;
}


void init() // 一般步骤：0x38H-0x0CH-0x06H-0x01H-0x08H（显示关闭）
{	
	uchar num;
	lcdrw=0;			//写信号拉低
	lcden=0;			//使能端拉低
	write_com(0x38);    //开显示
	write_com(0x0c);    //0c开显示不显示光标
	write_com(0x06);    //每写一个地址和光标加一 
	write_com(0x01);    //显示清零
	write_com(0x80);    //第一行的初始地址为0x80
	for(num=0;num<14;num++)   //循环的数字要看上面的占多少个字符
	{
		write_date(table1[num]);   //多了和少了都不会对的
		delay(5);
	}
	write_com(0x80+0x40);     //第二行初始地址为0x80+0x40
	for(num=0;num<14;num++)
	{
		write_date(table2[num]);
		delay(5);
	}
}


//按键控制报警阈值，高低温阈值的加减//
/*
sbit  K1=P2^2;		//高温阀值加
sbit  K2=P2^1;		//高温阀值减
sbit  K3=P2^4;		//低温阀值加
sbit  K4=P2^3;		//低温阀值减  */


//-------独立按钮--------//
void keyscan()
{
	if(K1 == 0)         //采用轮询的方式，未开中断     // K1(1) == 0  , 4 == 5
	{
		delay(20);    //消抖
		if(K1==0)     //按下为0，
		{
			H_WD++;         //报警温度上线+
			while(!K1);     //while出去的是松开按键时 K1 = 1;
		}
	}
	if(K2==0)
	{
		delay(20);
		if(K2==0)
		{
			H_WD--;          //报警温度上线-
			while(!K2);
		}
	}
	if(K3==0)
	{
		delay(20);
		if(K3==0)
		{
			L_WD++;          //报警温度下线+
			while(!K3);
		}
	}
	if(K4==0)
	{
		delay(20);
		if(K4==0)
		{
			L_WD--;          //报警温度下线-
			while(!K4);
		}
	}
}

//------主函数-------//
void main()
{
	init();     //LCD初始化
	beep=1;     
	while(1)    //while()大循环防止程序结束，卡程序
	{
		temp=ReadTemperature();  //温度读取16位二进制数
		if(temp&0x8000)   //判断符号标志位 1000 0000 0000 0000
		{
			flag=0;     //负号标志
			temp=~temp;   // 取反加1
			temp +=1;
		}
		else
		{
			temp=temp;
			flag=1;       //温度为正标志位1
		}
		Temp_H=temp>>4;     //温度高4位
		write_com(0x80+0x40);
		if(flag==0)  //负号标志
		{
			write_date(0xB0);    //1011 0000(-)
		}
		else        //正号标志
		{
			write_date(0x20+11); //0010 1011(+)
		}
		write_com(0x80+0x41);        //指针定位在DDRAM的0x41处
		write_date(0x30+Temp_H/10);  //显示温度的十位     //45
		write_date(0x30+Temp_H%10);  //显示温度的个位
		Temp_L=temp&0x0F;            //0100 0101  & 0000 1111
		Temp_L=Temp_L*16;             //小数近似处理
		write_com(0x80+0x43);
		write_date(0x2e);            //显示小数点
		write_date(0x30+Temp_L/10);  //显示温度的小数
		write_date(0x40+3);          //显示温度符号 C
		
		keyscan();  //按键扫描
		
		if((Temp_H*10+Temp_L/10)>(H_WD*10)&&(flag==1)||(Temp_H*10+Temp_L/10)<(L_WD*10)&&(flag==1))//温度判断
		{
			beep=0;    //蜂鸣器报警
			delay(500);
		}
		else
		{
			beep=1;  //蜂鸣器不报警
		}                                                                                                                                                                                                                 
		write_com(0x80+10);  //高上线
		write_date(0x30+H_WD/10);
		write_date(0x30+H_WD%10);
		write_date(0x40+3);
		write_com(0x80+0x40+10);  //低下线
		write_date(0x30+L_WD/10);
		write_date(0x30+L_WD%10);
		write_date(0x40+3);   // 显示温度符号 C
	}
}