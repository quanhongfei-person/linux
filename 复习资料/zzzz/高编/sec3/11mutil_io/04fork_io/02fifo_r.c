#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
       #include <sys/types.h>
       #include <sys/stat.h>
#include<fcntl.h>
int main(int argc, const char *argv[])
{
	
	int fd = open("fifo",O_RDONLY);
	if(-1 == fd)
	{
		perror("open");
		exit(1);
	}
	pid_t pid = fork();
	if(pid>0)
	{
		while(1)
		{
			char buf[1024]={0};
			read(fd,buf,1024);
			printf("fifo:%s\n",buf);
		}
	}
	if(0 == pid)
	{
		while(1)
		{
			char buf[1024]={0};
			fgets(buf,1024,stdin);
			printf("stdin:%s",buf);
		}
	}
	if(pid<0)
	{
		perror("fork");
		exit(1);
	}
	return 0;
}
