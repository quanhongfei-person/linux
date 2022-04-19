#include<stdio.h>
#include<string.h>

//a.out 1 2
int main(int argc, const char *argv[])
{
	
	FILE * src  = fopen(argv[1],"r");
	FILE* dst = fopen(argv[2],"w");
	if(NULL == src || NULL ==dst)
	{
		fprintf(stderr,"fopen file errorr");
		return 0;
	}

	char buf[1024]={0};
	//while(fgets(buf,1024,src))
	//{
	//
	//fputs(buf,dst);
	//}
	while(1)
	{

	fgets(buf,1024,src);
	if(feof(src)) break;
	fputs(buf,dst);

	}

	fclose(dst);
	fclose(src);
	return 0;
}
