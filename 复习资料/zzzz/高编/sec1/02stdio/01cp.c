

#include<stdio.h>

int main(int argc, const char *argv[])
{
	FILE* src, *dst;
	src= fopen("/etc/passwd","r");
	dst = fopen("test1","w");
	if(NULL == src || NULL == dst)
	{
		printf("fopen error");
		return 0;
	}

	while(1)
	{
	int c = fgetc(src);
	if(EOF == c) break;
	fputc(c,dst);
	}
	fclose(dst);
	fclose(src);
	
	return 0;
}
