#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/time.h>
sem_t sem1,sem2;
int number = 0;
void *thread_fcun_1()
{
	int i = 10;
		sem_wait(&sem2);
	while(i--)
	{
		if(number == 10)
		{
			printf("生存厂商：仓库已满！\n");
			fflush(stdout);
		}
		else
		{
			number += 1;
			printf("生产厂商：生产一个产品,现在产品总数%d个\n",number);
			fflush(stdout);
		}
		sleep(rand()%3);
	}
		sem_post(&sem1);
}

void *thread_fcun_2()
{
	int i = 10;
		sem_wait(&sem1);
	while(i--)
	{
		if(number == 0)
		{
			printf("商店：产品卖完了！\n");
			fflush(stdout);
		}
		else
		{
			number -= 1;
			printf("商店：卖出一个产品，现在剩余%d个产品！\n",number);
			fflush(stdout);
		}
		sleep(rand()%3);
	}
		sem_post(&sem2);
}
int main(int argc, const char *argv[])
{
	pthread_t tid1 = 0;
	pthread_t tid2 = 0;

	sem_init(&sem1,0,0);
	sem_init(&sem2,0,1);

	pthread_create(&tid1, NULL,thread_fcun_1, NULL);
	pthread_create(&tid2, NULL,thread_fcun_2, NULL);

	pthread_join (tid1, NULL);  
	pthread_join (tid2, NULL); 
	
	sem_destroy(&sem1);
	sem_destroy(&sem2);

	return 0;
}
