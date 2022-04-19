#include<stdio.h>
#include<string.h>
#include <sys/types.h>
#include <dirent.h>
#include<unistd.h>
#include<errno.h>
#include<stdlib.h>
#include <sys/stat.h>
#include <sys/stat.h>
#include <sys/types.h>


void copydocuments(char* org_path ,char* dest_path)
{
	struct dirent* dir_info;
	DIR* dir;
	dir = opendir(org_path);
	if(NULL == dir)
	{
		perror("opendir fail");
		exit(0);
	}
	while(dir_info=readdir(dir))
	{
		if(dir_info->d_name[0] == '.')
			continue;
		if(DT_REG==dir_info->d_type)
		{
			char org_path1[256]={0};
			char dest_path1[256]={0};
			char buf[1024]={0};
			sprintf(org_path1,"%s/%s",org_path,dir_info->d_name);
	 		sprintf(dest_path1,"%s/%s",dest_path,dir_info->d_name);
			FILE * fp_org = fopen(org_path1,"r");
			FILE * fp_dest = fopen(dest_path1,"w");
			while(1)
			{
				fgets(buf,1024,fp_org);
				if(feof(fp_org))break;
				fputs(buf,fp_dest);
			}
			printf("%s--->%s\n",org_path1,dest_path1);
			fclose(fp_org);
			fclose(fp_dest);
		}
		if(DT_DIR==dir_info->d_type)
		{
			char new1_path[256]={0};
			char new2_path[256]={0};
			sprintf(new1_path,"%s/%s",org_path,dir_info->d_name);
			sprintf(new2_path,"%s/%s",dest_path,dir_info->d_name);
			mkdir(new2_path,0777);
			printf("dir:%s--->%s\n",new1_path,new2_path);
			copydocuments(new1_path,new2_path);
		}


	}

	closedir(dir);


}


int main()
{
	char copy_path[256]={0};
	char dest_path[256]={0};
	printf("请输入目标目录路径：\n");
	fgets(dest_path,256,stdin);
	dest_path[strlen(dest_path)-1]='\0';

	printf("请输入复制目录路径：\n");
	fgets(copy_path,256,stdin);
	copy_path[strlen(copy_path)-1]='\0';
	copydocuments(copy_path,dest_path);

	return 0;
}
