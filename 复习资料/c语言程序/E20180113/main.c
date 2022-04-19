E20180113
#include <stdio.h>
#include <math.h>
int g_i;       //全局变量
#if 0
int main(void)
{
	int n;
	n = 123.456;      //将double型向int型赋值,会出错!(double可以表示int)
	double d;
	d = 12345678;     //将int型向double型赋值，可以（类型强制转换问题，强转和必转）

/*	int m;
	signed char c = -10;
	m = c;
	printf("%d\n", m);   //-10//

	char c;
	int m = 987654321;
	c = m;
	printf("%d\n", c);*/

	unsigned int i = 10;   //0000 0000 0000 0000 0000 0000 0000 1010
	int j = -16;     	   //1000 0000 0000 0000 0000 0000 0001 0000

	if((i + j) > 0)
	{
		printf("Yes\n");
	}
	else
	{
		printf("No\n");
	}

	return 0;
}

int add(int a, int b, int c)
{
	return a + b + c;
}

int main(void)
{
	int k;
	k = (1 + 2, 3, 4 + 9);  逗号表达式，取最后一个值
	int a = 5;
	k = (a, ++a, a + 2);     //k = 8
	add(1, 2, 3);  			 //函数名为函数入口地址，回去调用函数，参数不可少
	printf("%d\n", (1 + 2, 3 , 4 + 9));

	return 0;
}


int main(void)         //putchar一个字符输出函数//
{
	char c = 'K';      // ascll码  
	int n;             
	n = putchar(c);
	putchar('\n');
	printf("%d\n", n);  //输出字符k的ascll码，
	return 0;
}


int main(void)       //getchar一个字符输入函数//
{
	char c1, c2;
	c1 = getchar();
	
	while(getchar() != '\n')  /*清除输入缓冲区的非法字符*/
	{
		
	}
	c2 = getchar();
	printf("end:\n");
	putchar(c1);
	putchar(c2);
	//printf("%d\n", n);
	return 0;
}

int main(void)             //printf函数输出格式//
{
//	printf("Hello World! = %i %d\n", -1234, 4567);
//	int u = -1234;
//	printf("%-16X|\n", u);     //fffffe2b        |//
	float d = 123124.456;
	printf("%p\n", &d);    //指针格式输出//
//	printf("%s\n", "Hello World!");
//	printf("%g\n", d);       //实数格式输出  （123.4///1.234*e2）//
//	printf("%.3f\n", (int)(d * 1000) / 1000.0);  //右对齐小数点后保留3位（-左对齐）（+右对齐）//
	return 0;
}


int main(void)
{
	int n = 10,m = 20;
	int ret;

	ret = scanf("%d%d", &n, &m);  //scanf函数输入格式，从键盘接收//
	
	while(ret != 2)  //判断是否接收够两个参数
	{
		printf("Error! reinput\n");
		while(getchar() != '\n')
		{
		}
		ret = scanf("%d%d", &n, &m);
	}

	printf("%d + %d = %d\n", n, m, m + n);  //以10+20=30的格式输出//
	return 0;
}


int main(void)
{
	char ch;
	char str[100];
	scanf("%s", str);
	printf("%s\n", str);
	return 0;
}


int main(void)      //输入输出格式//
{
	double d;
//	long long n;
	short s;
	int n, m;
	scanf("%d%d", &n, &m);
//	scanf("%.3lf", &d);
//	scanf("%3d%*3d%3d", &n, &m);   //
	printf("%d ,%d\n", n, m);
//	s = 1234;
//	scanf("%hd", &s);  //%hd,%hu分别是短整型和无符号的短整型(short)//
//	printf("%d\n", s);
//	scanf("%lld", &n);
//	printf("%lld\n", n);
//	scanf("%lf", &d);
//	printf("%f\n", d);
	return 0;
}
#endif

int main(void)
{
	char c1, c2;
	scanf("%c%c", &c1, &c2);  //%c%c则输入时中间不可以回车和空格
	printf("%d, %d\n", c1, c2);
	double d = 2;
	printf("%f\n", sqrt(d));   //sqrt(d)开平方函数，包math.h头文件//gcc file.c -lm
	return 0;
}