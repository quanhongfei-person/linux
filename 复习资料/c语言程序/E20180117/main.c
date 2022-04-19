E20180117
#include <stdio.h>
#include <string.h>                      //字符串常用头文件//

#if 0
int main(void)                           //二维数组内元素比大小//
//	int max ;
{
	int a[] = {1,2,3,4,5,6,7,8,9};             
	char strs[][100] = {"Hello","World","C_Language","VMware"};//二维数组（有四个元素为一维数组），每个一维数组内又有100个元素//线性
	int i;
	char max[100];
	strcpy(max, strs[0]);
	for(i = 1;i < sizeof(strs) / sizeof(strs[0]);++i)
	{
		if(strcmp(max, strs[i]) < 0)
		{
			strcpy(max, strs[i]);
		}
	}
	//strcmp(max, strs[1]);
//	strcpy(strs[0], "Hello");
//	strcpy(strs[1], "World!");
//	strcpy(strs[2], "C_Language");

	puts(max);                  //ptus输出函数（字符，字符串）//
/*	for(i = 0;i < sizeof(strs) / sizeof(strs[0]);++i)  //二维数组元素个数(即行数)//
	{
		puts(strs[i]);
	}*/


	return 0;
}


int main(void)    //选择排序法比较二维数组内一维数组（字符串）大小//
{
	char strs[][100] = {"Hello","World","C_Language","VMware"};
	int len = sizeof(strs) / sizeof(strs[0]);
	int a[] = {-1,2,-3,4,-5,6,};
	char t[100];
	int i,j ;
	
/*	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(strcmp(strs[i] ,strs[j]) > 0)    //一维数组不能直接比大小，strcmp 比较函数//
			{                              //str1[i] > str2[j],为一维数组首地址比大小（str1[0] > str2[0]//
			
				strcpy(t, strs[i]);
				strcpy(strs[i], strs[j]);
				strcpy(strs[j], t);
			}
		}
	}*/

	for(j = len - 1;j >= 1;--j)        //冒泡排序法//
	{
		for(i = 0;i < j;++i)
		{
			if(strcmp(strs[i], strs[i + 1]) > 0)
			{
				strcpy(t, strs[i]);
				strcpy(strs[i], strs[i + 1]);
				strcpy(strs[i + 1], t);
			}
		}
	}

	for(i = 0;i < len;++i)                    //便利输出//
	{
		puts(strs[i]);
	}

	return 0;                         //______________________//
}

void print(void)                        //定义函数//
{
	return ;
	printf("I Miss You!\n");

}

int add(int a, int b)               //定义求和函数//
{
	int ret;
	ret = a + b;
//	if(a > 0)
//	{
		return ret;
//	}
//	return 	a + b;
//	printf("Hello!\n");
}

int Max(int a, int b, int c)               //定义比较函数//
{
	int max;
	max = a > b ? a : b;                    //三目运算//
	max = max > c ? max : c;
	return max;
}

int foo()
{

}

int main(void)        
{
	int a = 10, b = 20, c = 15;
	int max;
//	int ret ;
//	printf("%d\n", sizeof(foo()));;
	max = Max(a, b ,c);         //函数调用//
	printf("%d\n", max);
//	ret = add('A', 2); 
	print();
//	add(1, 2);         //函数调用//
	return 0;
}

int isLeapYear(int year)          //定义专用函数//
{
	return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
}

int daysOfTheMonth(int year, int month)
{
	int days;
	switch(month)
	{
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12:
		days = 31;
		break;
	case 4:
	case 6:
	case 9:
	case 11:
		days = 30;
		break;
	case 2:
		if(isLeapYear(year))          //函数嵌套调用//
		{
			days = 29;
		}
		else
		{
			days = 28;
		}
		break;
	}
	return days;
}

int main(void)
{
	int year = 2018, month = 1;
	int ret = daysOfTheMonth(year, month);
	printf("%d\n", ret);
	return 0;
}

int isOdd(int n)    
{
	return n % 3 == 0;   //  n % 3 == 0 成立时，表达式为真（非0 即为真）
}

void PrintOdd(void)    //100以内能被3整除的数//
{
	int i;
	for(i = 1;i < 101;++i)
	{
		if(isOdd(i))   //  
		{
			printf("%d\n", i);
		}
	}
}

int main(void)
{
	PrintOdd();
	return 0;
}

int isPrimerNumber(int n)   //判断n是否为素数函数//
{
	int i;
	for(i = 2;i < n;++i)
	{
		if(n % i == 0)
		{
			break;
		}
	}
	return !(i < n);
}

void printPrimerNumber(int n)    //打印n以内素数专用函数//
{
	int i;
	for(i = 2;i < n;++i)
	{
		if(isPrimerNumber(i))
		{
			printf("%d\n", i);
		}
	}
}

int isPalindromicNumber(int n)    //求n以内回文数函数//
{
	int k, m = 0, t = n;
	while(n)
	{
		k = n % 10;
		m = m * 10 + k;
		n /= 10;
	}
	return t == m;
}


int main(void)              //求10000以内的回文数//
{
	int a = 1234;
	for(a = 1;a < 10000;++a)
	{ 
		if(isPalindromicNumber(a) != 0)
		{
			printf("%d\n", a);
		}
	}

	return 0;
}

void foo(int n)
{
	n = n * 10;
}

int main(void)
{
	int i = 10;
	foo(100);
	printf("%d\n", 100);
	return 0;
}

int add(int a, int b)
{
	return a + b;
}

int foo(int n)
{
	printf("%d\n", n);
	return n;
}

int main(void)
{
	int a = 10, b = 20;
	add(foo(a), foo(b));
	return 0;
}

int intcmp(int n1, int n2)         //strcmp原理类似//
{
	if(n1 > n2)
	{
		return 1;
	}
	else if(n1 == n2)
	{
		return 0;
	}
	else
	{
		return -1;
	}
}

int main(void)
{
	int i = 2, j = 3;
	int k;
	k = intcmp(j, i++);
	i = 2;
//	k = intcmp(++i, ++i);   //出错点
	printf("%d\n", k);
	return 0;
}

int add(int a, int b)
{
	int ret;
	ret = a + b;
	return ret;
}

void f3()                        //函数嵌套调用//
{
}

void f2()
{
	f3();
}

void f1()
{
	f2();
}

int main(void)                         //栈的概念//
{
	int n ;
	char str[8 * 1024 * 1024];  //Linux下栈区最大8M，零时变量都存放在栈区
	f1();
	n = add(3 , 5);
	printf("%d\n", n);
	return 0;
}

/*void fm(void)
{
	fn();
}*/

int g_i;

int fn(int n)            //函数递归实现n以内数求和//
{
	static int m;
	if(1 == n)
	{
		return 1;
	}
	else
	{
		return fn(n - 1) + n;
	}
}

int main(void)                //100以内数求和（非循环法）//
{ 
	printf("%d\n", fn(100));
	return 0;
}
#endif

void move(char pole1, char pole2)    //汉罗塔（函数递归）//
{
	printf("%c->%c\n", pole1, pole2);
}

void hanoi(int n, char pole1, char pole2, char pole3)
{
	if(1 == n)
	{
		move(pole1, pole3);
		return ;
	}
	else
	{
		hanoi(n - 1, pole1, pole3, pole2);
		move(pole1, pole3);
		hanoi(n - 1, pole2, pole1, pole3);
	}
}

int main(void)
{
	hanoi(64, 'X', 'Y', 'Z');
	return 0;
}