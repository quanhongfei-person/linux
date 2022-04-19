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

	char buf[50]="你好";
	lseek(fd,9,SEEK_SET);
	write(fd,buf,strlen(buf));
	close(fd);
	return 0;
}
