#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>



int main(int argc, const char *argv[])
{
	pid_t pid = fork();
	if(pid>0)
	{
		int ret;
		while(1)
		{
			pid_t recycle_pid=	waitpid(pid,&ret,WNOHANG);
			if(recycle_pid == pid)
			{
				printf("回收成功，pid is %d\n",recycle_pid);
				break;
			}
			else
			{
				printf("回收到进程没有结束。。。稍后在试\n");
			}
		}


	}
	if(0 == pid)
	{
		printf("child pid:%d\n",getpid());
		sleep(10);
		exit(10);
	}
	if(pid<0)
	{
		perror("fork");
		exit(1);
	}
	return 0;
}
