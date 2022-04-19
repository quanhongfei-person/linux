#include<stdio.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	char buf[1026]="hello";
	printf("%s",buf);
	fflush(stdout);
		
	while(1);
	return 0;
}
