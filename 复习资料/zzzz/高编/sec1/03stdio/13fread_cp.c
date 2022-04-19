#include<stdio.h>
#include<string.h>
 #include <stdlib.h>



int main(int argc, const char *argv[])
{
	FILE* src = fopen("./1.png","r");
	FILE* dst = fopen("2.png","w");
	if(NULL ==src || NULL == dst)
	{
		fprintf(stderr,"fopen file error");
		return 0;
	}
	fseek(src,0,SEEK_END);
	long size = ftell(src);
	char* p ;
	
	rewind(src);

	fread(p,size,1,src);
	fwrite(p,size,1,dst);
	fclose(src);
	fclose(dst);
	free(p);

	return 0;
}
