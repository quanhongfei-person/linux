#include<stdio.h>
#include<unistd.h>



int main(int argc, const char *argv[])
{
	char * env[]={"AAA=123","BBB=456",NULL};
	char* arg[]={"test_env","1","2","3",NULL};
	execvpe("./test_env",arg,env);
	printf("see ,error\n");
	return 0;
}
