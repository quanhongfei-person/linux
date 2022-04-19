


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
int main(int argc, const char *argv[])
{
	signal(SIGINT,SIG_IGN);
	int i =10;
	while(i--)
	{
	
		printf("+++++++++++\n");
		sleep(1);
	}
	return 0;
}
