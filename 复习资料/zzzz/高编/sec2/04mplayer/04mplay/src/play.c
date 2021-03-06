/*
 ============================================================================
 Name        : 04play.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<dirent.h>
#include<string.h>
#include<errno.h>
#define err_msg(msg) do{perror(msg);exit(1);}while(0)
int paly_flag = 0;
int do_ls(char* path)
{
	char new_path[128] = { 0 };
	if (NULL == path)
	{
		getcwd(new_path, 128);

	} 
	else
	{
		strcpy(new_path, path);

	}
	DIR* dir = opendir(new_path);
	if (NULL == dir)
		err_msg("opendir");
	struct dirent * dir_info;
	while (dir_info = readdir(dir))
	{

		if (strlen(dir_info->d_name) > 3)
		{
			if (0 == strcmp(&dir_info->d_name[strlen(dir_info->d_name) - 3],"flv")|| 0 == strcmp
			(&dir_info->d_name[strlen(dir_info->d_name)- 3], "mp4"))
			{
				printf("%s/%s\n", new_path, dir_info->d_name);

			}
		}
	}
	return 0;

}
int do_fifo(char* cmd)
{
	if(0 == paly_flag)return 0;
	int fd = open("/home/linux/myfifo",O_WRONLY);
	if(-1 == fd) err_msg("do_fifo");
	write(fd,cmd,strlen(cmd));
	close(fd);
	return 0;
}
int do_play(char* filename)
{
	pid_t pid = fork();
	if (0 == pid)
	{
		//execle(mplayer);
		execlp("mplayer","mplayer", "-slave","-quiet", "-input","file=/home/linux/myfifo",filename,NULL);
		exit(0);
	}
	return 0;
}
int main(void)
{

	int ret = mkfifo("/home/linux/myfifo", 0666);
	if (-1 == ret)
	{
		if (EEXIST != errno)
			err_msg("mkfifo");

	}
	while (1)
	{
		printf("mplayer>");
		fflush(stdout);
		char cmdline[128] = { 0 };
		fgets(cmdline, 128, stdin);
		cmdline[strlen(cmdline) - 1] = '\0';
		if (cmdline[0] == '\0')
			continue;
		char *cmd = NULL;
		char* arg = NULL;

		cmd = strtok(cmdline, " ");
		arg = strtok(NULL, "\0");
		if (0 == strcmp(cmd, "ls"))
		{
			do_ls(arg);

		}
		if (0 == strcmp(cmd, "play"))
		{
			do_play(arg);
			paly_flag =1;

		}
		if (0 == strcmp(cmd, "pause"))
		{
			do_fifo("pause\n");
		}
		if (0 == strcmp(cmd, "quit"))
		{
			do_fifo("quit\n");
			paly_flag = 0;
		}

		if (0 == strcmp(cmd, "exit"))
			exit(0);
	}
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
