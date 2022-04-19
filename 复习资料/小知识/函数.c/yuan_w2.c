#include<stdio.h>
#include<pthread.h>
#include<stdlib.h>
pthread_mutex_t mutex;
int num=10;

void* th1(void* arg)
{
	while(1)
	{
		pthread_mutex_lock(&mutex);
		if( 0 == num )
		{
		
			num = 10;
			pthread_mutex_unlock(&mutex);
			printf("%d\n",num);
			sleep(1);
		}
		else
			pthread_mutex_unlock(&mutex);
	}
}
void* th2(void * arg)
{
	while(1)
	{
		pthread_mutex_lock(&mutex);
		if(num!=0)
		{
			num--;
			pthread_mutex_unlock(&mutex);
			printf("%d\n",num);
			sleep(rand()%5);
		}
		else
			pthread_mutex_unlock(&mutex);
	}
}



int main(int argc, const char *argv[])
{
	pthread_t tid1,tid2;
	pthread_mutex_init(&mutex,NULL);
	pthread_create(&tid1,NULL,th1,NULL);
	pthread_create(&tid2,NULL,th2,NULL);
	pthread_join(tid1,NULL);
	pthread_join(tid2,NULL);
	pthread_mutex_destroy(&mutex);
	return 0;
}
