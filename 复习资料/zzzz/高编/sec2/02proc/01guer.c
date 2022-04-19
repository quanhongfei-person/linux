#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>



int main(int argc, const char *argv[])
{
	pid_t pid = fork();
	if(pid>0)
	{
		exit(1);
	}
	if(0 == pid)
	{
		sleep(1);
		printf("ppid is %d\n",getppid());
	
	}
	if(pid<0)
	{
		perror("fork");
		exit(1);
	}
	return 0;
}
