


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
void handle(int num)
{
	wait(NULL);
}
int main(int argc, const char *argv[])
{
	signal(SIGCHLD,handle);
	pid_t pid = fork();
	if(0 == pid)
	{
		int i =3;
		while(i--)
		{
			printf("-----\n");
			sleep(1);
		}
	}
	if(pid>0)
	{
		int i =5;
		while(i)
		{
		
			printf("++++++++\n");
			sleep(1);
		}
	}
	if(pid<0)
	{
	
			perror("fork");
			exit(1);
	}
	return 0;
}
