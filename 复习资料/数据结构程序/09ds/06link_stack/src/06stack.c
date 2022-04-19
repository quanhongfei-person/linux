/*
 ============================================================================
 Name        : 06stack.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct
{
	char name[32];
	char age[5];
	char score[5];
}Datatype;
typedef struct NODE
{
	Datatype data;
	struct NODE*next;
}Node;
int stack_push(Node** first,Datatype *data)
{
	Node* temp = malloc(sizeof(Node));
	if(NULL == temp)
	{
		perror("stack_push malloc ");
		return 1;
	}
	temp->data = *data;
	temp->next = NULL;
	if(NULL == *first)
	{
		*first = temp;
		//(*first)->next=NULL;
	}
	else
	{
		temp->next = *first;
		*first = temp;

	}
	return 0;
}

int stack_pop(Node** first,Datatype*data)
{
	if(NULL == *first)//empty stack
	{
		printf("stack  empty\n");
		return 1;
	}
	memcpy(data,&((*first)->data),sizeof(Datatype));
	Node* temp = *first;
	*first = temp->next;
	free(temp);
	return 0;
}
int main(void)
{
	Node* first=NULL;
	Datatype data[5] = { { "张飞", "30", "90" }, { "典伟", "31", "92" }, { "张辽",
					"32", "88" }, { "陆逊", "33", "89" }, { "夏侯吨", "34", "80" } };
	stack_push(&first,&data[0]);
	stack_push(&first,&data[1]);
	stack_push(&first,&data[2]);
	stack_push(&first,&data[3]);
	stack_push(&first,&data[4]);
	Datatype temp_data;
	//Node* temp = first;
	while(1)
	{
		Node* temp = first;
		if(NULL == temp)break;
		stack_pop(&first,&temp_data);
		printf("%s:%s:%s\n",temp_data.name,temp_data.age,temp_data.score);
		temp=temp->next;
	}

	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
