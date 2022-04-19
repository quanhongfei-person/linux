E20181210
#include <stdio.h>

#if 0
int main(void)
{
	long long int n;
	n = 123456789;		//int long
	printf("%ld\n", 123456789l);
	return 0;
}

int main(void)
{
	signed char ch;
//	printf("1234567890\rABCD\n");    //ABCD567890(\r：光标移至本行开头)//
	ch = '\t';//"hello " char *
//	printf("AB\tA\n");          //printf("ABCDEFG\tA\r123\n");  -->123DEFG A//
//	printf("\\");
//	printf("23%%");                  // 23%的正确表示方法
//	printf("\'");                    //\t：光标从左到右移动8位//
	ch = '\67';
	ch  = '\x47';
	printf("%c\n", ch);
	return 0;
}

int main(void)
{
	printf("h\tij\r*k\n");             //*k      ij//
	return 0;
}

int main(void)
{
	int n = 10;
	int m = 2;
	printf("%d\n", n + m);
	return 0;
}
#endif



int main(void)
{
	int m = 10;
	int n = 3;

	srandom(time(NULL));        //随机数函数
	

	for(m = 0;m < 10;++m)
	{
		n = random();
		printf("%d,", n % 50 + 50);    (n % 50) +50 则 (0 <= n < 50） + 50,
	}
	printf("\b \n");   //  \b表示光标前移一格

	return 0;
}
