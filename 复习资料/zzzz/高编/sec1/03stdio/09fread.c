#include<stdio.h>
#include<string.h>

typedef struct person
{
	char name[20];
	char  age[5];
	char sex[10];
	char addr[100];
}PER;
int main(int argc, const char *argv[])
{
	PER per;
	// '\0'
	//memset(&per,0,sizeof(per));
	bzero(&per,sizeof(per));
	
	FILE* fp = fopen("tel","r");
	//fwrite(&per,sizeof(per),1,fp);
	fread(&per,sizeof(per),1,fp);
	fclose(fp);
	printf("%s:%s:%s:%s\n",per.name,per.age,per.sex,per.addr);
	return 0;
}
