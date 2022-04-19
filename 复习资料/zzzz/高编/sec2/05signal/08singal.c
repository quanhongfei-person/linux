


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
typedef void (*sighandler_t)(int);

int main(int argc, const char *argv[])
{

	int i = 0 ;
	sighandler_t old_han;
	for(i=0;i<64;i++)
	{
		old_han = signal( i,han);
		if(SIG_ERR == old_han )
		{
			printf("signum %d 捕获失败\n",i);
		}
		else
		{
			printf("signum %d 捕获成功\n",i);
		}
	}
	return 0;
}
