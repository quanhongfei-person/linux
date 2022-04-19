#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a =0;
	a=add(1,2);
	printf("add 1 2 is %d\n",a);
	a=sub(1,2);
	printf("sub 1 2 is %d\n",a);
	a=mul(1,2);
	printf("mul 1 2 is %d\n",a);
	a=div(1,2);
	printf("div 1 2 is %d\n",a);
	return 0;
}
