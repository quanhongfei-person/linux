#include<stdio.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<string.h>
int main(int argc, const char *argv[])
{
	int fd = open("test1",O_RDONLY);
	if(-1 == fd)
	{
		fprintf(stderr,"open file error");
		return 0;
	}

	char buf[1024]={0};
	int ret = read(fd,buf,1024);
	printf("size:%d\ncontext:[%s]\n",ret,buf);
	close(fd);
	return 0;
}
