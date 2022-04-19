#include<stdio.h>
#include<unistd.h>
#include <sys/types.h>
#include <dirent.h>
int main(int argc, const char *argv[])
{
	DIR* dir = opendir("/home/linux");
	if(NULL == dir)
	{
		fprintf(stderr,"opendir error");
		return 0;
	}
	struct dirent * info;

	while(info = readdir(dir))
	{
		switch(info-> d_type)
		{
		case DT_BLK:
			printf("块设备\t");
		printf( "\033[1;31;40m %s\n\033[0m",info->d_name );
			break;

		case DT_CHR:

			printf("字符设备\t");
		printf( "\033[1;32;40m %s\n\033[0m",info->d_name );
			break;
		case DT_DIR:
			printf("目录\t");
		printf( "\033[1;33;40m %s\n\033[0m",info->d_name );

			break;
		case DT_FIFO:
			printf("管道\t");
		printf( "\033[1;34;40m %s\n\033[0m",info->d_name );

			break;
		case DT_LNK:
			printf("软链接\t");
		printf( "\033[1;35;40m %s\n\033[0m",info->d_name );

			break;
		case DT_REG:
			printf("普通文件\t");
		printf( "\033[1;36;40m %s\n\033[0m",info->d_name );
			break;
		case DT_SOCK:
			printf("套接字\t");
		printf( "\033[1;37;40m %s\n\033[0m",info->d_name );

			break;

		}
	}
	closedir(dir);
	return 0;
}

