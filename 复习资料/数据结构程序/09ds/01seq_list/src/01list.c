/*
 ============================================================================
 Name        : 01list.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */
顺序表
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<unistd.h>

typedef struct person
{
	char name[32];
	char sex;
	int age;
	int score;
} DATATYPE;
//typedef int Datatype;
typedef struct list
{
	DATATYPE *head;
	int tlen;
	int clen;
} SeqList;
int list_is_full(SeqList *list)
{
	if (list->clen == 10)
		return 1;
	else
		return 0;
}
int list_is_empty(SeqList *list)
{
	if (list->clen == 0)
		return 1;
	else
		return 0;
}
SeqList * list_init(int size)
{
	SeqList * list = malloc(sizeof(SeqList));
	list->head = malloc(size * sizeof(DATATYPE));
	list->clen = 0;
	list->tlen = size;
	return list;
}
void Destroy_list(SeqList * list)
{
	free(list->head);
	free(list);
	printf("释放完成\n");
	return;
}

int Insert_tail(SeqList *list, DATATYPE*data)
{
	if (!list_is_full(list))
	{
		strcpy(list->head[list->clen].name, data->name);
		list->head[list->clen].age = data->age;
		list->head[list->clen].score = data->score;
		list->head[list->clen].sex = data->sex;
		list->clen++;
	} 
	else
	{
		printf("空间已经满了a\n");
		return 1;
	}
	return 0;
}
void clean_list(SeqList *list)
{
	list->clen = 0;
}
int insert_pos(SeqList *list, int pos, DATATYPE*data)
{
	if (!list_is_full(list))
	{
		int i = 0;
		for (i = 0; i < list->clen - pos; i++)
		{
			list->head[list->clen - i] = list->head[list->clen - 1 - i];
		}
		list->head[pos] = *data;     //问题？？
		list->clen++;
	} else
	{
		printf("空间已经满了a\n");
		return 1;
	}
	return 0;

}
void show_list(SeqList *list)
{
	int i = 0;
	for (i = 0; i < list->clen; i++)
	{

		printf("%s:%d:%c:%d\n", list->head[i].name, list->head[i].age,
				list->head[i].sex, list->head[i].score);
	}
	return;
}
DATATYPE* find_list(SeqList *list,char* name)
{
	int i = 0 ;
	DATATYPE* temp;
	for(i =  0 ;i<list->clen;i++)
	{
		temp = &(list->head[i]);
		if(0==strcmp(temp->name,name))
			return temp;

	}

	return NULL;

}
int revise_list(SeqList *list,char*old_name,DATATYPE*data)
{

	DATATYPE* result = find_list(list,old_name);
	if(NULL == result)
	{
		printf("查无此人,修改失败了\n");
		return 1;
	}
	else
	{
		memcpy(result , data,sizeof(DATATYPE));

	}
	return 0;
}
int main(void)
{
	SeqList *list = list_init(10);

	DATATYPE data1;
	bzero(&data1, sizeof(data1));
	data1.age = 20;
	strcpy(data1.name, "关二哥");
	data1.score = 90;
	data1.sex = 'm';
	Insert_tail(list, &data1);
	DATATYPE data[3] = { { "张飞", 'm', 23, 80 }, { "刘备", 'm', 50, 91 }, { "曹操",
			'm', 49, 92 } };
	Insert_tail(list, &data[0]);
	Insert_tail(list, &data[1]);
	Insert_tail(list, &data[2]);

	DATATYPE data2;
	bzero(&data2, sizeof(data1));
	data2.age = 20;
	strcpy(data2.name, "赵云");
	data2.score = 90;
	data2.sex = 'm';
	insert_pos(list, 0, &data2);

	show_list(list);
	DATATYPE* result = find_list(list,"曹操");
	if(NULL == result)
	{
		printf("查无此人\n");
	}
	else
	{
		printf("%s:%d:%c:%d\n", result->name, result->age,
				result->sex, result->score);

	}
	printf("--------------------------------------------------------\n");
	revise_list(list,"赵云",&data[1]);
	show_list(list);
	Destroy_list(list);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
