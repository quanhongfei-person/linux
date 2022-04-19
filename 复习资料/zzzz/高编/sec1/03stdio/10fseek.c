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

	fseek(fp,8,SEEK_SET);
	char buf[]="that";
	fwrite(buf,strlen(buf),1,fp);
	fclose(fp);
	return 0;
}
