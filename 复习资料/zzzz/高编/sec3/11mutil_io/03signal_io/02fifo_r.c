#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
       #include <sys/types.h>
       #include <sys/stat.h>
#include<fcntl.h>
#include<signal.h>
int fd;
void handle(int num)
{


		char buf[1024]={0};
		read(fd,buf,1024);
		printf("fifo:%s\n",buf);

}
int main(int argc, const char *argv[])
{
	
	signal(SIGIO,handle);
	 fd = open("fifo",O_RDONLY);
	if(-1 == fd)
	{
		perror("open");
		exit(1);
	}
	int flag = fcntl(fd,F_GETFL);
	flag = flag|O_ASYNC;
	fcntl(fd,F_SETFL,flag);
	
	fcntl(fd,F_SETOWN,getpid());
	
	while(1)
	{
		char buf[1024]={0};

		bzero(buf,1024);
		fgets(buf,1024,stdin);
		printf("stdin:%s",buf);

	
	}
	return 0;
}
