#include<unistd.h>

#include<stdio.h>

int main(int argc, const char *argv[])
{
	char *arg[]={"firefox","www.baidu.com",NULL};
	char *arg2[]={"ls","-a","-lhF","--color=auto",NULL};
	//execvp(arg[0],arg);
	execvp("ls",arg2);
	printf("看见就错了\n");
	return 0;
}
