E20180116
#include <stdio.h>
#include <string.h>[头文件]//strcmp,strcat[s1，s2]（将s2连到s1后['\0'问题]）,stpcpy[目的地，从哪],strlen[有效字符串长度]//
#if 0
int main(void)          //将字符串大写转小写//
{
	int a[] = {1,2,3,4,5};       //一维数组//
	char str[100] = "Hello Wrold!";     //str <=> &str[0]相当于首地址[首地址<==>指针] //字符型数组//
	int i = 0;   //Hello World 字符串常量在常量区

	while(str[i])
	{
		if(str[i] >= 'a' && str[i] <= 'z')
		{
			str[i] -= 32;
		}
		++i;
	}

	printf("%s\n", str);
	return 0;
}

int main(void)
{
	char str[10];// = "Hello World!";
	int i = 0;                          //%c//
//	printf("%s", str);               //%s格式输出字符串//
//	puts(str);
	while(str[i])
	{
		putchar(str[i++]);                 //putchar输出函数//
	}
	putchar('\n'); //如果没有\n 则缓冲区未满，不会刷出。
	return 0;
int main(void)                                     //gets,puts(自带‘\0’)函数//
{
	char str[100];
//	scanf("%s", str);
	gets(str);  //超出str[100]数组,puts(str)会先正确输出，再崩溃。
	puts(str);
	return 0;
}


int main(void)
{
	char str[100] = "Hello World!";

/*	int i = 0;
	while(str[i])
	{
		++i;
	}
	printf("%d\n", i);*/                 //打印hello world！的有效字符数//
	printf("%u\n", strlen(str));
	return 0;
}

int main(void)                                  //strcpy函数//
{
	char str1[100] = "Hello World!";
	char str2[100] = {0};

	strcpy(str2, str1);
/*	int i = 0;                                     //stpcpy函数原理//
	while(str1[i])
	{
		str2[i] = str1[i];

		++i;
	}
	更好
	while(str1[i])
	{
		str2[i] = str1[i++];

		str2[i++] = str1[i];  //更好方法
	}
	str2[i] = '\0';*/
	puts(str2);

	return 0;
}

int main(void)                                           //strcat函数//
{
	char str1[100] = "Hello";
	char str2[] = "World!";

	strcat(str1, str2);
/*	int i = 0, j = 0;                                //strcat函数原理//

	while(str1[i])
	{
		++i;
	}

	while(str2[j])
	{
		str1[i] = str2[j];
		++i;
		++j;
	}
	str1[i] = '\0';*/

	puts(str1);

	return 0;
}

int main(void)                              //对调字符串[反向输出字符串]//
{
	char str[100] = "Hello World!";
	char t;
	size_t len, i;
	len = strlen(str);
	for(i = 0;i < len / 2;++i)
	{
		t = str[i] ;
		str[i] = str[len - i - 1];
		str[len - i - 1] = t;
	}

	puts(str);
	return 0;
}


int main(void)      //将数字转入str中成为字符串 sprintf函数（类似itoa函数实现）//
{
	int n = 123456789, flag = 0;
	char str[100];
	int k, i = 0;

	if(n < 0)
	{
		n = 0 - n;
		flag = 1;
	}
	while(n)
	{
		k = n % 10;
		str[i++] = k + 48;
		n /= 10;
	}
	if(flag)
	{
		str[i++] = '-';
	}
	str[i] = '\0';    //此处'\0'非有效字符，strlen求出的是'\0'前的，所以逆序也是。

	int len = strlen(str);

	for(i = 0;i < len / 2;++i)
	{
		k = str[i];
		str[i] = str[len - i - 1];
		str[len - i - 1] = k;
	}

	puts(str);                                      //(-)123456789字符串（非数字）//

	return 0;
}


int main(void)                                          //sprintf函数实现//
{
	int n = 123456789;
	char str[100];

	sprintf(str, "%x", n);     //将n以“%x的格式于str拼接在一起” 形成str+“%x格式的n
	puts(str);
	

	return 0;
}


int main(void)                            // 字符串比较大小//
{
	char s1[] = "Hello";
	char s2[] = "World";
	char s3[] = "c_language";
	char dest[100];
	
	if(strcmp(s1, s2) > 0)
	{
		strcpy(dest, s1);
	}
	else
	{
		strcpy(dest, s2);
	}

	if(strcmp(dest ,s3) < 0)
	{
		strcpy(dest, s3);
	}

	puts(dest);

	return 0;
}


int main(void)            //strcmp函数实现原理//       
{
	char s1[] = "Hello";   
	char s2[] = "World";

	int i = 0;
	while(s1[i] == s2[i] && s1[i] && s2[i]) //当s1[i] ！= s2[i] 且(&&) s1[i] ！= '\0' 且 s2[i] != '\0'时
	{
		++i;    //跳过相等的。
	}
	if（s1[i] - s2[i]）
	{
		return 1;
	}
	else if（s1[i] - s2[i]）
	{
		return -1;
	}
	else
	{
		return 0;
	}
/*
	int i = 0,ret;
	while(s1[i] == s2[i] && s1[i] && s2[i]) //当s1[i] ！= s2[i] 且(&&) s1[i] ！= '\0' 且 s2[i] != '\0'时
	{
		++i;    //跳过相等的。
	}
	if（s1[i] - s2[i] > 0）
	{
		ret = 1;
	}
	else if（s1[i] - s2[i] == 0）
	{
		ret = 0;
	}
	else
	{
		ret = -1;
	}
	printf("%d\n",ret);
*/
}


int main(void)           //二维数组//
                    //二维数组找最大值//
{
	int a[][4] = {100,2,3,4,  5,6,7,8,9,  10,11,12,13,  14,15,16,16,  18,19};
	int b[3][4];  //可以省略靠近变量名的维度数
	int i, j, t = 1, x = 0, y = 0;

	int max = a[0][0];
	//内部循环比外部循环快。
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		for(j = 0;j < 4;++j)
		{
			if(max < a[i][j])
			{
				max = a[i][j];
				x = i;
				y = j;
			}
		}
	}
	
	printf("x = %d, y = %d , value = %d\n", x, y, max);
/*	for(i = 0;i < 3;++i)
	{
		for(j = 0;j < 4;++j)
		{
			a[i][j] = t++;
		}
	}*/
	//a[0] <=> &a[0][0]
	//a[0] = a[1];
//	b = a;
/*	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)             //便利输出//
	{
		for(j = 0;j < 4;++j)
		{
			printf("%2d ", a[i][j]);
		}
		printf("\n");
	}
*/

	printf("%d\n", sizeof(a));
	return 0;
}
#endif


int main(void)               //实现魔方阵函数//
{
	int a[3][3] = {0};
	int i = 0, j = 1, n;
	int x, y;

	a[i][j] = 1;

	for(n = 2;n < 10;++n)
	{
		x = i;
		y = j;
		++j;
		if(j >= 3)
		{
			j = 0;
		}
		--i;
		if(i < 0)
		{
			i = 2;
		}
		if(a[i][j] != 0)
		{
			i = x;
			j = y;
			++i;
			if(i >= 3)
			{
				i = 0;
			}
		}
		a[i][j] = n;
	}
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		for(j = 0;j < 3;++j)
		{
			printf("%2d ", a[i][j]);
		}
		printf("\n");
	}
	

	return 0;
}