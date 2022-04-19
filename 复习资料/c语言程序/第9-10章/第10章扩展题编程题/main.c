
//1、输入3个字符串，按小到大的顺序排列并输出。
#if 0
#include<stdio.h>
#include<string.h>
#define N 3
#define M 20
void sort(char (*str)[M])
{
	int i,j;
	char temp[M];
	for(i=0;i<N;i++)
	{
		for(j=0;j<N-i-1;j++)
		{
			if(strcmp(str[j],str[j+1])>0)
			{
				strcpy(temp,str[j]);
				strcpy(str[j],str[j+1]);
				strcpy(str[j+1],temp);
			}
		}
	}
}
int main()
{
	char str[N][M];
	int i;
	puts("请输入字符串：");
	for(i=0;i<N;i++)
	{
		gets(str[i]);
	}
	sort(str);
	puts("排好序的字符串顺序如下：");
	for(i=0;i<N;i++)
	{
		puts(str[i]);
	}
	return 0;
}
#endif 
//2、输入一行文字，找出其中大写字母、小写字母、空格、数字以及其他字符有多少个？
#if 0
#include<stdio.h>
#define N 20
void countNumber(char* str)
{
	int higherHigher=0;
	int	lowerLetters=0;
	int space=0;
	int numbers=0;
	int other=0;
	
	while(*str!='\0')
	{
		if(*str>='A'&& *str<='Z')
		{
			higherHigher++;
		}
		else if(*str>='a'&& *str<='z')
		{
			lowerLetters++;
		}
		else if(*str>='0'&& *str<='9')
		{
			numbers++;
		}
		else if(*str==' ')
		{
			space++;
		}
		else
		{
			other++;
		}
		str++;
	}
	printf("字符串中的大写字母、小写字母、数字、空格、其他字符个数分别为:%d %d %d %d %d\n",higherHigher,lowerLetters,numbers,space,other);
}
int main()
{
	char str[N];
	puts("请输入一个字符串：");
	gets(str);
	countNumber(str);
	return 0;
}
#endif

//3、编写程序，将任意一个字符串从第一个字符开始间隔地输出该串。
//例如：字符串是abcdef，那么输出ace。
#if 0
#include<stdio.h>
#define N 20
void printStr(char* str)
{
	while(*str!='\0')
	{
		printf("%c",*str);
		str+=2;
	}
}
int main()
{
	char str[N];
	puts("请输入一个字符串：");
	gets(str);
	printStr(str);
	return 0;
}
#endif

//4、写一个函数，求一个字符串的长度（不能调用strlen函数）。
#if 0
#include<stdio.h>
#define N 20
int strLen(char* str)
{
	int len=0;
	while(*str++!='\0')
	{
		len++;
	}
	return len;
}
int main()
{
	char str[N];
	puts("请输入一个字符串：");
	gets(str);
	printf("%d\n",strLen(str));
	return 0;
}
#endif


//5、将一个长度不超过4的数字字符串转换成一个整数。
//如字符串是"3248"，则转换的整数是3248。
#if 0
#include<stdio.h>
#define N 5
void strToInt(char* str,int* num)
{
	while(*str!='\0')
	{
		*num=*num*10+(*str-'0');
		str++;
	}
}
int main()
{
	char str[N];
	int num=0;
	puts("请输入一个数字字符串：");
	gets(str);
	strToInt(str,&num);
	printf("%d\n",num);
	return 0;
}
#endif