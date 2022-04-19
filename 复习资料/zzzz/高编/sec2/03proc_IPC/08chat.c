#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	int fd1[2];
	int fd2[2];
	int ret1=pipe(fd2);
	int ret2=pipe(fd1);
	if(ret1==-1||ret2==-1)
	{
		perror("pipe error");
		exit(1);
	}
	pid_t pid=fork();

	while(1)
	{
		if(pid>0)
		{	
			close(fd2[1]);
			close(fd1[0]);
			char buf2[1024]={0};
			if(read(fd2[0],buf2,sizeof(buf2)))
			{	
				printf ("son:%s\n",buf2);
			}
			printf("to son：");
			char buf1[1024]={0};
			scanf("%s",buf1);
			write(fd1[1],buf1,strlen(buf1));
		}
		if(0==pid)
		{
			close(fd2[0]);
			close(fd1[1]);
			char buf1[1024]={0};

			char buf2[1024]={0};
			printf("to father:");
			fflush(stdout);
			scanf("%s",buf2);
			write(fd2[1],buf2,strlen(buf2));
			if(read(fd1[0],buf1,1024))
			{printf("from father：%s\n",buf1);}
		}
		if(pid<0)
		{
		}

		 
	}
	return
		0;
}


