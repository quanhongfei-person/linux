#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	pid_t pid = fork();
	if(pid<0 || pid>0 )
	{
		exit(0);
	}
	setsid();
	chdir("/");
	umask(0); 
	int i =  0;
	for(i=0;i<1024;i++)
		close(i);
	while(1)
	{
		sleep(1);
	}
	return 0;
}
