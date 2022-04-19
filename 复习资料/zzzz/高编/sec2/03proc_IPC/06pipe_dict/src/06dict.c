/*
 ============================================================================
 Name        : 06dict.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#define MAX 19661
#define err_msg(msg) do{perror(msg);exit(1);}while(0)
int main(void)
{
	int pipd_fd[2];
	int ret = pipe(pipd_fd);
	if(-1 ==  ret) err_msg("pipe error");
	pid_t pid = fork();
	if(pid>0)
	{
		close(pipd_fd[0]);
		int dict_fd = open("dict.txt",O_RDONLY);
		if(-1 ==dict_fd) err_msg("open dict");
		char buf[4096]={0};
		while(1)
		{
			while(1)
			{
				ret = read(dict_fd,buf,4096);
				if(0 == ret)break;
				write(pipd_fd[1],buf,ret);
			}
			lseek(dict_fd,0,SEEK_SET);
		}
		close(dict_fd);
		close(pipd_fd[1]);
	}
	if(0 == pid)
	{
		close(pipd_fd[1]);
		FILE* fp = fdopen(pipd_fd[0],"r");
		if(NULL == fp) err_msg("fdopen ");
		char * words=NULL;
		char* mean =NULL;
		while(1)
		{
			int num = 0 ;
		printf("请输入个词:");
		fflush(stdout);
		char want_word[128]={0};
		fgets(want_word,128,stdin);

		want_word[strlen(want_word)-1]='\0';
		if(want_word[0] == '\0')continue;
		if(0 == strcmp(want_word,"#quit"))exit(0);

		char line_buf[1024]={0};
		while(fgets(line_buf,1024,fp))
		{//a                indef art one
			words=strtok(line_buf," ");
			mean=strtok(NULL,"\n");
			if(0==strcmp(words,want_word))
			{

				printf("%s:%s\n",want_word,mean);
				break;
			}

			num++;
			if(num>=MAX)
			{
				printf("没有找到你要的词%s\n",want_word);
				break;
			}
		}
		}


		close(pipd_fd[0]);


	}
	if(pid<0)err_msg("fork");

	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
