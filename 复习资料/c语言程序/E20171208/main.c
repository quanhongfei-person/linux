E20181208
#include <stdio.h>
#if 0
int main(void)
{
	int n;
	n = 2147483647;
	n = n + 1;       //正数溢出，变为最小负数，0111 1111 1111 1111 1111 1111 1111 1111
	printf("%d\n", n);//-2147483648//          1000 0000 0000 0000 0000 0000 0000 0000 
	
	return 0;       //先减1  			       0111 1111 1111 1111 1111 1111 1111 1111
}				    //再取反      			   1000 0000 0000 0000 0000 0000 0000 0000 = 21474836478(由于已标记为负数，则为-21474836478)

如  


int main()
{
	unsigned int a = 0x100000000; 
	int b = 0xffffffff;
	printf("a = %u, b = %\n",a ,b); 
	return 0;
}   
结果
	a = 0;  	//   	0001 0000 0000 0000 0000 0000 0000 0000 0000
				//  	     #### #### #### #### #### #### #### #### (32位int 型数据从最低位卡位数，截断a，取到都是0)
	b = -1;     //           1111 1111 1111 1111 1111 1111 1111 1111 (cpu 看到符号位是1，则先判断这是一个负数，)
				//先减一     1111 1111 1111 1111 1111 1111 1111 1110  
				//再取反     0000 0000 0000 0000 0000 0000 0000 0001 = 1(由于已标记为负数，则为-1)

int main(void)
{
	int n;
	unsigned int m;
	m = 0xCF178DFE;		//1100 1111 0001 0111 1000 1101 1111 1110  (cpu 看到符号位是1，则先判断这是一个负数)
						//1100 1111 0001 0111 1000 1101 1111 1101  (先减一)
						//0011 0000 1110 1000 0111 0010 0000 0010   (再取反 = 0x30E87202)
	printf("%d\n", m);   //-820539906//
	return 0;
}


int main(void)
{
	signed short int s;
	unsigned short int m;
	printf("%u\n", sizeof(m));
	return 0;
}


int main(void)
{
	signed long int l;		//long <=> int (4)
	unsigned long int ll;     //8
	printf("%d\n", sizeof(ll));
	return 0;
}


int main(void)
{
	signed long long int n;  //8
	unsigned long long int m;   //8
	printf("%d\n", sizeof(n));
	return 0;
}

int main(void)
{
	printf("%f\n",1.23e-3);  //0.000123
	float f;
	f = -6.25;
	printf("%u\n", sizeof(f));   //4//
	return 0;
}
#endif

int main(void)
{
	float f;
	f = 0.9f;    //浮点数都是近似等于 有精度损失（不能用直等==判断相等）
	printf("%u\n", sizeof(0.9f));
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
