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
	int flag = fcntl(fd,F_GETFL);
	flag = flag| O_NONBLOCK;
	fcntl(fd,F_SETFL,flag);
	flag = fcntl(fileno(stdin),F_GETFL);
	flag = flag| O_NONBLOCK;
	fcntl(STDIN_FILENO,F_SETFL,flag);
	while(1)
	{
		char buf[1024]={0};
		if(read(fd,buf,1024)>0)
		printf("fifo:%s\n",buf);

		bzero(buf,1024);
		if(fgets(buf,1024,stdin))
		printf("stdin:%s",buf);

	
	}
	return 0;
}
