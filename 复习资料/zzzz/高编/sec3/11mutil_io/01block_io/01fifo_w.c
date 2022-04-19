#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include<fcntl.h>
int main(int argc, const char *argv[])
{
	int ret = mkfifo("fifo",0666);  //创建文件fifo//
	/*函数说明：mkfifo()会依参数pathname 建立特殊的FIFO 文件,
	该文件必须不存在, 而参数mode 为该文件的权限 (mode%~umask), 因此umask 值也会影响到FIFO 文件的权限.
	Mkfifo()建立的FIFO 文件其他进程都可以用读写一般文件的方式存取. 当使用open()来打开FIFO 文件时, O_NONBLOCK 旗标会有影响。*/

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
