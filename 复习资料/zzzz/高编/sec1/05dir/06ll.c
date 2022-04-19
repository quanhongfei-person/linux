// ll /home/linux
#include<stdio.h>
#include <dirent.h>
#include<unistd.h>
 #include <sys/types.h>
       #include <sys/stat.h>
       #include <unistd.h>
#include<string.h>
#include<time.h>
#include <pwd.h>
#include <grp.h>

int main(int argc, const char *argv[])
{
	
	
	char path[256]={0};
	if(NULL == argv[1])
	{
		getcwd(path,256);
	}
	else
	{
		strcpy(path,argv[1]);
	}


	DIR* dir = opendir(path);
	if(NULL == dir)
	{
		fprintf(stderr,"opendir error %s\n",path);
		return 0;
	}
	struct dirent* dir_info;
	while(dir_info = readdir(dir))
	{
		struct stat  info;
		char aaa[1024]={0};
		sprintf(aaa,"%s/%s",path,dir_info->d_name);
		int ret = lstat(aaa,&info);
		if(-1 == ret)
		{
		fprintf(stderr,"stat %s\n",dir_info->d_name);
		return 0;
			
		}
	//-rw-rw-r-- 1 linux linux 1.1K  1月 30 14:19 01ls.c
	

		if(S_ISREG(info.st_mode))
		{
			fputc('-',stdout);	
		}
		if(S_ISDIR(info.st_mode))
		{
			fputc('d',stdout);	
		}
		if(S_ISCHR(info.st_mode))
		{
			fputc('c',stdout);	
		}
		if(S_ISBLK(info.st_mode))
		{
			fputc('b',stdout);	
		}
		if(S_ISFIFO(info.st_mode))
		{
			fputc('p',stdout);	
		}
		if(S_ISLNK(info.st_mode))
		{
			fputc('l',stdout);	
		}
		if(S_ISSOCK(info.st_mode))
		{
			fputc('s',stdout);	
		}

		//permission
		if(info.st_mode & S_IRUSR)
		{
			fputc('r',stdout);	
		}
		else
		{
			fputc('-',stdout);	
		}
		if(info.st_mode & S_IWUSR)
		{
			fputc('w',stdout);	
		}
		else
		{
			fputc('-',stdout);	
		}
		if(info.st_mode & S_IXUSR)
		{
			fputc('x',stdout);	
		}
		else
		{
			fputc('-',stdout);	
		}
			fputc(' ',stdout);
			printf("%d ",info.st_nlink);
			//printf("%d %d ",info.st_uid,info.st_gid);
			struct passwd * pw = getpwuid(info.st_uid);
			struct group *gr=getgrgid(info.st_gid);
			printf("%s %s ",pw->pw_name,gr->gr_name);
			printf("%ld ",info.st_size);
			//printf("%ld ",info.st_mtime);
			struct tm *tm_info;
			tm_info=localtime(&info.st_mtime);
			printf("%d月 %d %d:%d ",tm_info->tm_mon+1,
					tm_info->tm_mday,tm_info->tm_hour,
					tm_info->tm_min);
			printf("%s\n",dir_info->d_name);

	}
	closedir(dir);
	return 0;
}

