#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct person {
	char name[32];
	char sex;
	int age;
	int score;
}DATATYPE;

typedef struct list
{
	DATATYPE *head;
	int tlen;
	int clen;
}SeqList;

/**********
 *molloc
 * *********/
SeqList * list_init(int size)
{
	SeqList * list = malloc(sizeof(SeqList));
	list->head = malloc(size *sizeof(DATATYPE));
	list->clen = 0;
	list->tlen = size;
}

/************
 *free
 * **********/
void Destroy_list(SeqList *list)
{
	free(list->head);
	free(list);
	printf("--------------\n释放完成\n");
	return ;
}

/***********
 *插入
 * *********/
int Insert_tail(SeqList *list, DATATYPE *data)
{
	if (list->clen < list->tlen)
	{
		strcpy(list->head[list->clen].name, data->name);
		list->head[list->clen].age = data->age;
		list->head[list->clen].sex = data->sex;
		list->head[list->clen].score = data->score;
		list->clen++;
	}
	else
	{
		printf("空间已经满了\n");
		return 1;
	}
}

/*************
*	打印
*	*************/
void show_list(SeqList *list)
{
	int i = 0;
	printf("--------------\n");
	for (i = 0; i < list->clen; i++)
	{
		printf("%s:%d:%c:%d\n", list->head[i].name, list->head[i].age, \
				list->head[i].sex, list->head[i].score);
	}

	return;
}

/*********
 *是否满了
 * ********/

int IsFullSeqList(SeqList *list)
{
	if(list->clen == list->tlen)
	{
		printf("空间满了！\n");
		return 1;
	}
	return 0;
}



/**********
 *是否为空
 * ************/
int IsEmptySeqList(SeqList *list)
{
	if(0 == list->clen)
	{
		printf("空间为空表");
	}
}

/**********
 *寻找
 * *********/
DATATYPE *find_list(SeqList *list, char *name)
{
	int i = 0;
	DATATYPE *find;

	for (i = 0; i < list->clen; i++)
	{
		find = &(list->head[i]);
		if (!strcmp(find->name, name))
		{
			return find;
		}
	}

	return 	NULL;
}

/*********
 *中间插入
 * ************/

int Insert_pos(SeqList *list, int pos, DATATYPE *data)
{
	if (!IsFullSeqList(list))
	{
		int i = 0;
		for (i = 0; i < list->clen - pos; i++)
		{
			list->head[list->clen-i] = list->head[list->clen-1-i];
		}
		list->head[pos] = *data;
		list->clen++;
	}
	else
	{
		printf("空间已经满了,不能中间插入\n");
	}
	return 0;
}

int revise_list(SeqList *list, char *name, DATATYPE *data)
{
	DATATYPE *result = find_list(list, name);

	if(NULL == result)
	{
		printf("查无此人,修改失败了\n");
		return 1;
	}
	else
	{
		memcpy(result , data, sizeof(DATATYPE));
	}
	return 0;
}

/************
 *删除
 * **************/
int delete_list(SeqList *list, int del)
{
	if(list->clen-del >= 0)
	{
		int i = 0;	
		for (i = del; list->clen-i > 0; i--)
		{
			memcpy(&(list->head[list->clen-i]), &(list->head[list->clen-i+1]), sizeof(DATATYPE));
		}
		list->clen--;

	}
	else
	{
		printf("此处为空\n");
	}

	return 0;
}
int main(int argc, const char *argv[])
{
	int i = 0;
	DATATYPE data1;
	DATATYPE data[3] = {
		{"刘备", 'm', 50, 90},
		{"张飞", 'm', 48, 80},
		{"曹操", 'm', 50, 92}
	};
	DATATYPE data2;

	SeqList *list = list_init(10);
	
	bzero(&data1, sizeof(data1));
	strcpy(data1.name, "关羽");
	data1.sex = 'm';
	data1.age = 49;
	data1.score = 90;
	Insert_tail(list, &data1);

	for (i = 0; i < 3; i++)
	{
		Insert_tail(list, &data[i]);
	}

	bzero(&data2, sizeof(data2));
	strcpy(data2.name, "刘禅");
	data2.sex = 'm';
	data2.age = 20;
	data2.score = 50;

	show_list(list);
	Insert_pos(list, 0, &data2);
	IsFullSeqList(list);
	IsEmptySeqList(list);
	DATATYPE *result= find_list(list, "刘备");
	printf("------------\n");
	if (result != NULL)
	{
		printf("查找结果如下:\n");
		printf("%s:%d:%c:%d\n", result->name, result->age, result->sex, result->score);
	}
	else
	{
		printf("查询无此人...\n");
	}
	
	printf("|插入后|\n");
	show_list(list);

	revise_list(list, "刘禅", &data[1]);
	printf("|修改后|\n");
	show_list(list);

	delete_list(list, 3);
	printf("|删除后|\n");
	show_list(list);

	Destroy_list(list);
	puts("!!!done!!!");
	
	return 0;
}
