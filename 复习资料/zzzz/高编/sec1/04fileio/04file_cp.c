#include<stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	int src = open("./1.png",O_RDONLY);
	int dst = open("2.png",O_WRONLY|O_CREAT,0666);
	if(-1 == src || -1 ==dst)
	{
		fprintf(stderr,"open src dst error");
		return 0;
	}

	char buf[4096]={0};

	while(1)
	{
	int ret = read(src,buf,4096);
	if(0 == ret) break;

	write(dst,buf,ret);

	}

	close(src);
	close(dst);
	return 0;
}
