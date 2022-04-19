E20180123
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if 0
int main(void)
{
	int a[10] = {1,2,3,4,5,6,7,8,9,0};
	int *p;
	int i;
	int (*q)[10];
	printf("%p\n", &a);
	printf("%p\n", a);
	q = &a;
	printf("%p\n", q);
	printf("%p\n", q + 1);

	//a <=> int *
	//&a <=> 
	p = a;
	++p;
	return 0;
}


void printArr2(int (*arr)[4], int len)
{
	int i, j;
	for(i = 0;i < len;++i)
	{
		for(j = 0;j < 4;++j)
		{
			printf("%d ,", *(*(arr + i) + j));
		}
		puts("\b ");
	}
}

int maxOfArr2(int (*arr)[4], int len)
{
	int max = *(*arr), i, j;
	for(i = 0;i < len;++i)
	{
		for(j = 0;j < 4;++j)
		{
			if(max < arr[i][j])
			{
				max = arr[i][j];
			}
		}
	}
	return max;
}

int main(void)
{
	int a[3][4] = {1,2,3,4,5,6,7,8,19,10,11,12};
	int (*p)[4];   //定义了一个指向有四个元素数组的指针//
	int  *p[4];    // 定义了一个有元素为四个指针的数组//
	p = a;
	printArr2(p, sizeof(a) / sizeof(a[0]));
	printf("%d\n", maxOfArr2(a, sizeof(a)/ sizeof(a[0])));
//	printf("%p\n",p);
//	printf("%p\n",p + 1);
//	printf("%d\n",*(*(p + 1) + 2));//a[i][j] <=>  *(*(a + i) + j)
	//a <=> &a[0]  <=>   int (*)[4]
	//&a <=>  int (*)[3][4]
//	int (*q)[3][4];
//	q = &a;
//	printf("%p\n",q);
//	printf("%p\n",q + 1);

	return 0;
}


void memcpy(void *dest,const void *src, size_t n)   //将src指定n个copy到dest中//
{
	char *d = (char *)dest;
	char *s = (char *)src;
	while(n)
	{
		*d++ = *s++;
		--n;
	}
}

int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int b[10];
	

	stpcpy
	arrcpy(b, a, sizeof(a));

	int i;
	for(i = 0;i < sizeof(b) / sizeof(b[0]);++i)
	{
		printf("%d ,", b[i]);
	}
	puts("\b ");
	

	return 0;
}

char *Strcat(char *dest, const char *src)
{
	char *ret = dest;
	while(*dest)
	{
		++dest;
	}
	while(*src)
	{
		*dest++ = *src++;
	}
	*dest = '\0';
	return ret;
}

int main(void)
{
	char str[100] = "Hello";
	puts(Strcat(str,"World!"));
	return 0;
}

int g_i;

int *foo(void)
{
	static int n = 100;
	return &g_i;
}

int main(void)
{
	int *p;
	p = foo();
	printf("%d\n", *p);
	return 0;
}


int main(void)
{
//	char s[1024 * 1024 * 8];
	char *p;
	p = malloc(1024 * 1024 * 8);
	if(p != NULL)
	{
		strcpy(p, "Hello");
		puts(p);
		free(p);
		p = NULL;

	}




//	puts("Hello World!");
	return 0;
}


int main(void)
{
	char str[] = "Hello World";
/*	char *dest;
	dest = malloc(strlen(str) + 1);

	if(dest)
	{
		strcpy(dest, str);
		puts(dest);
		free(dest);
		dest = NULL;
	}*/
	int n;
	scanf("%d", &n);
	int *p;
	p = calloc(n ,  sizeof(int));

	return 0;
}

int mul(int a, int b)
{
	int ret;
	ret = a * b;
	return ret;
}


int max(int a, int b, int c)
{
	int ret;
	ret = a > b ? a : b;
	ret = ret > c ? ret : c;
	return ret;
}

void fn(int *n)
{
	
}

int main(void)
{
/*	int (*p)(int , int) = NULL;
	p = mul;
	printf("%d\n",p(3 , 5));*/
	int n;
	fn(&n);
	int (*pfn)(int , int , int ) = NULL;
	pfn = max;
	printf("%d\n",pfn(4, 5, 2));
	return 0;
}

int pow2(int n)
{
	return n * n;
}

int fn(int n)
{
	return n;
}

void Sort(int *arr, int len, int (*pfn)(int))
{
	int t, i, j;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(pfn(arr[i]) > pfn(arr[j]))
			{
				t = arr[i];
				arr[i] = arr[j];
				arr[j] = t;
			}
		}
	}
}


int intcmp(const void *p1, const void *p2)
{
	int *q1 = (int *)p1;
	int *q2 = (int *)p2;
	if(*q1 > *q2)
	{
		return 1;
	}
	else if(*q1 == *q2)
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
	int a[] = {1,-2,3,-4,5,-6,7,-8,9,0};
//	Sort(a, sizeof(a) / sizeof(a[0]), pow2);
	
	int i;
	qsort(a, sizeof(a) / sizeof(a[0]), sizeof(a[0]), intcmp);
	for(i = 0;i < sizeof(a)/ sizeof(a[0]);++i)
	{
		printf("%d ,", a[i]);
	}
	puts("\b ");

	return 0;
}

void foo(int *p)
{
	*p = 100;
}

void getMemory(char **p, size_t n)
{
	*p = malloc(n);
}

int main(void)
{
	char *str = NULL;
	getMemory(&str, 200);
	strcpy(str, "Hello World!");
	puts(str);
	int i;
	foo(&i);

	return 0;
}

void printStrings(char *pStr[], int len)
{
	int i;
	for(i = 0;i < len;++i)
	{
		puts(pStr[i]);
	}
}

void stringSort(char *pStr[], int len)
{
	int i, j;
	char *t;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(strcmp(pStr[i] , pStr[j]) > 0)
			{
				t = pStr[i];
				pStr[i] = pStr[j];
				pStr[j] = t;
			}
		}
	}
}


int main(void)
{
	char *pstr[] = {"Hello", "World", "C_language"};

	stringSort(pstr, sizeof(pstr)/ sizeof(pstr[0]));
	printStrings(pstr, sizeof(pstr) / sizeof(pstr[0]));


	return 0;
}


void printStrings(char *pStr[], int len)
{
	int i;
	for(i = 0;i < len;++i)
	{
		puts(pStr[i]);
	}
}

int main(int argc, char* argv[])
{
	int i;
	for(i = 0;i < argc;++i)
	{
		puts(argv[i]);
	}
	return 0;
}




int main(void)
{

	int a[] = {-1,2,-3,4,-5,6,-7,8,-9,0};
	int i;
	Qsort(a, a + sizeof(a) / sizeof(a[0]) - 1);
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		printf("%d ,", a[i]);
	}
	puts("\b ");
	return 0;
}
#endif

int *find(int *arr, int len, int n)
{
	int mid;
	int begin = 0;
	int end = len - 1;
	while(begin <= end)
	{
		mid = (begin + end) / 2;

		if(arr[mid] > n)
		{
			end = mid - 1;
		}
		else if(arr[mid] < n)
		{
			begin = mid + 1;
		}
		else
		{
			return arr + mid;
		}
	}
	return NULL;
}


int main(void)
{
	int i = 10;
//	int *p = &i;
	int *q = &i;

	int a[] = {1,2,3,4,5,6,7,8,9};

	int *p = a + 4;
	printf("%d",p - a);    *(p-a)

	return 0;
}
