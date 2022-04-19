#include<stdio.h>
#include<string.h>
#include <stdlib.h>
int insert(FILE*src,FILE*dst,int i)
{
	if(NULL==src||NULL==dst)
	{
		fprintf(stderr,"fopen error");
		return 0;
	}
	fseek(src,0,SEEK_END);
	long size=ftell(src);
	if(size<i) return -1;
	char*p=malloc(size);
	char a[]="hello";
	rewind(src);
	fread(p,i,1,src);
	fwrite(p,i,1,dst);
	fwrite(a,strlen(a),1,dst);
	fread(p,size-i,1,src);
	fwrite(p,size-i,1,dst);
	
	
	return 0 ;
}

int main(int argc, const char *argv[])
{
	FILE*src=fopen("./test","r");
	FILE*dst=fopen("test1","w+");
	if(NULL==src||NULL==dst)
	{
		fprintf(stderr,"fopen error");
		return 0;
	}
	
	insert(src,dst,10);
	fclose(src);
	fclose(dst);
	return 0;
}

