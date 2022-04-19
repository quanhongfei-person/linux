


#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<fcntl.h>
#include<errno.h>
int main(int argc, const char *argv[])
{
	int ret = mkfifo("myfifo",0666);
	if(-1 == ret)
	{
		if(errno!= EEXIST)
		{
			perror("mkfifo");
			exit(1);
		}
	
		
	}

	int fifo_fd = open("./myfifo",O_RDONLY);
	if(-1 ==fifo_fd)
	{
		perror("open fifo");
		exit(1);
	}

	int i=5;
	char buf[1024]={0};
	while(1)
	{
		if(read(fifo_fd,buf,1024)>0)	
		printf("recv:%s\n",buf);
		else
			break;
	}

	close(fifo_fd);
	remove("./myfifo");
	return 0;
}
