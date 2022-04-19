


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
void handle(int num)
{
	static int i = 0;
	printf("老妈在叫你。。。。\n");
	i++;
	if(i>3)
	signal(SIGINT,SIG_DFL);

}
int main(int argc, const char *argv[])
{
	signal(SIGINT,handle);
	int i =10;
	while(i)
	{
	
		printf("我在玩游戏。。。。\n");
		sleep(1);
	}
	return 0;
}
