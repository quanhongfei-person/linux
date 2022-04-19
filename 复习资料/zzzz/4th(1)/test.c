#include <stdio.h>

int c()
{
	printf("in c \n");
	return 0;
}

int b()
{
	printf("before c \n");
	c();
	printf("after c \n");
	return 0;

}


//char* p = "hello world";

int a(int n)
{
	if(n == 1)
		return 0;
	printf("before b \n");
	a(n-1);
	printf("after b \n");
	return 0;

}

int main()
{
	printf("before a \n");
	a(5);
	printf("after a \n");

	return 0;
}




