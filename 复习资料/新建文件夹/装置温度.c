#include<reg52.h>
#define uint unsigned int
#define uchar unsigned char

sbit  lcdrs=P2^7;//��������˿�
sbit  lcdrw=P2^6;//��д�˿�.����������ֻд/
sbit  lcden=P2^5;//ʹ�ܶ˿ڡ�
sbit DQ=P1^1;//ds18b20 �˿�
sbit K1=P2^2;//�������Ʊ�����ֵ���ߵ�����ֵ�ļӼ� ���·�ֵ��
sbit K2=P2^1;//���·�ֵ��
sbit K3=P2^4;//���·�ֵ��
sbit K4=P2^3;//���·�ֵ��
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
void delay1(unsigned int i)//��ʱ����
{
	while(i--);
}
void Init_DS18B20(void)
{
	unsigned char x=0;
	DQ = 1;    //DQ��λ
	delay1(8);  //������ʱ
	DQ = 0;    //��Ƭ����DQ����
	delay1(80); //��ȷ��ʱ ���� 480us
	DQ = 1;    //��������
	delay1(10);
	x=DQ;      //������ʱ�� ���x=0���ʼ���ɹ� x=1���ʼ��ʧ��
	delay(5);
}
/***************************************************************/
/*                    ��һ���ֽ�                               */
/***************************************************************/
unsigned char ReadOneChar(void)
{
	unsigned char i=0;
	unsigned char dat = 0;
	for (i=8;i>0;i--)
	{
		DQ = 0; // �������ź�
		dat>>=1;
		DQ = 1; // �������ź�
		if(DQ)
		dat|=0x80;
		delay1(5);
	}
	return(dat);
}
/***************************************************************/
/*                дһ���ֽ�                                   */
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
/*                  ��ȡ�¶�                                   */
/***************************************************************/
unsigned int ReadTemperature(void)
{
	unsigned char a=0;
	unsigned int b=0;
	unsigned int t=0;
	Init_DS18B20();
	WriteOneChar(0xCC); // ����������кŵĲ���
	WriteOneChar(0x44); // �����¶�ת��
	delay1(200);
	Init_DS18B20();
	WriteOneChar(0xCC); //����������кŵĲ���
	WriteOneChar(0xBE); //��ȡ�¶ȼĴ����ȣ����ɶ�9���Ĵ����� ǰ���������¶�
	a=ReadOneChar();  //��λ
	b=ReadOneChar();  //��λ
	b<<=8;	
	t=a+b;
	return(t);
}
void write_com(uchar com)
{
	lcdrs=0;                //дָ��ʱRS=L
	lcden=0;             
	P0=com;                  //���˿���ָ��
	delay(5);              //��ʱ5MS 
	lcden=1;              //ʹ�ܶ˸ߵ�ƽ��Ч 
	delay(5);
	lcden=0;
}
void write_date(uchar date)
{
	lcdrs=1;                //д����ʱRS=L
	lcden=0;             
	P0=date;                  //���˿�������
	delay(5);              //��ʱ5MS 
	lcden=1;              //ʹ�ܶ˸ߵ�ƽ��Ч 
	delay(5);
	lcden=0;
}
void init()
{
	
	uchar num;
	lcdrw=0;//д�ź�����
	lcden=0;//ʹ�ܶ�����
	write_com(0x38);          //����ʾ
	write_com(0x0c);        //0e����ʾ����ʾ���
	write_com(0x06);        //ÿдһ����ַ�͹���һ 
	write_com(0x01);          //��ʾ����
	write_com(0x80);        //��һ�еĳ�ʼ��ַΪ0x80
	for(num=0;num<14;num++)//ѭ��������Ҫ�������ռ���ٸ��ַ�
	{
		write_date(table1[num]);//���˺����˶�����Եġ�
		delay(5);
	}
	write_com(0x80+0x40);  //�ڶ��г�ʼ��ַΪ0x80+0x40
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
		temp=ReadTemperature();//�¶ȶ�ȡ
		if(temp&0x8000)//�ж�
		{
			flag=0;//���ű�־
			temp=~temp;  // ȡ����1
			temp +=1;
		}
		else
		{
			temp=temp;
			flag=1;//�¶�Ϊ����־λ1
		}
		Temp_H=temp>>4;//�¶ȸ�4λ
		write_com(0x80+0x40);
		if(flag==0)
		{
			write_date(0xB0);
		}//���ű�־
		else
		{
			write_date(0x20+11);	
		}//���ű�־.
		write_com(0x80+0x41);
		write_date(0x30+Temp_H/10);//��ʾ�¶ȵ�ʮλ
		write_date(0x30+Temp_H%10);//��ʾ�¶ȵĸ�λ
		Temp_L=temp&0x0F;
		Temp_L=Temp_L*6;//С�����ƴ���
		write_com(0x80+0x43);
		write_date(0x2e);//��ʾС����
		write_date(0x30+Temp_L/10);//��ʾ�¶ȵ�С��
		write_date(0x40+3);
		keyscan();//����ɨ��
		if((Temp_H*10+Temp_L/10)>(H_WD*10)&&(flag==1)||(Temp_H*10+Temp_L/10)<(L_WD*10)&&(flag==1))//�¶��ж�
		{
			beep=0;
			delay(500);
		}
		else
		{
			beep=1;//������������
		}
		write_com(0x80+10);//������
		write_date(0x30+H_WD/10);
		write_date(0x30+H_WD%10);
		write_date(0x40+3);
		write_com(0x80+0x40+10);//������
		write_date(0x30+L_WD/10);
		write_date(0x30+L_WD%10);
		write_date(0x40+3);   
	}
}