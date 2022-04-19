#include<stdio.h>
#include<unistd.h>



int main(int argc, const char *argv[])
{
	char * env[]={"AAA=123","BBB=456",NULL};
	execle("test_env","test_env","1","2","3",NULL,env);
	printf("see ,error\n");
	return 0;
}
