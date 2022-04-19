#include<stdio.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	FILE* fp = fopen("test1","w");
	if(NULL == fp)
	{
		fprintf(stderr,"fopen file error");
		return 0;
	}

	char buf[5000];
	memset(buf,'A',5000);
	int i =0;
	for(i=0;i<4097;i++)
		fputc(buf[i],fp);

	while(1);

	return 0;
}
