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
	int i;
	for(i=97;i<123;++i)
	{
		int t=0,m=0;
		rewind(fp);
		while(1)
		{
			m=fgetc(fp);
			if(i==m)
			{
				++t;
			}
			if(m==EOF)
			{
				break;
			}
		}
		printf("the number of %c is %d\n",i,t);
	}

	fclose(fp);
	return 0;
}
