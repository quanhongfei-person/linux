/*
 ============================================================================
 Name        : 07que.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>

typedef int DATATYPE;

typedef struct node {
	DATATYPE data;
	struct node *next;
}QueueNode;

typedef struct queue {
	QueueNode *head;
	QueueNode *tail;
}LinkQueue;

LinkQueue*	create_queue()
{
	LinkQueue*temp = malloc(sizeof(LinkQueue));
	if(NULL ==temp)
	{
		perror("create_queue malloc");
		return NULL;
	}
	temp->head = NULL;
	temp->tail=NULL;
	return temp;
}
int enter_queue(LinkQueue* que,DATATYPE *data)
{
	QueueNode* newnode = malloc(sizeof(QueueNode));
	if(NULL ==newnode)
		{
			perror("enter_queue malloc");
			return 1;
		}
	newnode->data = *data;
	newnode->next = NULL;
	if(NULL == que->tail)//empty queue   //为啥以队尾判断//
	{

		que->head = newnode;
		que->tail = newnode;
	}
	else
	{
		que->tail->next=newnode;
		que->tail = newnode;

	}
	return 0;
}
int quit_que(LinkQueue* que,DATATYPE* data)
{
	QueueNode* temp = que->head;
	if(NULL!=temp)
	{

		que->head = que->head->next;
		if(data)
		memcpy(data,&temp->data,sizeof(DATATYPE));
		free(temp);
		return 0;
	}
	else
	{
		return 1;

	}

}
int destroy_que(LinkQueue* que)
{
	while(1)
	{
		int ret = quit_que(que,NULL);
		if(1 == ret)break;
	}
	free(que);
	return 0;

}
int main(void)
{
	LinkQueue* que = create_queue();
	int arr[]={10,8,4,3,2,5};
	int i = 0 ;
	for(i=0;i<6;i++)
	enter_queue(que,&arr[i]);
	DATATYPE data;
	while(1)
	{
		int ret = quit_que(que,&data);
		if(0 == ret)
		{
			printf("%d ",data);

		}
		else
		{
			break;
		}



	}
	printf("\n");
	destroy_que(que);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
