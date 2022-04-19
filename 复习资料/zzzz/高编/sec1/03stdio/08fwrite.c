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
	
	printf("亲，输入个名字：");fflush(stdout);
	fgets(per.name,20,stdin);//lisi\n
	per.name[strlen(per.name)-1] = '\0';

	printf("亲，输入个年龄：");fflush(stdout);
	fgets(per.age,5,stdin);//lisi\n
	per.age[strlen(per.age)-1] = '\0';
	
	printf("亲，输入个性别：");fflush(stdout);
	fgets(per.sex,10,stdin);//lisi\n
	per.sex[strlen(per.sex)-1] = '\0';
	
	printf("亲，输入个地址：");fflush(stdout);
	fgets(per.addr,100,stdin);//lisi\n
	per.addr[strlen(per.addr)-1] = '\0';

	FILE* fp = fopen("tel","w");
	fwrite(&per,sizeof(per),1,fp);
	fclose(fp);
	return 0;
}
