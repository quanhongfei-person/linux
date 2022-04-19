#include <unistd.h>
#include <stdlib.h>
#include <curses.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <time.h>
#include <pthread.h>
#include <semaphore.h>
sem_t sem_1,sem_2;
int flag_exit = 1;
char buf_1[] = {0};
typedef struct sockaddr* SA;
void* thread_1()
{
	while(1)
	{
		sem_wait(&sem_1);
		if(flag_exit)
		{
			move(0,0);
			int i;
			for(i = 117;i > 0;i--)
			{
				printw("~");
			}
			move(22,0);
			for(i = 117;i > 0;i--)
			{
				printw("~");
			}
			move(16,28);
			for(i = 61;i >= 0;i-- )
			{
				printw("~");
			}
			for(i = 0;i <= 21;i++)
			{
				move(i,0);
				printw("|");
			}
			for(i = 0;i <= 22;i++)
			{
				move(i,116);
				printw("|");
			}
			for(i = 0;i <= 22;i++)
			{
				move(i,28);
				printw("|");
			}
			for(i = 0;i <= 22;i++)
			{
				move(i,89);
				printw("|");
			}
			move(1,1);
			printw("The friends list:");
			move(1,30);	
			printw("Chat record:");
			move(1,90);
			printw("%s","This PC'ip:192.168.0.138");
		}
	sem_post(&sem_2);
	}
	return NULL;

}
struct parsing 
{
	char* check_code;  //校验码
	char* name;			//用户名
	char* information;   //信息
};
void* thread_2()
{
	struct parsing Temp;
	char head_0[] = "1_iptux_0#5#2:1:linux:ubuntu:257:0001";
	char head_1[] = "1_iptux_0#5#2:19:linux:ubuntu:288:66666666666666666";
	char head_2[] = "1_iptux_0#5#2:56:linux:ubuntu:65538:";   //下线通知
	char ip[20]="192.168.0.138";
	int conn = socket(AF_INET,SOCK_DGRAM,0);
	if(-1 == conn)
	{
		perror("Create socket failed!");
		exit(1);
	}
	struct sockaddr_in ser_1,ser_2,cli;
	bzero(&ser_1,sizeof(ser_1));
	ser_1.sin_family = AF_INET;
	ser_1.sin_addr.s_addr = htonl(INADDR_BROADCAST);
	ser_1.sin_port = htons(2425);
	bzero(&cli,sizeof(cli));
	int on = 1;
	int n = 1;
	int cli_len = sizeof(cli);
	setsockopt(conn, SOL_SOCKET,SO_BROADCAST,&on,sizeof(on));
	sendto(conn,head_0,strlen(head_0),0,(SA)&ser_1,sizeof(ser_1));

	while(1)
	{
		sem_wait(&sem_2);

		recvfrom(conn,buf_1,1024,0,(SA)&cli,&cli_len);

		move(n+1,90);

		printw("ip:%s",inet_ntoa(cli.sin_addr));

		bind(conn,(SA)&cli,sizeof(cli));
		
	//	connect();

		move(n+1,20);	
	//	printw("%s",buf_1);

		sendto(conn,head_2,strlen(head_2),0,(SA)&cli,sizeof(cli));



		char* temp = strtok(buf_1,":");
			  temp = strtok(NULL,":");
			  temp = strtok(NULL,":");
			  Temp.name = strtok(NULL,":");
			  Temp.check_code= strtok(NULL,":");	
	
		if(strcmp(Temp.check_code,"6291459") == 0 )
		{
			move(n+1,4);
			printw("%s",Temp.name);
			++n;
			if(n >= 20)
			{
				n = 1;
			}
		}
		move(n,1);
		printw("%02d:",n-1);
		refresh();
		sleep(1);
		sem_post(&sem_2);

	}		
	return NULL;

}

int main(int argc, const char *argv[])
{
	
	initscr();

	pthread_t tid1,tid2;

	sem_init(&sem_1,0,1);
	sem_init(&sem_2,0,0);

	pthread_create(&tid1,NULL,thread_1,NULL);
	pthread_create(&tid2,NULL,thread_2,NULL);
	pthread_join(tid1,NULL);
	pthread_join(tid2,NULL);
	sem_destroy(&sem_1);
	sem_destroy(&sem_2);

	endwin();
	return 0;

}

