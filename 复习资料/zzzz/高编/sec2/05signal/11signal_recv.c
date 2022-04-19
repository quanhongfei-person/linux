#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<signal.h>

void handle(int num)
{
	if(12 == num)
	{
		
	exit(0);
	}
}
int main(int argc, const char *argv[])
{
	signal(10,handle);
	signal(12,handle);
	int fd = open("temp",O_WRONLY|O_CREAT,0666);
	if(-1==fd)
	{
		perror("open temp");
		exit(1);
	}
	char buf[1024]={0};
	int pid = getpid();
	//read(fd,&pid,4);
	write(fd,&pid,4);
	close(fd);
//	pause();	
	fd = open("temp",O_RDONLY);
	if(-1==fd)
	{
		perror("open temp");
		exit(1);
	}


	int dst = open("new_kill.c",O_WRONLY|O_CREAT,0666);
	if(-1 ==dst)
	{
		perror("open dst");
		exit(1);
	}
	while(1)
	{
		pause();
		int ret =read(fd,buf,1024);
		write(dst,buf,ret);


	}


	//write(fd,&pid,4);

	return 0;
}
