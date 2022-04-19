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
		memset(buf,'A',1024);
		int i = 0 ;
		i=65;
		while(i--)
		{
		write(fd[1],buf,strlen(buf));
		
		}
		printf("写入结束\n");
		sleep(3);
	}
	if(0 == pid)
	{
		close(fd[1]);
		char buf[1024]={0};
		while(1)sleep(1);
		read(fd[0],buf,1024);
		printf("recv:%s\n",buf);
	
	}
	if(pid<0)
	{
	
	}

	return 0;
}
