


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

	int fifo_fd = open("./myfifo",O_WRONLY);
	if(-1 ==fifo_fd)
	{
		perror("open fifo");
		exit(1);
	}

	int i=5;
	char buf[]="this is fifo test...";
	while(i--)
	{
	
		write(fifo_fd,buf,strlen(buf));
		sleep(1);
	}

	close(fifo_fd);
	return 0;
}
