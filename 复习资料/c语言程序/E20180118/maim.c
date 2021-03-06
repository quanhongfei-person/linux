E20180118
#include <stdio.h>
#include <limits.h>
#include <string.h>
#if 0
                                                       (一维数组)
int sumOfIntArray(int arr[], int len)    //一维数组arr[]中len个元素求和//
{
	int i, sum = 0;
	for(i = 0;i < len;++i)
	{
		printf("%d\n", arr[i]);
		sum += arr[i];
	}
	return sum;
}

int main(void)                 //函数调用//
{
	int a[] = {1,2,3,4,5,6,7,8,9,10, 11, 12, 0};

	int sum;

	sum = sumOfIntArray(a, sizeof(a) / sizeof(a[0]));

	printf("%d\n", sum);

	return 0;
}

int maxOfIntArray(int arr[], int len)         //求数组中最大值//
{
	int i;
	int max = arr[0];

	for(i = 1;i < len;++i)
	{
		if(max < arr[i])
		{
			max = arr[i];
		}
	}
	return max;
}
                                     //数组中第二大值//
int sMaxOfIntArray(int arr[], int len)
{
	int max, sec;
	max = maxOfIntArray(arr, len);   //利用函数maxOfInArray()求出最大值
	sec = INT_MIN;                   //先令第二大值为int型中最小的，即 2^15（INT_MIN 此处为宏，预编译时会替换掉）
	int i;
	for(i = 0;i < len;++i)
	{
		if(sec < arr[i] && arr[i] != max)  //从前往后挨个便利，如果一个数大于已知最小数（最初为INT_MIN），则发生交换
		{
			sec = arr[i];
		}
	}
	return sec;   // 循环出来的一定是数组元素中第二大数，
}

int main(void)
{
	int a[] = {1,2,3,4,5,6,7,8,9,10, 11, 12, 0};
	printf("%d\n", sMaxOfIntArray(a, sizeof(a) / sizeof(a[0])));

	return 0;
}

void foo(int arr[], int len)  //对一个数组元素数值乘2函数。
{
	int i;
	for(i = 0;i < len;++i)
	{
		arr[i] *= 2;
	}
}

void printIntArray(const int arr[], int len)  //专用的打印输出函数            
{
	int i;
	for(i = 0;i < len;++i)
	{
	//	arr[0] = 4;
		printf("%d ,", arr[i]);
	}
	puts("\b ");
}

void reverseIntArray(int arr[], int len)       //数组元素前后对调//
{
	int i, t;
	for(i = 0;i < len / 2;++i)
	{
		t = arr[i];
		arr[i] = arr[len - i - 1];
		arr[len - i - 1] = t;
	}
}

void choiseSort(int arr[], int len)    //选择排序法//
{
	int i, j, t;
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(arr[i] > arr[j])
			{
				t = arr[i];
				arr[i] = arr[j];
				arr[j] = t;
			}
		}
	}
}

int Find(int arr[], int len, int n)          //二分法//
{
	int begin = 0, end = len - 1;
	int mid;
	choiseSort(arr, len);
	while(begin <= end)
	{
		mid = (begin + end) / 2;
		if(arr[mid] < n)
		{
			begin += 1;
		}
		else if(arr[mid] > n)
		{
			end -= 1;
		}
		else
		{
			break;
		}
	}
	if(begin <= end)
	{
		return mid;
	}
	else
	{
		return -1;
	}

}

int main(void)                           //以下为函数调用//
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int len = sizeof(a) / sizeof(a[0]);
//	foo(a, sizeof(a)/ sizeof(a[0]));
	choiseSort(a, len);
	int m;
	if((m = Find(a, len, 7)) >= 0)
	{
		printf("position = %d, value = %d\n", m, 7);
	}
	else
	{
		puts("Not Found!\n");
	}

	printIntArray(a, sizeof(a) / sizeof(a[0]));
	return 0;
}

                                     （二维数组）
void printIntArray2( int arr[][4], int len)          //定义打印函数//
{												//二维数组传参形式 a[][n], n不可省略
	int i, j;
//	printf("%d\n", sizeof(arr) / sizeof(arr[0]));
	for(i = 0;i < len;++i)
	{
		for(j = 0;j < 4;++j)
		{
			printf("%2d ,", arr[i][j]);
		}
		puts("\b ");
	}
}

int maxOfIntArray( int arr[], int len)       //定义在一维数组中找最大值函数//
{
	int i;
	int max = arr[0];

	for(i = 1;i < len;++i)
	{
		if(max < arr[i])
		{
			max = arr[i];
		}
	}
	return max;
}

int maxOfIntArray2(int arr[][4], int len)      //定义在二维数组中找最大值函数//
{
	int max = arr[0][0];
	int i, j;
	max = maxOfIntArray(arr[0], 4);

	for(i = 1;i < len;++i)
	{
		int t = maxOfIntArray(arr[i], 4);
		if(max < t)
		{
			max = t;
		}

	}
	return max;
}

int main(void)                              //打印//
{
	int a[][4] = {1,2,3,4,5,6,7,8,9,10,11,12};
	
//	printIntArray2(a, sizeof(a) / sizeof(a[0]));

	printf("%d\n", maxOfIntArray2(a, sizeof(a) / sizeof(a[0])));
	return 0;
}
#endif

void Puts(char str[])                              //字符型数组，puts函数实现原理//
{
	int i = 0;
	while(str[i] != '\0')
	{
		putchar(str[i]);
		++i;
	}
	putchar('\n');
}

size_t Strlen(char str[])                          // 求字符型数组的长度，只适用于字符型//
{
	size_t i = 0;
	while(str[i])
	{
		++i;
	}
	return i;
}

void Strupr(char str[])                     //将字符型数组中小写转大写//
{
	int i = 0;
	while(str[i])
	{
		if(str[i] >= 'a' && str[i] <= 'z')
		{
			str[i] -= 32;
		}
		++i;
	}
}

void Strlow(char str[])                   //对应的大写转小写
{

}

void Strcpy(char dest[],const char src[])                //字符型数组str[]复制dest[]//
{
	int i = 0;
	while(src[i])
	{
		dest[i] = src[i];
		++i;
	}
	dest[i] = '\0';                                         //手动添加结束字符'\O'//
}

int Strcmp(const char s1[],const char s2[])                  //字符型数组比较大小//
{
	int i = 0;
	while(s1[i] == s2[i] && s1[i] && s2[i])       //判断不以‘\0’开头//
	{
		++i;
	}
	if(s1[i] > s2[i])
	{
		return 1;
	}
	else if(s1[i] == s2[i])
	{
		return 0;
	}
	else
	{
		return -1;
	}
}

void maxOfString(char strs[][100], int len)                  //利用一维数组求二维数组最大值//
{
	char t[100];     //用 t[100] 存放最大的字符数组
	int i;
	strcpy(t, strs[0]);   
	for(i = 1;i < 3;++i)
	{
		if(strcmp(t, strs[i]) < 0)  //比较大小
		{
			strcpy(t, strs[i]);
		}
	}
	puts(t);
}

void printStrings(char strs[][100], int len)
{
	int i;
	for(i = 0;i < len;++i)
	{
		puts(strs[i]);
	}
}

void stringSort(char strs[][100], int len)     //选择排序法求字符型二维数组最大值//
{
	int i, j;
	char t[100];
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(Strcmp(strs[i], strs[j]) > 0)
			{
				Strcpy(t, strs[i]);
				Strcpy(strs[i], strs[j]);
				Strcpy(strs[j], t);
			}
		}
	}
}

int main(void)
{
//	printf("%d\n", Strcmp("Hello", "World"));
	char strs[][100] = {"Hello", "World", "C_language"};
	char t[100];

	stringSort(strs, sizeof(strs) / sizeof(strs[0]));
//	maxOfString(strs, 3);
	printStrings(strs, sizeof(strs) / sizeof(strs[0]));


	return 0;
}


#if 0

int main(void)
{
	char str[100] = "Hello World!";
	char str2[100];
	Strcpy(str2, "World!");
	puts(str2);
//	Strupr(str);
	puts(str);
//	puts(Strupr());
//	Puts(str);
//	printf("%u\n", Strlen("Hello World!"));

	return 0;
}
#endif