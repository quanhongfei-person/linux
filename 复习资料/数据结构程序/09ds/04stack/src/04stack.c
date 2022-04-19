/*
 ============================================================================
 Name        : 04stack.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
typedef struct
{
	char name[32];
	char age[5];
	char score[5];
}DataType;

typedef struct
{
	DataType* head;
	int top;
	int tlen;
}Stack;
Stack* stack_init(int size)
{
	Stack* stack =malloc(sizeof(Stack));
	if(NULL == stack)
	{
		perror("stack_init malloc stack");
		return NULL;

	}
	stack->head = malloc(sizeof(DataType)*size);
	stack->top = 0;
	stack->tlen =size;
	return stack;
}
int destroy_stack(Stack* stack)
{
	free(stack->head);
	free(stack);
	return 0 ;
}

int stack_is_full(Stack* stack)
{
	if(stack->top == stack->tlen)
		return 1;
	else
		return 0;
}
int stack_is_empty(Stack* stack)
{
	if(stack->top == 0)
			return 1;
		else
			return 0;
}
int stack_push(Stack* stack,DataType *data)
{
	if(stack_is_full( stack))
	{
		printf("栈已经满了，不能插入");
		return 1;
	}
	stack->head[stack->top] = *data;
	stack->top++;
	return 0;
}
DataType* stack_pop(Stack* stack)
{
	if(stack_is_empty(stack))
	{
		printf("栈空了，不能弹出了！\n");
		return 1;
	}
	DataType* data ;
	*data = stack->head[stack->top];
	satck->top--;
	return data;
}
void show(Stack* stack)
{
	DataType *data;

	int i = 0 ;
	for(i=0;i<stack->top;i++)
	{
	data = stack_pop(stack);
	printf("%s:%s:%s\n",data->name,data->age,data->score);
	}
}
int main(void) {
	puts("!!!done!!!"); /* prints !!!done!!! */

	DataType data[5] = { { "张飞", "30", "90" }, { "典伟", "31", "92" }, { "张辽",
				"32", "88" }, { "陆逊", "33", "89" }, { "夏侯吨", "34", "80" } };
	Stack* stack = stack_init(10);
	stack_push(stack,&data[0]);
	stack_push(stack,&data[1]);
	stack_push(stack,&data[2]);
	stack_push(stack,&data[3]);
	stack_push(stack,&data[4]);

	return EXIT_SUCCESS;
}
