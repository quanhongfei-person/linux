
//1������3���ַ�������С�����˳�����в������
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
	puts("�������ַ�����");
	for(i=0;i<N;i++)
	{
		gets(str[i]);
	}
	sort(str);
	puts("�ź�����ַ���˳�����£�");
	for(i=0;i<N;i++)
	{
		puts(str[i]);
	}
	return 0;
}
#endif 
//2������һ�����֣��ҳ����д�д��ĸ��Сд��ĸ���ո������Լ������ַ��ж��ٸ���
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
	printf("�ַ����еĴ�д��ĸ��Сд��ĸ�����֡��ո������ַ������ֱ�Ϊ:%d %d %d %d %d\n",higherHigher,lowerLetters,numbers,space,other);
}
int main()
{
	char str[N];
	puts("������һ���ַ�����");
	gets(str);
	countNumber(str);
	return 0;
}
#endif

//3����д���򣬽�����һ���ַ����ӵ�һ���ַ���ʼ���������ô���
//���磺�ַ�����abcdef����ô���ace��
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
	puts("������һ���ַ�����");
	gets(str);
	printStr(str);
	return 0;
}
#endif

//4��дһ����������һ���ַ����ĳ��ȣ����ܵ���strlen��������
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
	puts("������һ���ַ�����");
	gets(str);
	printf("%d\n",strLen(str));
	return 0;
}
#endif


//5����һ�����Ȳ�����4�������ַ���ת����һ��������
//���ַ�����"3248"����ת����������3248��
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
	puts("������һ�������ַ�����");
	gets(str);
	strToInt(str,&num);
	printf("%d\n",num);
	return 0;
}
#endif