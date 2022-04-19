#include<unistd.h>

#include<stdio.h>

int main(int argc, const char *argv[])
{
	//execlp("firefox","firefox","www.baidu.com",NULL);
	execlp("ls","ls","-a","-lhF","--color=auto",NULL);
	printf("看见就错了\n");
	return 0;
}
