/*
 ============================================================================
 Name        : 03dou.c
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
	char age[4]; //atoi strtol
	char score[5];

} DataType;
typedef struct __NODE__
{

	DataType data;
	struct __NODE__ *pri;
	struct __NODE__ *next;
} Node, *LinkList;
int insert_head(Node** first, DataType *data)
{

	Node* newnode = malloc(sizeof(Node));
	if (NULL == newnode)
	{
		perror("insert_head malloc newnode");
		return 1;
	}

	memcpy(&(newnode->data), data, sizeof(DataType));
	newnode->next = NULL;
	newnode->pri = NULL;
	if (NULL == *first)
	{
		*first = newnode;
	} 
	else
	{
		newnode->next = *first;
		(*first)->pri = newnode;
		*first = newnode;

	}
	return 0;
}
int insert_pos(Node**first, int pos, DataType *data)
{
	Node* temp = *first;
	if (NULL == *first)
	{
		insert_head(first, data);

	} 
	else
	{
		int i = pos;
		for (; i > 0; i--)
		{

			temp = temp->next;

		}
		Node* newnode = malloc(sizeof(Node));
		if (NULL == newnode)
		{
			perror("insert_head malloc newnode");
			return 1;
		}

		memcpy(&(newnode->data), data, sizeof(DataType));
		newnode->next = NULL;
		newnode->pri = NULL;

		newnode->next = temp->next;
		newnode->pri = temp;
		temp->next->pri = newnode;
		temp->next = newnode;
	}
	//if()
	return 0;
}
void show(Node* first)
{
	Node *temp = first;
	while (temp)
	{

		printf("%s:%s:%s\n", temp->data.name, temp->data.age, temp->data.score);
		temp = temp->next;
	}

}

int del_post(Node**first, int pos)
{

	Node* temp = *first;
	if(0 == pos)
	{
		*first= temp->next;
		temp->next->pri =NULL;

	}
	else
	{
		int i = 0;
		for (i = 1; i <= pos; i++)
		{
			temp = temp->next;
			if (NULL == temp)
			{
				printf("没有数据了\n");
				break;
			}
		}
		temp->next->pri = temp->pri;    
		temp->pri->next = temp->next;
	}
	free(temp);
	return 0;
}
int main(void)
{
	Node* first = NULL;
	DataType data[5] = { { "张飞", "30", "90" }, { "典伟", "31", "92" }, { "张辽",
			"32", "88" }, { "陆逊", "33", "89" }, { "夏侯吨", "34", "80" } };

	insert_pos(&first, 0, &data[4]);
	insert_head(&first, &data[0]);
	insert_head(&first, &data[1]);
	insert_head(&first, &data[2]);
	show(first);
	printf("------------------------\n");
	del_post(&first,0);
	show(first);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
