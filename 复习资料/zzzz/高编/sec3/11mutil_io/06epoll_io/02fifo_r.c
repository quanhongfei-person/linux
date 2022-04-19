#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include<fcntl.h>
#include <sys/epoll.h>
int add_fd(int epfd,int fd)
{
	struct epoll_event  ev;
	ev.events=EPOLLIN;
	ev.data.fd = fd;
	int ret = epoll_ctl(epfd,EPOLL_CTL_ADD,fd,&ev);	
	if(-1 == ret)
	{
		perror("add_fd");
		exit(1);
	}
}
int main(int argc, const char *argv[])
{
	int fd = open("fifo",O_RDONLY);
	if(-1 == fd)
	{
		perror("open");
		exit(1);
	}
	struct epoll_event revent[2];
	int epfd = epoll_create(2);
	if(-1 == epfd)
	{
		perror("epfd");
		exit(1);
	}
	add_fd(epfd,0);
	add_fd(epfd,fd);
	while(1)
	{
		int ret = epoll_wait(epfd,revent,2,-1);
		printf("ret is %d\n",ret);
		int i = 0 ;
		for(i=0;i<ret;i++)
		{
			if(revent[i].data.fd == fd)
			{
			char buf[1024]={0};
			read(fd,buf,1024);
			printf("fifo:%s\n",buf);
			}
			if(revent[i].data.fd == 0)
			{
			char buf[1024]={0};
			bzero(buf,1024);
			fgets(buf,1024,stdin);
			printf("stdin:%s",buf);
			}
		}
	}
	return 0;
}
