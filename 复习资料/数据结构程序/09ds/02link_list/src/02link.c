/*
 ============================================================================
 Name        : 02link.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct person
{
	char name[32];
	char sex;
	int age;
	int score;
} DATATYPE;

typedef struct node
{
	DATATYPE data;
	struct node *next;
} LinkNode;

typedef struct list
{
	LinkNode *head;
	int tlen;
	int clen;
} LinkList;

LinkList* list_init(int size)
{
	LinkList * temp = malloc(sizeof(LinkList));
	if (NULL == temp)
	{
		perror("list_init Linklist");
		exit(1);
	}
	temp->tlen = size;
	temp->clen = 0;
	temp->head = NULL;

	return temp;

}



int insert_head(LinkList*list, DATATYPE* data)
{
	LinkNode* newnode = malloc(sizeof(LinkNode));
	if (NULL == newnode)
	{
		perror("insert_head newnode malloc");
		return 1;
		//exit(1);
	}
	newnode->next = NULL;
	newnode->data = *data; //memcpy

	newnode->next = list->head;
	list->head = newnode;
	list->clen++;
	return 0;

}

int insert_tail(LinkList*list, DATATYPE* data)
{
	LinkNode* newnode = malloc(sizeof(LinkNode));
	if (NULL == newnode)
	{
		perror("insert_head newnode malloc");
		return 1;
		//exit(1);
	}
	newnode->next = NULL;
	newnode->data = *data; //memcpy
	LinkNode* temp = list->head;

	if (NULL == temp)
	{
		list->head = newnode;
	} 
	else
	{
		while (temp->next)
		{
			temp = temp->next; //p++

		}
		temp->next = newnode;
	}
	list->clen++;
	return 0;
}
void show_list(LinkList* list)
{

	LinkNode* temp = list->head;
	while (temp)
	{
		printf("%s:%c:%d:%d\n", temp->data.name, temp->data.sex, temp->data.age,
				temp->data.score);

		temp = temp->next; //p++
	}
}

int destroy_list(LinkList* list)
{
	LinkNode* temp;

	while(list->head)
	{
		temp = list->head;
		list->head = temp->next;
		free(temp);
	}

	free(list);
	return 0;
}
LinkNode* find_list(LinkList* list,char* name)
{
	LinkNode* temp = list->head;
	while(temp)
	{
		if(0==strcmp(temp->data.name,name))
		{

			return temp;
		}
		temp=temp->next;
	}
	printf("查无此人，%s\n",name);
	return NULL;

}

int del_list(LinkList* list,char* name)   //?????问//
{
	LinkNode *q=list->head;
	LinkNode *p=list->head;
	if(NULL == list->head->next)        //当链表中只有一个节点的情况 且name在第一个 
	{
		if(0==strcmp(list->head->data.name,name))
		free(list->head);
		//free(list);
		list->head=NULL;
	}
	else                        //当链表中不止有一个节点的情况
	{
		while(p)
		{

			if(0==strcmp(p->data.name,name))             
			{
				if(p == q)                     //name在头
				{
					list->head = p->next;      //删除多节点链表的头节点
				}
				else						   //name在中间
				{
					q->next = p->next;         //删除多节点链表中间的节点
				}
				free(p);
				break;
			}
			else
			{

				q = p;
				p=p->next;       
			}

		}
	}
	return 0;
}
int main(void)
{
	LinkList* list = list_init(10);
	DATATYPE data[5] = { { "关二哥", 'm', 40, 90 }, { "张飞", 'm', 39, 80 }, { "曹操",
			'm', 42, 85 } ,
	{"关三哥", 'm', 45, 91 },
	{"关四哥", 'm', 48, 93 }
	};
	insert_head(list, &data[0]);
	insert_head(list, &data[1]);
	insert_head(list, &data[2]);
	insert_tail(list,&data[3]);
	insert_tail(list,&data[4]);
	show_list(list);

	LinkNode*temp = find_list(list,"关哥");
	if(temp)
	{
		printf("找到了，%s:%c:%d:%d\n", temp->data.name, temp->data.sex, temp->data.age,
				temp->data.score);

	}

	del_list(list,"曹操");
	printf("-------------------------\n");
	show_list(list);
	destroy_list(list);

	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
