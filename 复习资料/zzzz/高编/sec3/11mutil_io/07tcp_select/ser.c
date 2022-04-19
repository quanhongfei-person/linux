/*
   ============================================================================
Name        : 01ser.c
Author      : yas
Version     :
Copyright   : Your copyright notice
Description : Hello World in C, Ansi-style
============================================================================
*/

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include<string.h>
#include <arpa/inet.h>
#include<time.h>
#include <unistd.h>
/* According to POSIX.1-2001 */
#include <sys/select.h>

/* According to earlier standards */
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#define err_msg(msg) do{perror(msg);exit(1);}while(0)
int main(void)
{
	int listfd =socket(AF_INET ,SOCK_STREAM,0);
	if(-1 ==listfd) err_msg("sock");
	struct sockaddr_in ser,cli;
	bzero(&ser,sizeof(ser));
	bzero(&cli,sizeof(cli));
	ser.sin_family =AF_INET;
	ser.sin_port = htons(50000) ;
	ser.sin_addr.s_addr = INADDR_ANY;//man 7 ip 
	int ret = bind(listfd,(struct sockaddr *)&ser,sizeof(ser));
	if(-1 == ret) err_msg("bind");
	ret = listen(listfd,3);
	if(-1 == ret) err_msg("listen");
	socklen_t len = sizeof(cli);

	fd_set rd_set,temp;
	FD_ZERO(&temp);
	FD_ZERO(&rd_set);
	int maxfd =  listfd;
	FD_SET(listfd,&temp);
	int i = 0 ;
	while(1)
	{	
		rd_set = temp;
		ret= select(maxfd+1,&rd_set,NULL,NULL,NULL);
		printf("select ret is %d\n",ret);
		for(i = listfd;i<maxfd+1;i++)
		{
			if(FD_ISSET(i,&rd_set) && i == listfd)
			{
				int conn = accept(listfd,(struct sockaddr *)&cli,&len);
				if(-1 ==conn) err_msg("accept");
				printf("对方的ip是%s, 端口是%d\n",inet_ntoa(cli.sin_addr),ntohs(cli.sin_port));
				FD_SET(conn,&temp);	
				if(conn>maxfd)
					maxfd =conn;
			}
			//else
			if(FD_ISSET(i,&rd_set) && i!= listfd)
			{
				char buf[1024]={0};
				ret = read(i,buf,1024);
				if(0 == ret)//对方和服务器断开
				{
					printf("客户段断开了。。。\n");
					FD_CLR(i,&temp);
					close(i);

				}
				time_t tm;
				time(&tm);
				sprintf(buf, "%s %s",buf,ctime(&tm));

				write(i,buf,strlen(buf));
			}


		}

	}
	close(listfd);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
