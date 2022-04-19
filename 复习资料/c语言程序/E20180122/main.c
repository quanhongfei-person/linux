E20180122     （指针）
#include <stdio.h>


#if 0
int main(void)
{
	int n = 100;
	int *p ;//= &n;              // int *为指针变量类型，p为指针变量//

	p = &n;                      // &为取地址符， 
	
//	*p <=> n
	*p = 1000;
	printf("%d\n", *p);
	printf("%d\n", n);

	int a = 10, b = 20, c = 30;
	int *p1 = &a, *p2 = &b, *p3 = &c;

	int max;
	max = *p1 > *p2 ? *p1 : *p2;
	max = max > *p3 ? max : *p3;
	printf("%d\n", max);

	return 0;
}

void foo(int *n)      //参数以指针形式传递
{
	*n += 100;
}
/*
void swap(int *n, int *m)       //最准确的表达（交换）
{
	int t;
	t = *n;
	*n = *m;
	*m = t;
}

void swap(int *n, int *m)         //交换n，m的首地址 若*n=1，*m = 2.则*n = 2，*m =1.
{
	int t;                            
	t = n;
	n = m;
	m = t;        				//实体未交换
}

void swap(int *n, int *m)     //程序奔溃
{
	int *t;            //t未初始化，*t是随机数
	*t = *n;
	*n = *m;
	*m = *t;
}

void swap(int *n, int *m)             //将 *n = 1放到*t的首地址t中    
{
	int *t;
	t = *n;                           // 可以交换，有警告   指针 = int 
	*n = *m;
	*m = t;                           //将*t的首地址t放到*m中
}
*/



int main(void)
{
	int i = 1, j = 2;
	swap(&i, &j);
	printf("%d, %d\n", i, j);
//	foo(&i);
//	printf("%d\n", i);
	return 0;
}


int main(void)
{
	int i = 100;
	int *p = &i;
//	printf("", &*i);
	printf("%d\n", *&i);
	printf("%p\n", *&p);
	printf("%p\n", &*p);
	return 0;
}

void  maxMin(int a, int b, int c, int *pMax, int *pMin)
{
	*pMax = a > b ? a : b;
	*pMax = *pMax > c ? *pMax : c;
	*pMin = a < b ? a : b;
	*pMin = *pMin < c ? *pMin : c;
}

int main(void)
{
	int i = 10, j = 20, k = 15;
	int max, min;
	maxMin(i, j, k, &max, &min);
	printf("%d, %d\n", max, min);
	return 0;
}

int isLittleEndian(void)    //电脑大小端问题
{
	int i = 1;
	char *p = (char *)(&i);
	return *p == 1;

}



int main(void)
{
	if(isLittleEndian())
	{
		puts("small");
	}
	else
	{
		puts("big");
	}
/*	int i = 0x12345678;      //电脑大小端方法2
	short *p;
	p = (short *)(&i); //short *      int *
	printf("%d\n", *p);*/
	return 0;
}

int main(void)
{
	int i = 100;
	char *p = (char *)(&i);    //(char *)做强转，将int* 强转成 char* 
	int n = 1;
	printf("%p\n", p);
	printf("%p\n",p + n);      //指针自++
	return 0;
}


int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int *p;
	p = a;// 右值为 a  为 数组首元素地址 int *   （数组的数组名代表数组首元素地址）
		  // 右值为 &a 为 数组首元素的首地址
	int max, i;
	max = *p;
	++p;
	for(i = 1;i < sizeof(a) / sizeof(a[0]);++i, ++p)
	{
		if(max < *p)
		{
			max = *p;
		}
	}

	//a[i]   <=> *(a + i)
//	printf("%d\n", *(a + 3));//a[3]

	
//	int i = 0;
//	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
//	{
//		printf("%d ,", *p++);
//	}



	return 0;
}

void printIntArr(int *arr, int len)
{
	int i;

	for(i = 0;i < len;++i)
	{
		printf("%d ,", arr[i]);
	}
	puts("\b ");
}
//a[i] <=>  *(a + i)

void choiseSort(int *arr, int len)
{
	int i, j, t;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(*(arr + i) > *(arr + j))
			{
				t = *(arr + i);
				*(arr + i) = *(arr + j);
				*(arr + j) = t;
			}
		}
	}
}

int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,0,};
	int *p = a;
	choiseSort(a, sizeof(a) / sizeof(a[0]));
	printIntArr(a, sizeof(a) / sizeof(*(a + 0)));
	return 0;
}


int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int *p;
/*	p = a;
	printf("%d\n" ,*p++);
	printf("%d\n", *++p);
	printf("%d\n", ++*p);
	printf("%d\n", (*p)++);*/

	for(p = a;p < a + sizeof(a) / sizeof(a[0]);++p)
	{
		printf("%d ,", *p);
	}
	puts("\b ");

	
	return 0;
}
#endif

void Puts(const char *pstr)
{
	while(*pStr)
	{
		putchar(*pStr);
		++pStr;
	}
	putchar('\n');
}

size_t Strlen(const char *pStr)     //递归//
{
	if(*pStr == '\0')
	{
		return 0;
	}
	else
	{
		return Strlen(pStr + 1) + 1; 
	}
}

void Strcpy(char *dest,const char *src)
{
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
}

void Strcat(char *dest,const char *src)
{
	while(*dest)
	{
		++dest;
	}
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
}



int main(void)
{
	char *p1 = "Hello World!";
	char *p2 = "Hello World!";
	char str[100];

	Strcpy(str, "Hello!");
	Strcat(str, p2);
	puts(str);

	printf("%d\n", strncmp("Hello", "Hel", 4));

//	printf("%u\n", Strlen(p1));

//	puts(p1 == p2 ? "Yes" : "No");

//	int i = 10;
//	const int * const p = &i;  //consgt int *  <=> int const *
//	int j = 88;
	//p = &j;
	//*p = 100;


//	char str[] = "Hello World!";
//	char *p;
//	p = "Hello World!";
//	*p = 'C';
//	Puts("Hello World!");
//	p = str;
//	*(p + 2) = 'C';
//	Puts(str);//&str[0]
	return 0;
}
