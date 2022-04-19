#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include<fcntl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
int main(int argc, const char *argv[])
{
	int fd = open("fifo",O_RDONLY);
	if(-1 == fd)
	{
		perror("open");
		exit(1);
	}
	fd_set rd_set,temp;
	FD_ZERO(&rd_set);
	FD_ZERO(&temp);
	FD_SET(fd,&temp);
	FD_SET(0,&temp);
	char buf[1024]={0};
	while(1)
	{
		rd_set = temp;
		int ret = select(fd+1,&rd_set,NULL,NULL,NULL);
		printf("ret is %d\n",ret);
		if(FD_ISSET(fd,&rd_set))
		{
		bzero(buf,1024);
		read(fd,buf,1024);
		printf("fifo:%s\n",buf);
		}
		if(FD_ISSET(0,&rd_set))
		{
		bzero(buf,1024);
		fgets(buf,1024,stdin);
		printf("stdin:%s",buf);
		}
	}
	return 0;
}
