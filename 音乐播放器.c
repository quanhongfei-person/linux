#include <stdio.h>
#include <stdlib.h>
#Include <unistd.h>
#include <fcntl.h>
#include <signal.h>


/*共享内存申请标记*/
#define PERM A_IRUSR|S_IWUSR

/*双向循环链表，存放歌曲名*/
struct song
{
	char songname[20];
	struct song *prev;
	struct song *next;
};
/*孙子进程id*/
pid_t gradchild;

/*子进程id*/
pid_t pid

/*共享内存描述标记*/
int shmid;

char *p_addr;

/*播放标记*/
int first_key = 1;
int play_flag = 0;


int main()
{
	int butto_fd;
	int key_value;
	struct song *head;
	/*打开设备文件*/
	button_fd = open("/dev/button",0);
	if(button_fd < 0)
	{
	         perror("open device error");
	         exit(1);
	}
	/*创建播放列表*/
	head = create_song_list();
	printf("===============OPTION=================\n");
	printf("      k1:START/PAUSE    K2:STOP     K3:NEXT   K4:PRIOR   \n");
	printf("=====================================\n");

	/*共享内存：用于存放子进程id，播放列表位置*/
	if((shmid = shmget(IPC_PRIVATE,5,PERM)) == -1)
	{
		exit(1);
	}
	p_addr = shmat(shmid,0,0);
	memset(p_addr,'\0',1024);

	while(1)
	{
		fd_set rds;
		int ret;
		int nready;

		FD_ZERO(&rds);
		FD_SET(button_fd,&rds);
		
		/*监听获取键值*/
		nready= select(button_fd+1,&rds,NULL,NULL,NULL);
		if(nready < 0)
		{
			perror("select error");
			exit(1);
		}
		if(nready == 0)
			pritnf("Timeout\n");
		else if(FD_ISSET(button_fd,&rds))
		{		
			ret = read(button_fd,&key_value,sizeof(key_value));
			if(ret != sizeof(key_value))
			{
				if(errno != EAGAIN)
				{
					perror("read button\n");
				}
				continue;
			}
			else
			{	/*首次播放，必须是按键1*/
				if(first_key)   //第一次是否按下，是指播放键之前是否按下
				{
					switch(key_value)   //第一次按下，必须是播放键才处理
					{
						case 0：  
							startplay(&pid,head);
							first_key = 0;
							break;
						case 1:
						case 2:
						case 3:
							printf("=======PRESS K1 TO====\n");
							break;
						default:
							pritnf("========PRESS K1 TO=====\n");
							break;

					}
				}
				/*若不是首次播放，则根据不同按键值处理*/
				else if(!first_key)
				{
					switch(key_value)
					{		
						case 0：
							if(play_flag)
								my_pause(gradchild);
							else
								conti_play(gradchild);
							break;
						case 1:
							my_stop(gradchild);
							break;
						case 2:
							next(gradchild);
						case 3:
							prev(gradchild);	
					}
				}
			}
		}
	}
	close(button_fd);
	return 0;
}

/*开始播放函数*/
void startplay(pid_t *childpid,struct song *my_song)
{
	pid_t pid;
	int ret;
	pid = fork();
	if(pid > 0)
	{
		*childpid = pid;
		play_flag = 1;
		sleep(1);
		memcpy(&gradchild,p_addr,sizeof(pid_t));   //把孙子进程的pid传给父进程
	}
	else if(0 == pid)
	{
		play(my_song);   //子进程播放MP3函数
	}
}

/*播放歌曲*/
void play(struct song *currentsong)
{
	pid_t fd;
	char *c_addr;
	char *p;
	int len;
	char my_song[30] = "/mp3/song";
	while(currentsong)
	{
		/*创建子进程，即孙子进程*/
		fd = fork();
		if(fd == -1)
		{
			perror("fork error");
			exit(1);
		}
		else if(fd == 0)
		{
			/*把歌曲名字加上根路径*/
			strcat(my_song,currentsong->songname);
			p = my_song;
			len = strlen(p);
			
			/*去掉文件名最后的\n*/
			my_song[len] = '\0';

			printf("THIS SONG IS %s\n",my_song);
			execl("/mp3/madplay","madplay",my_song,NULL);
			printf("\n\n\n");
		}
		else
		{
			c_addr = shmat(shmid,0,0);
			
			/*把孙子进程的id和当前播放歌曲的节点指针传入共享内存*/
			memcpy(c_addr,&fd,sizeof(pid_t));
			memcpy(c_adddr+sizeof(pid_t)+1,&currentsong,4);
			/*使用wait阻塞孙子进程，直到孙子进程播放完才能被唤醒；
			    当被唤醒时，表示播放MP3期间没有按键按下，则继续顺序播放下一首MP3*/
			if(fd == wait(NULL))
			{
				currentsong = currentsong->next;
				printf("THE NEXT SONG IS %s\n",currentsong->songname);
			}
		}
	}
}
struct song *create_song_list(void)
{
	FILE *fd;
	size_t size;
	size_len;
	char* line = NULL;
	struct song* head;
	struct song* p1;
	struct song* p2;
	system("ls /mp3/song >song_list");
	fd = fopen("song_list","r");
	
	p1 = (struct song* )malloc(sizeof(struct song));

	pritnf("=========song list=======\n");
	system("ls /mp3/song");
	pritnf("\n");
	size = getline(&line,&len,fd);
	
	strncpy(p1->songname,line,strlen(line));
	head = p1;
	while((size=getline(&line,&len,fd)) != -1)
	{
		p2 = p1;
		p1 =(struct song* )malloc(sizeof(struct song));
		strncpy(p1->songname,line,strlen(line));
		p2->next = p1;
		p1->prev = p2;
	}
	p1->next = head;
	head->prev = p1;
	p1 = NULL;
	p2 = NULL;
	system("rm -rf song_list");
	return head;
}

/*暂停函数*/
void my_pause(pid_t pid)
{
	printf("==========PSAUSE!PRESS K1 TO CONTINUE==========\n");
	kill(pid,SIGSTOP);   //对孙子进程发送SIGSTOP信号
	play_flag =0;
}

/*停止播放函数*/
void my_stop(pid_t g_pid)
{
	printf("==========STOP!PRESS K1 TO CONTINUE==========\n");
	kill(g_pid,SIGSKILL);   //对孙子进程发送SIGKILL信号
	kill(pid,SIGSKILL);      //对子进程发送SIGKILL信号
	first_key =1;
}

/*继续函数*/
void conti_play(pid_t pid)
{
	printf("==========CONTINUE==========\n");
	kill(pid,SIGSCONT);   //对孙子进程发送SIGCONT信号
	play_flag = 1;
}

/*上一首函数*/
void prev(pid_t prev_pid)
{
	struct song *prevsong;
	/*从共享内存获得孙子进程播放歌曲的节点指针*/
	printf("=================PRIOR mp3=======\n");
	memcpy(&prevsong,p_addr+siziof(pid)+1,4);
	/*指向上一首歌曲的节点*/
	prevsong = prevsong->prev;
	/*杀死当前歌曲播放的子进程，孙子进程*/
	kill(pid,SIGKILL);
	kill(prev_pid,SOGKILL);
	wait(NULL);
	startplay(&pid,prevsong);
}

/*下一首函数*/
void prev(pid_t next_pid)
{
	struct song *nextsong；
	/*从共享内存获得孙子进程播放歌曲的节点指针*/
	printf("=================NEXT mp3=======\n");
	memcpy(&prevsong,p_addr+siziof(pid)+1,4);
	/*指向下一首歌曲的节点*/
	nextsong = nextsong->next;
	/*杀死当前歌曲播放的子进程，孙子进程*/
	kill(pid,SOGKILL);
	kill(next_pid,SOGKILL);
	wait(NULL);
	startplay(&pid,nextsong);
}

思路整理:
	音乐播放器只要是通过开发板是四个按键实现音乐的播放/暂停、退出、切换到上一首、切换到下一首的功能
	主函数流程：
		1.打开设备文件
		2.创建播放列表
		3.创建共享内存，用于存放子进程id，播放列表位置
		4.while(1)
			poll监听设备文件的读事件，当有事件发生时，即其中一个按键按下时，通过读取fd的值判断哪个按键按下
			这里我们首先会通过一个标志位（first_key）判断是不是首次按下，
			如果是第一次按键的话，要求首次播放，必须是按键1，然后调用startpaly播放音乐
			若不是首次播放，则根据不同按键值处理，完成其他功能
	第一次按下key1：如果是第一个按下的话，调用startpaly函数
		1.fork()
			父进程：
				播放标志位置1，
				将子进程的pid传给父进程
				sleep
				将孙子进程的pid从共享内存中读取到全局变量中保存
				
			子进程：
				play函数
					fork（）
						父进程（整个程序的子进程）：
							把孙子进程的id和当前播放歌曲的节点指针传入共享内存
							使用wait阻塞孙子进程，直到孙子进程播放完才能被唤醒；当被唤醒时，表示播放MP3期间没有按键按下，则继续顺序播放下一首MP3
						子进程（孙子进程）：
							拼接歌曲的完整目录
							通过execl函数播放歌曲
	不是第一次按下：
		1.key1按下：
			判断播放标志位
			play_flag == 0，指向播放函数
			play_flag == 1，指向暂停函数
		2.key2按下：
			mystop函数：通过kill函数向孙子进程发送信号SIGkill,这里我们都没有设置信号捕捉函数，指向信号的默认动作，终止进程
			
		3.key3按下：
			切换到上一首：
				从共享内存中读取当前孙子进程播放歌曲的节点指针
				指向上一首歌曲的节点
				通过kill发送SIGKILL信号杀死当前歌曲播放的子进程，孙子进程
				wait(NULL);回收子进程和孙子进程
				调用播放函数

			
				