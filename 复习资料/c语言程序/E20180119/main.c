E20180119
#include <stdio.h>
#include <math.h>

#include "func.h"   //自己定义的头文件用"".

#if 0
int g_i;      //全局变量g_i，存放在静态数据区

void foo(int n)
{
	int i;
	int g_i;    //同名的局部变量g_i，存放在栈区，此函数调用完成，则空间被销毁
	g_i = 100;
}

int main(void)
{
	int i = 1;
	int n = 100;
	int m = 1000;
//	g_i = 1000;      		// 给全局变量赋值1000
	printf("%d\n",g_i );    // 1000 
	if(1)
	{
	//	int i = 2;
	//	printf("%d\n", i);
	}

//	printf("%d\n", i);
//	k = 100;
	return 0;
}

//int a, b;
int sum;
int sub;




void add(int a, int b)
{
	int sum;
	sum = a + b;
	sub = a - b;
//	return a + b;
}

void bar(void)
{
	static int s_i = 0;
	int i = 0;
	printf("%d\n", s_i++);
}

int main(void)
{	
	auto int a = 3;
	register int b = 5;
//	&b;
	for(a = 0; a < 10;++a)
	{
		bar();
	}

//	printf("%d\n", add());
	return 0;
}

#include "func.h"

//int div(int , int);

int main(void)
{
	s_a = 10;
	s_b = 4;
	printf("%d\n", sub());
	return 0;
}

/*void foo(int )
{
}*/



#define AREA PI * R * R
#define N 200
#define PI 3.1415
#define R 3.0
#define FLAG

//#undef R


int main(void)
{
	int a[N];
	int b[N];
	int c[N];
	int n;
	n = N;
	//&N;
//	printf("AREA = %f\n", R);
	printf("%d\n", __LINE__);
	printf("%s\n",__FILE__);
	return 0;
}

#define SUM(a, b) ((a) + (b))
#define SWAP(a, b) {\
	int t;\
	t = a;\
	a = b;\
	b = t;\
}

#define MAX(a, b) (((a) > (b)) ? (a) : (b))

#define S(a, b, c) (((a) + (b) + (c)) / 2)
#define AREA(a, b, c) (sqrt(S(a, b, c) * (S(a, b, c) - (a)) * (S(a, b, c) - (b)) * (S(a, b, c) - (c))))


int main(void)
{
	int k;
	int i = 10, j = 20;
//	k = SUM(1, 3); //1 + 3
//	printf("%f\n", SUM(3.0 > 4.0, 5.0) ); //(3.0 > 4.0 + 5.0)
//	SWAP(i, j);
//	printf("%d\n", SUM(MAX(3, 4), MAX(5, 7)));
	printf("%f\n", AREA(3, 4, 5));
	printf("%f\n", AREA(4, 5, 6));

	return 0;
}

#define FLAG
//#define DEBUG

void foo(int a[], int len)
{
	int i;
	for(i = 0;i < len;++i)
	{
#ifdef DEBUG
		printf("i = %d \n", i);
#endif
		printf("%d ,", a[i]);
	}
}

int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,0,};
	foo(a, 10);

#ifndef FLAG
	printf("Yes\n");
#else
	printf("No\n");
#endif

	return 0;
}
#endif

#include "calendar.h"

int main(void)
{
//	printf("%d\n", weekOfTheFirstDay(2018, 1));
	printCalendar(2018, 2);
	return 0;
}
