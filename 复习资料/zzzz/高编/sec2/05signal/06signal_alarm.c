


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
void han(int num)
{
	printf("闹钟响了。。。\n");

	alarm(3);//sigalarm
}
int main(int argc, const char *argv[])
{
	signal( SIGALRM,han);
	alarm(5);//sigalarm
	while(1)
	{
	
		printf("++++++++++\n");
		sleep(1);
	
	}
	return 0;
}
