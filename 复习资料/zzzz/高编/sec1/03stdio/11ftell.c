#include<stdio.h>
#include<string.h>


int main(int argc, const char *argv[])
{
	FILE * fp =fopen("./test1","r+");
	if(NULL == fp)
	{
		fprintf(stderr,"fopen file errorr");
		return 0;
	}	

	fseek(fp,0,SEEK_END);
	long size = ftell(fp);
	printf("size:%ld\n",size);
	fclose(fp);
	return 0;
}
