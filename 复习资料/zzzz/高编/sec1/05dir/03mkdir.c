#include<unistd.h>
#include<stdio.h>


int main(int argc, const char *argv[])
{
	int ret = mkdir("test_dir",0777);
	if(-1 == ret)
	{
		fprintf(stderr,"mkdir errorr\n");
	}
	else
	{
		fprintf(stderr,"mkdir correct...\n");
	
	}
	return 0;
}
