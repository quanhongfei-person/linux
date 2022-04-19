#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>



int main(int argc, const char *argv[])
{
	pid_t pid = fork();
	if(pid>0)
	{
		sleep(10);
		printf("pid is %d\n",getpid());
	}
	if(0 == pid)
	{
		exit(1);
	
	}
	if(pid<0)
	{
		perror("fork");
		exit(1);
	}
	return 0;
}
