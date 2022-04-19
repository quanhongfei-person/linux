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
typedef struct sockaddr * SA;
#define err_msg(msg) do{perror(msg);exit(1);}while(0)
int main(void)
{
	int conn =socket(AF_INET ,SOCK_STREAM,0);
	if(-1 ==conn) err_msg("sock");
	struct sockaddr_in ser;
	bzero(&ser,sizeof(ser));
	ser.sin_family =AF_INET;
	ser.sin_port = htons(50000) ;
	ser.sin_addr.s_addr = inet_addr("127.0.0.1");
	int ret = connect(conn,(SA)&ser,sizeof(ser));
	if(-1 == ret) err_msg("conn");
	int i =5;
	while(i)
	{	
		char buf[1024]="this is tcp test...";
		write(conn,buf,strlen(buf));

		read(conn,buf,1024);
		printf("recv:%s\n",buf);
	
		sleep(1);


	}
	close(conn);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
