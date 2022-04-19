#include<stdio.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	FILE* fp = fopen("/etc/passwd","r");
	if(NULL == fp)
	{
		fprintf(stderr,"fopen file errorr");
		return 0;
	}

	char buf[1024]={0};

	fgets(buf,1024,fp);

	printf("context:[%s]",buf);
	fflush(stdout);
	fclose(fp);

	return 0;
}
