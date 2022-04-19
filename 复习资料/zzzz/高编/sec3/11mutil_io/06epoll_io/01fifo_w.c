#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include<fcntl.h>
int main(int argc, const char *argv[])
{
	int ret = mkfifo("fifo",0666);
	if(-1 == ret)
	{
		perror("mkfifo");
			exit(1);
	}
	
	int fd = open("fifo",O_WRONLY);
	if(-1 == fd)
	{
		perror("open");
		exit(1);
	}

	while(1)
	{
		char buf[]="fifo,test";
		write(fd,buf,strlen(buf)+1);
		sleep(1);
	
	
	}
	return 0;
}
