E20181207
#include <stdio.h>

#if 0
int main(void)
{
	int n ;    //占4字节,默认是有符号的。
	n = 2147483647;
//	n = n + 1;    
	printf("%d\n", n);		//-2147483648//
	return 0;
}


int main(void)
{
	int i;
	unsigned n;
	n = 0xFFFFFFFF;  
	sizeof(n);
	printf("%d\n", sizeof(n));  //4//

	return 0;
}


int main(void)
{
	signed short int n;   //-32768 ~ +32767//
	unsigned short m;      //65535// 
	n = -123;
	printf("%d\n", sizeof(m));
	printf("%d\n", n);
	return 0;
}


int main(void)
{
	signed long int n; 		// 4//
	unsigned long int m;   //4//
	printf("%d\n", sizeof(n));

	return 0;
}


int main(void)
{
	unsigned long long int n; 
	printf("%u\n", sizeof(n));    //8//
	return 0;
}


int main(void)
{
	//float double
	double f;
	f = -6.25;
	printf("%u\n", sizeof(f));
	return 0;
}

int main(void)
{
	float f;
	f = 0.9f;
	printf("%u\n", sizeof(0.9f));
	printf("%f\n", -6.25); 
	printf("%f\n", -6.25f);
	if(f == 0.9f)
	{
		printf("Yes\n");
	}
	else
	{
		printf("No\n");
	}
	return 0;
}


int main(void)
{
	int n;
	n = -123456789;
	unsigned long long m;
	m = 123456789ull;
	printf("%u\n",sizeof(-123456789ull));  // 8 //
	return 0;
}


int main(void)
{
	long long m = -123456789;  //8//
	short int s = 12345;   //2//
	printf("%d\n", s);
	return 0;
}


int main(void)    //有符号数和无符号数问题
{
	unsigned int n = 0;  
	int m = -6;   //补码形式存储
  
	if((n + m) > 0)
	{
		printf("Yes\n");
	}
	else
	{
		printf("No\n");
	}


	return 0;
}


int main(void)
{
	//"a" char[]  'a' char
	signed char c;
	c = '\x30'; 
	printf("%c\n", c);
//	printf("1234567890\n");
//	printf("ABCDEFG\r123\n", c);
//	printf("*ab*c\t*de\rf\tg\n");
	
	return 0;
}


int main(void)
{
	int k = 10;
	int n = 3;
	
	int i;

	srandom(time(NULL));
	for(i = 0;i < 10;++i)
	{
		n = random();
		printf("%d,", n % 50 + 50);
	}
	printf("\b \n");

	return 0;
}


int main(void)
{
	float i;
	i = 10.235;
	printf("%f\n", i++);
	printf("%f\n", i);   //11.235000//
	return 0;
}
#endif

int main(void)
{
	int i = 2;
	int k;
	k = 100;
	k = ++i + ++i + ++i;
//	i++;
//	i++;
//	i++;
//	k = i + i + i;
//	k = i+++i+++i++;
	printf("%d\n", k);
	return 0;
}
