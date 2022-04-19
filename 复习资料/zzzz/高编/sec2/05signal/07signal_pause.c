


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
void hanle(int num)
{
	if(SIGUSR1 == num)
	{
		printf("是user1 解除了pasue\n");
	}
	if(SIGUSR2 == num)
	{
		printf("是user2 解除了pasue\n");
	}
}
int main(int argc, const char *argv[])
{
	signal(SIGUSR1,hanle);
	signal(SIGUSR2,hanle);
	printf("befor pause pid:%d\n",getpid());
	pause();
	printf("after pause\n");
	return 0 ;
}
