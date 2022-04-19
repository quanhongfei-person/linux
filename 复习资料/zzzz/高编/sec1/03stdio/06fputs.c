#include<stdio.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	FILE* fp = fopen("./test1","r+");
	if(NULL == fp)
	{
		fprintf(stderr,"fopen file errorr");
		return 0;
	}

	char buf[1024]="hello ,this fputs test";

	fputs(buf,fp);
	fflush(stdout);
	fclose(fp);

	return 0;
}
