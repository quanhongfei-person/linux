#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include <sys/types.h>
       #include <sys/wait.h>



int main(int argc, const char *argv[])
{
	int i =0;
	pid_t pid[10];
	for(i=0;i<10;i++)
	{
		pid[i] = fork();
	
		if(pid[i]>0)
		{
			continue;
		}
		if(0 == pid[i])
		{
			printf("child pid:%d\n",getpid());
			sleep(rand()%5);
			exit(1);
		}
		if(pid[i]<0)
		{
			perror("fork");
			exit(1);
		}
	}

	pid_t recycle = waitpid(pid[4],NULL,0);
	printf("回收了第5个，pid is %d\n",recycle);
	return 0;
}
