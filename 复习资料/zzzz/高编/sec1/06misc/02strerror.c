#include<stdio.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	int i = 0;
	for(i=0;i<256;i++)
	{
	
		printf("%d %s\n",i,strerror(i));
	}
	
	return 0;
}
