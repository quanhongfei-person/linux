/*
 ============================================================================
 Name        : 05calc.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include<string.h>
/*typedef struct
{
	char name[32];
	char age[5];
	char score[5];
}DataType;*/
typedef int DataType;

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
//type 1 int
//type 2 char
int stack_push(Stack* stack,DataType *data,int type)
{
	if(stack_is_full( stack))
	{
		printf("栈已经满了，不能插入");
		return 1;
	}
	if(1==type)
	stack->head[stack->top] = *data;
	if(2 ==type)
		stack->head[stack->top] = *(char*)data;
	stack->top++;
	return 0;
}
DataType stack_pop(Stack* stack)
{

	DataType temp = stack->head[stack->top-1];
	stack->top--;
	return temp;


	//return NULL;
}
DataType  get_top(Stack* stack)
{
	DataType temp = stack->head[stack->top-1];
	return temp;
}
int flag = 0;
int num = 0;
void get_num(char a)
{
	num = num*10+ (a-'0');
	flag = 1;
}
int get_pro(char a)
{
	switch(a)
	{
	case '+':
	case '-':
		return 1;
	case '*':
	case '/':
		return 2;

	}
	return -1;
}
int get_result(int num1,int num2,int op)
{
	int result=0;
	switch(op)
	{
	case '+': result =num1+num2;break;
	case '-': result =num1-num2;break;
	case '*': result =num1*num2;break;
	case '/': result =num1/num2;break;



	}
	return result;
}
int main(void)
{
	printf("亲输入一个表达式:");fflush(stdout);
	//20*3+5\0
	char expres[256]={0};
	fgets(expres,256,stdin);
	expres[strlen(expres)-1]='\0';
	Stack *num_stack=stack_init(10);
	Stack *op_stack=stack_init(10);
	int num1=0;
	int num2 = 0;
	int op = 0;//char
	int result = 0;
	char *temp = expres;
	while(*temp!='\0')
	{
		if(*temp>='0' && *temp<='9')
		{

			get_num(*temp);
			temp++;
			continue;
		}
		if(1 == flag)
		{
		stack_push(num_stack,&num,1);
		num=0;
		flag=0;
		}
		if(*temp=='+'||*temp=='-'||*temp=='*'||*temp=='/')
		{

			if(stack_is_empty(op_stack)|| get_pro(*temp)>= get_pro(get_top(op_stack)))
			{
				char  a= *(char*)temp;
				stack_push(op_stack,(int*)&a,2);
				temp++;

			}
			else
			{
				num2= stack_pop(num_stack);
				num1 = stack_pop(num_stack);
				op = stack_pop(op_stack);
				result=  get_result(num1,num2,op);
				stack_push(num_stack,&result,1);


			}
		}

	}
	stack_push(num_stack,&num,1);


	while(!stack_is_empty(op_stack))
	{
		num2= stack_pop(num_stack);
						num1 = stack_pop(num_stack);
						op = stack_pop(op_stack);
						result=  get_result(num1,num2,op);
						stack_push(num_stack,&result,1);

	}

	printf("result :%d\n",get_top(num_stack));
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
