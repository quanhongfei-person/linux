#include<stdio.h>
#include<unistd.h>
extern char **environ;

//int main(int argc,const char* argv[],const char* env[])
int main(int argc, const char *argv[])
{
	printf("argc is %d\n",argc);
	int i = 0 ;
	for(i=0;i<argc;i++)
		printf("%d %s\n",i,argv[i]);

	i=0;
	while(environ[i])
	{
		printf("%d %s\n",i,environ[i]);
		i++;
	}


	return 0;
}
