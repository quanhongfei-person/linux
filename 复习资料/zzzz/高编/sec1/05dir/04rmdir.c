#include<unistd.h>
#include<stdio.h>


int main(int argc, const char *argv[])
{
	int ret = rmdir("test_dir");
	if(-1 == ret)
	{
		fprintf(stderr,"rmdir errorr\n");
	}
	else
	{
		fprintf(stderr,"rmdir correct...\n");
	
	}
	return 0;
}
