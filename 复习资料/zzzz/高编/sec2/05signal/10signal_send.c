#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<signal.h>


int main(int argc, const char *argv[])
{
	int fd = open("temp",O_RDONLY);
	if(-1==fd)
	{
		perror("open temp");
		exit(1);
	}
	char buf[1024]={0};
	int pid;
	read(fd,&pid,4);

	close(fd);
	fd = open("temp",O_WRONLY);
	if(-1==fd)
	{
		perror("open temp");
		exit(1);
	}


	int src = open("./01kill.c",O_RDONLY);
	if(-1 ==src)
	{
		perror("open 01kill");
		exit(1);
	}
	while(1)
	{
		int ret =read(src,buf,1024);
		if(0 == ret)break;
		write(fd,buf,ret);
		kill(pid,10);


	}
	kill(pid,12);
	close(fd);
	close(src);

	//write(fd,&pid,4);

	return 0;
}
