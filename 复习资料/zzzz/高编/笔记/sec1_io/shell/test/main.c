#include<stdio.h>


int main(int argc, const char *argv[])
{
	int i=0;
	printf("argc is %d\n",argc);
	for(i=0;i<argc;i++)
	{
		printf("arg[%d] is %s\n",i,argv[i]);
	}
	return 0;
}
