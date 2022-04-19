#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

#include<string.h>// /usr/include/ 
#include<sys/stat.h>  // /usr/include/linux 
#include<sys/types.h>
#include<fcntl.h>

int main(int argc, const char *argv[])
{
	int fd[2];
	int ret = pipe(fd);
	if(-1 == ret)
	{
		perror("pipe");
		exit(1);

	}

	pid_t pid = fork();
	if(pid>0)
	{
		close(fd[0]);
		char buf[1024]={0};
		//FILE * fp;
		int src=  open("1.png",O_RDONLY);
		if(-1 ==src)
		{
			perror("open 1.png");
			exit(1);
		
		}	
		while(1)
		{
			int ret = read(src,buf,1024);
			if(0 == ret) break;
			write(fd[1],buf,ret);
		//	write(fp,);
			//FILE -> fd   fileno();  fd -> FILE* fdopen
			//fread();

		}
		close(src);
		close(fd[1]);

	}
	if(0 == pid)
	{
		close(fd[1]);
		char buf[1024]={0};
		int dst = open("2.png",O_CREAT|O_WRONLY,0666);
		if(-1 == dst)
		{
			perror("open 2.png error");
			exit(1);
		}
		while(1)
		{
		int ret = read(fd[0],buf,1024);
		if(0 ==ret) break;
		write(dst,buf,ret);
		}
		close(dst);
		close(fd[0]);
	
	}
	if(pid<0)
	{
	
	}

	return 0;
}
