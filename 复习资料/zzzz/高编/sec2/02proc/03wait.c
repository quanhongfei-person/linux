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
		printf("准备回收。。。\n");
		pid_t recycle = wait(&ret);
		printf("已经回收...\n");
		if( WIFEXITED(ret))
		{
			
			printf("recycle pid is %d,ret is %d\n",recycle,
			WEXITSTATUS(ret));

		}

		if(WIFSIGNALED(ret))
		{
		
			printf("recycle pid is %d,ret is %d\n",recycle,
			WTERMSIG(ret));
			
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
