#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

#include<string.h>


int main(int argc, const char *argv[])
{
	int fd[2];
	int ret = pipe(fd);
	if(-1 == ret)
	{
		perror("pipe");
		exit(1);

	}

	pid_t pid = fork();
	if(pid>0)
	{
		close(fd[0]);
		char buf[1024]="hello,world, this is pipe test";
		//sleep(3);
		//写管道的时候，会管道破裂，gdb看下。
		write(fd[1],buf,strlen(buf));
		printf("++++++++\n");
	}
	if(0 == pid)
	{
		close(fd[1]);
		close(fd[0]);
		char buf[1024]={0};
		//read(fd[0],buf,1024);
		//printf("recv:%s\n",buf);
		while(1)sleep(1);
	
	}
	if(pid<0)
	{
	
	}

	return 0;
}
