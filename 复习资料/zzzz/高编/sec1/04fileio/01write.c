#include<stdio.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<string.h>
int main(int argc, const char *argv[])
{
	int fd = open("test1",O_WRONLY| O_CREAT,0666);
	if(-1 == fd)
	{
		fprintf(stderr,"open file error");
		return 0;
	}

	char buf[50]="这个是open，write的测试\n";
	write(fd,buf,strlen(buf));
	while(1);
	close(fd);
	return 0;
}
