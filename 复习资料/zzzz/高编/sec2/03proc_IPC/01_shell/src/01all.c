/*
 ============================================================================
 Name        : 01all.c
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
#include<wait.h>
int main(void)
{
	//linux@ubuntu:~/20180113/sec2/02proc$
	while(1)
	{
	char current_path[256]={0};
	char cmd_line[256]={0};
	char* arg[20]={NULL};
	getcwd(current_path,256);
	printf("[linux@ubuntu:%s]",current_path);
	fflush(stdout);
	fgets(cmd_line,256,stdin);//\n
	cmd_line[strlen(cmd_line)-1]='\0';
	if(cmd_line[0]=='\0') continue;
	//ls\0-l
	//cp 1 2
	//ps aux
	arg[0]=strtok(cmd_line," ");
	int i = 0;
	for(i=1;i<20;i++)
		arg[i] = strtok(NULL," ");
	//cd 123
	if(0==strcmp(arg[0],"cd"))
	{
		if(NULL == arg[1])
			chdir("/home/linux");
		else
		chdir(arg[1]);

		continue;

	}
	if(0==strcmp(arg[0],"#quit"))
		{
			exit(0);

		}
	pid_t pid=fork();
	if(pid>0)
	{

		wait(NULL);
	}
	if(0 == pid)
	{
		execvp(arg[0],arg);

		exit(1);

	}
	if(pid<0)
	{

		perror("fork");
		exit(1);
	}
	}
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
