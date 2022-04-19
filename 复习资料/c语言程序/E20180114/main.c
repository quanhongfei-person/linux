E20180114
#include <stdio.h>
#include <math.h>
#if 0
int main(void)
{
	int n = -5;
	int m = -3;
	int k;

	k = n < -4 && m > -4;	//n < -4 < m 格式错误！
	printf("%d\n", k);
//	int a = 1, b = 2, c = 3;
//	printf("%d\n",sizeof(n > m));     //sizeof取字节长度
//	c > a + b; 
//	a = b + 1 > c

//	|x| > 2; <=>  x > 2 ||  x < -2
//	x < a + 1 and y < b  x < a + 1 && y < b

	return 0;
}


int main(void)   (短路  表达式截断)
{
	int i = -5, j = -5;
	int k;
//	k = i > -4 && ++j;  //双目运算符结合方向，自左向右。 
//	printf("%d\n", j);
//	k = i > -3 || ++j;
//	printf("%d\n", j);
	printf("%d\n", !i);
	printf("%d\n", i);
	k = !i && j++;           //优先级（！> && > ||）所以（i 先！ 再与（++i））
	printf("%d %d\n", i, j);

	return 0;
}

int main(void)           //闰年判断//
{
	int year = 2100;
	if(year % 4 == 0 &&  year % 100 != 0 || year % 400 == 0)
	{
		printf("Yes\n");
	}
	else
	{
		printf("No\n");
	}
	return 0;
}


int main(void)       //三个数比大小//
{
	int n = 10, m = 20, k = 30;
	int max;

	if(n > m)
	{
		max = n;
	}
	else
	{
		max = m;
	}

	if(max < k)
	{
		max = k;
	}

	printf("max = %d\n", max);

	return 0;
}

int main(void)            if语句
{
	int n = 1;
	char ch;

	if(!ch)
	{
		printf("OK\n");
	}
	return 0;
}

int main(void)            //if语句判断闰年//
{
	int year = -201888886, month = 13;
	int days;
	if(!(1 <= month && 12 >= month))
	{
		printf("error!\n");
		return 0;
	}
	if(2 == month)
	{
		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)	
		{
			days = 29;		
		}
		else
		{
			days = 28;
		}
	}
	else
	{
		if(1 == month || 3 == month || 5 == month || 7 == month || 8 == month || 10 == month || 12 == month)
		{
			days = 31;
		}
		else
		{
			days = 30;
		}
	}
	printf("%d\n", days);

	return 0;
}


int main(void)         //三目运算符
{                      //三数比大小
	int a = 10, b = 20, c = 15;    
	int max;
	
	//max = (a > b) ? a : b;
	max = ((a > b) ? a : b > c) ? (a > b) ? a : b : c;
	printf("max = %d\n", max);
/*	if(a > b)
	{
		max = a;
	}
	else
	{
		max = b;
	}*/
	return 0;
}


int main(void)              //switch...case语句--------适用于多情况//
{                              //成绩分类//
	char ch = 'G';
	char c1 = 'A';

	ch = 'A';
	switch(ch)   //switch(不能是浮点型数)
	{
	default:      		//除过下面各种case的情况走这里
		printf("error!\n");
		break;          //每种情况下，break不可省略，否则就成顺序执行。
	case 'A':
		printf("90~100\n");
		break;
	case 'B':
		printf("80~89\n");
		break;
	case 'C':
		printf("60~79\n");
		break;
	case 'D':
	case 'E':
		printf("less 60\n");
		break;
	}

	return 0;
}

int main(void)             //switch语句判断闰年//
{
	int year = 2018, month = 1;
	int days;

	switch(month)
	{
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12:
		days = 31;
		break;
	case 4:
	case 6:
	case 9:
	case 11:
		days = 30;
		break;
	case 2:
		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)	//(闰年条件=>四年一润，百年不润，四百年又润)
		{
			days = 29;
		}
		else
		{
			days = 28;
		}
		break;
	default:
		printf("error!\n");
		return 0;
		break;
	}
	printf("%d\n", days);

	return 0;
}


int main(void)                  //scanf输入函数//
{                                 //二元一次方程求根//
	double a, b, c, deta;
	scanf("%lf%lf%lf", &a, &b, &c);    //没有‘\n’换行符//
	deta = pow(b, 2) - 4 * a * c;     //pow求n次方函数
	
	if(!a)   //非0即为真，判断是否是二元方程式，ax^2 + bx + c = 0
	{
		printf("error!\n");
		return 0;
	}

	if(deta > 0)  //deta大于0，有两个根
	{
		double x1, x2;
		x1 = (-b + sqrt(deta)) / 2 * a;
		x2 = (-b - sqrt(deta)) / 2 * a;
		printf("x1 = %f, x2 = %f\n", x1, x2);
	}
	else if(0 == deta)	//deta等于0，有一个根  
	{
		double x;
		x = -b / 2 * a;
		printf("x = %f\n", x);
	} 
	else   //deta小于0，无实数根
	{
		printf("no realroot\n");
	}

	return 0;
}


int main(void)                          goto loop
                                    //100以内数求和//
{

	int i;
	int sum = 0;
	i = 1;

loop:
	if(i <= 100)
	{
		sum += i;
		++i;
		goto loop;
	}
	printf("%d\n", sum);

	

	return 0;
}


int main(void)             //while语句//
{                            //100以内数求和//
	int i = 0;
	int sum = 0;

	i = 101;
//	while(1)     //死循环，卡程序，不至于退出。
	{

	}
	while(i <= 100)
	{
		sum += i;
		++i;
	}
	printf("%d\n", sum);
	return 0;
}


int main(void)                     //do while语句,  (注意while后的";")//                                //100以内数求和//
{
	int i = 101;
	int sum = 0;
	do
	{
		sum += i;
		++i;
	}while(i <= 100);
	printf("%d\n", sum);
	return 0;
}


int main(void)                             //for语句循环//
                                          //100以内数求和//
{
	int i;
	int sum = 0;
	for(i = 0;i <= 100; ++i)
	{
		sum += i;
	}
	printf("%d\n", sum);
	return 0;
}


int main(void)                     //1000以内能被3整除的数//     
{
	int i;
	for(i = 0;i <= 1000;++i)
	{
		if(i % 3 == 0)        //如果能被3整除，则打印。
		{
			printf("%d\n", i);
		}
	}
	return 0;
}
#endif


int main(void)                    //嵌套语句//
                                     //求回文数 （12321） （12344321）这个数反着写和正着写值相同//
{

	int n = 1232;
	int m = 0, k;
	for(n = 0;n <= 10000;++n)
	{
		int x = n;    //x = 1232
		m = 0;
		while(x)   //x != 0 时
		{
			k =  x % 10; 	  //1232 % 10 = 123 ...2, k = 2
			x /= 10;          // x = (x)1232 / 10 = 123  (复合运算符 /=  )
			m  = m * 10 + k;  // 最低位变最高位，
		}
		if(n == m)  // 判断两数是否相等
		{
			printf("%d\n", n);
		}

	}
//	printf("%d\n", m);

	return 0;
}