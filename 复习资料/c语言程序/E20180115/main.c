E20180115
#include <stdio.h>

#if 0
int main(void)                       // break语句（只能跳出一层循环）//  
{
	int i = 10, j;
	int n = 9;
	int flag = 0; 
/*
	for(i = 0;i < 10;++i)
	{
		for(j = 0;j < 5;++j)
		{
			if(j == 2)
			{
				flag = 1;
				break;               //break跳出循环 if非循环，跳出for//
			}
		}
		if(flag)
		{
			break;
			
		}
		printf("Hello\n");
	}
*/
	for(n = 2;n < 101;++n)                   //求100以内素数//
	{
		for(i = 2;i < n;++i)
		{
			if(n % i == 0)    //有一个能被整除的数，就brake跳出，不再做后续判断。
			{
				break;					//合数//
			}
		}

		if(i == n)  // 只要在这里相等的，就不是break出来的，则不是合数。
		{
			printf("%d\n", i);

		}
	}
	return 0;
}


int main(void)                       //continue语句(只能跳出当前循环，执行下一个循环，不跳出循环)//
{                                                  //求100以内能被3整除的数//
	int i;
	for(i = 0;i < 101;++i)
	{
		if(i % 3 != 0)
		{
			continue;
		}
		printf("%d\n",i);
	}
	return 0;
}


int main(void)                                  //一维数组//
{
	int n = 10;
	int a[] = {1,2,3,4,5,6,7,8,9,10,11,1,2,3,44,55,66};
	int b[10];   //定义数组但未做初始化，则数组元素初值为随机数.
	int c[10] = {0};  //定义数组并初始化所有元素为0.   初始化部分时，未初始化的为0
	//a[0..n-1]

	printf("%d\n", sizeof(a));

/*	for(n = 0;n < 10;++n)
	{
		a[n] = n + 1;
	}
*/
	//a <=> &a[0];  数组数组名代表数组首元素地址（记）
	//b = a;
	for(n = 0;n < sizeof(a)/ sizeof(a[0]);++n)       //一维数组求字长//
	{
		printf("%d,", a[n]);
	}
	printf("\b \n");
	return 0;
}


int main(void)              //一维数组求和//
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int i;
	int sum = 0;
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		sum += a[i];
	}
	printf("%d\n", sum);
	return 0;
}
#include <limits.h>

int main(void)                 //一维数组求最大值//
{
	const int a[] = {10,2,3,-4,5,-6,-7,-8,9,0};
	int max = a[0], i, n = INT_MIN;        //假设最大值为a[0]， INT_MIN为宏，
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		if(a[i] > max)
		{
			max = a[i];      //换最大值
		}
	}
	printf("%d\n", max);
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)  //一维数组第二大值//
	{
		if(a[i] != max && a[i] > n)
		{
			n = a[i];
		}
	}
	printf("%d\n", n);
	return 0;
}


int main(void)           //对调一维数组元素//
{
	int a[] = {1,2,3,4,5,6,7,8,9,0};
	int i, t;
	int len;
	len = sizeof(a) / sizeof(a[0]);
	for(i = 0;i < len / 2;++i)
	{
		t = a[i];
		a[i] = a[len - i - 1];
		a[len - i - 1] = t;
	}

	for(i = 0;i < len;++i)       //便利输出//
	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");
	return 0;
}




int main(void)             //1 1 2 3 5 8数的一维数组求法//
{
	int a[48] = {1, 1};
	int i;
	for(i = 2;i < sizeof(a) / sizeof(a[0]);++i)
	{
		a[i] = a[i - 1] + a[i - 2];
	}
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");
	
	return 0;
}


int main(void)                 //选择排序法//
{
	int a[] = {-1,2,-3,4,-5,6,-7,8,-9,0};
	int i, j, t;
	int len = sizeof(a) / sizeof(a[0]);
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(a[i] > a[j])
			{
				t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}
	}
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)//一维数组便利输出//
	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");
	

	return 0;
}


int main(void)                  //冒泡排序法//
{
	int a[] = {-1,2,-3,4,-5,6,-7,8,-9,0};
	int i, j, t;
	int len = sizeof(a) / sizeof(a[0]);

	for(j = len - 1;j >= 1;--j)
	{
		for(i = 0;i < j;++i)
		{
			if(a[i] > a[i + 1])
			{
				t = a[i];
				a[i] = a[i + 1];
				a[i + 1] = t;
			}
		}
	}
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)   //便利输出//
   	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");
	return 0;
}

int main(void)            //方法型插入法排序法//
{
	int a[] = {-1,2,-3,4,-5,6,-7,8,-9,0};1
	
	int i, j, t;
	int len = sizeof(a) / sizeof(a[0]);
	int b[len];
	b[0] = a[0];

	for(i = 1;i < len;++i)
	{
		t = a[i];
		j = i;
		while(j >= 1 && b[j - 1] > t)
		{
			b[j] = b[j - 1];
			--j;
		}
		b[j] = t;
	}

	for(i = 0;i < len;++i)
	{
		a[i] = b[i];
	}

	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");

	return 0;
}

int main(void)              //插入法排序//
{ 
	int a[] = {-1,2,-3,4,-5,6,-7,8,-9,0};
	int i, j, t;
	int len = sizeof(a) / sizeof(a[0]);
	for(i = 1;i < len;++i)
	{
		t = a[i];
		j = i;
		while(j >= 1 && a[j - 1] > t)
		{
			a[j] = a[j - 1];
			--j;
		}
		a[j] = t;
	}
	for(i = 0;i < sizeof(a) / sizeof(a[0]);++i)
	{
		printf("%d ,", a[i]);
	}
	printf("\b \n");
	return 0;
}
#endif


int main(void)            //二分法查找，前提是排好序的数组
{
	int a[] = {22, 11, 8 , 17,39, 42, 6};
	int n = 17;
	int len = sizeof(a) / sizeof(a[0]);
	
	int i, j, t;                  //选择排序段//
	for(i = 0;i < len - 1;++i)
	{
		for(j = i + 1;j < len;++j)
		{
			if(a[i] > a[j])
			{
				t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}
	}

	int begin = 0;              //二分段//递归思想
	int end = len - 1;
	int mid ;
	while(begin <= end)
	{
		mid = (begin + end) / 2;
		if(a[mid] > n)
		{
			end = mid - 1;
		}
		else if(a[mid] < n)
		{ 
			begin = mid + 1;
		}
		else
		{
			break;
		}
	}
	if(begin <= end)
	{
		printf("found! position = %d, value = %d\n", mid, n);
	}
	else
	{
		printf("not found!\n");
	}

	return 0;
}
