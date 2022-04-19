#include<stdio.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	char buf[1026];
	memset(buf,'A',1026);
	
	int i = 0 ;
	for(i = 0 ;i<1025;i++)
		fputc(buf[i],stdout);
	while(1);
	return 0;
}
