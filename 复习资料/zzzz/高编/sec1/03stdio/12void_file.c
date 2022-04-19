

#include<stdio.h>


int main(int argc, const char *argv[])
{
	FILE* fp = fopen("test3","w");
	if(NULL == fp)
	{
		fprintf(stderr,"open file error");
		return 0;
	}

	fseek(fp,1024*1024*1024,SEEK_CUR);
	fputs("到此一游",fp);
	fclose(fp);
	return 0;
}
