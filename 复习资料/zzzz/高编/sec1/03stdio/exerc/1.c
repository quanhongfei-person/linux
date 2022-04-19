#include<stdio.h>
#include<stdlib.h>


int main(int argc, const char *argv[])
{
	FILE*fp=fopen("./test1","r");
	if(NULL==fp)
	{
		fprintf(stderr,"fopen error!");
		return 0;
	}
	int buf[26]={0};
	while(1)
	{
		int c = 0;
		c= fgetc(fp);
		if(feof(fp)) break;
		
		buf[c - 97]++;
	
	}
	int i = 0;
	for(i=0;i<26;i++)
	{
		printf("%c %d\n",i,buf[i]);
	}
	
	fclose(fp);
	
}