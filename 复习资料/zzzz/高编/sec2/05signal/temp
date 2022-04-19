


#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

//a.out 1200
//atoi ascii to int 
//strto
int main(int argc, const char *argv[])
{
	//   0x2000
	if(argc<2)
	{
		//perror();
		fprintf(stderr,"不会用啊，这样用a.out pid\n");
		exit(1);
	}
	int ret = kill( atoi(argv[1]),9);
	if(-1 == ret)
	{
		perror("kill");
		exit(1);
	}
	else
		printf("关闭成功pid :%s\n",argv[1]);
	return 0;
}
