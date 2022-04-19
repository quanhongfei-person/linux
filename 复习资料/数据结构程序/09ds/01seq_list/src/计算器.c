#include <stdio.h>
#include <stdlib.h>
 
#define OK       1000
#define ERROR	 2000
 
/* 定义结点结构体 */
struct node
{
	int data;
	struct node *next;
};
typedef struct node Node;
 
/* 定义栈结构体 */
struct stack
{
	Node *top;
	int count;
};
typedef struct stack Stack;
 
/* 初始化栈 */
int InitStack(Stack *S)
{
	S->top = NULL;
	S->count = 0;
 
	return OK;
}
 
/* 判断栈空 */
int EmptyStack(Stack *S)
{
	return (S->count == 0) ? OK : ERROR;
}
 
/* 进栈 */
int Push(Stack *S, int e)
{
	Node *p = (Node *)malloc(sizeof(Node));
	if(p == NULL)
	{
		return ERROR;
	}
	p->data = e;
	p->next = S->top;
	S->top = p;
	S->count++;
 
	return OK;
}
 
/* 获取栈顶 */
int GetTop(Stack *S)
{
	if(NULL == S->top)
		return ERROR;
 
	return (S->top->data);
}
 
/* 自定义优先级 */
int Priority(char s)
{
	switch(s)
	{
		case '(':				//括号优先级最高
			return 3;
		case '*':
		case '/':				//乘除次之
			return 2;
		case '+':
		case '-':				//加减最低
			return 1; 
		default :
			return 0;
	}
}
 
/* 出栈 */
int Pop(Stack *S)
{
	int e;
 
	if (NULL == S->top)
		return ERROR;
 
	Node *p = S->top;
	e = p->data;
	S->top = p->next;
	free(p);
	S->count--;
 
	return e;
}
 
int main()
{
	Stack num, opt;
	char str[100] = {0};
	int i = 0, tmp = 0, j;
 
	if (InitStack(&num) != OK || InitStack(&opt) !=OK)
	{
		printf("Init Failure!\n");
		exit(1);
	}
 
	printf("Please input operator :\n");
	scanf("%s", str);
 
	while (str[i] != '\0' || EmptyStack(&opt) != OK)
	{
		if(str[i] >= '0' && str[i] <= '9')
		{
			tmp = tmp *10 + str[i] -'0';
			i++;
			if(str[i] < '0' || str[i] > '9')
			{
				Push(&num, tmp);
				tmp = 0;
			}
		}
		else
		{
			//进栈不运算
			if((EmptyStack(&opt) == OK) || (GetTop(&opt) == '(' && str[i] != ')') ||
			Priority(str[i]) > Priority(GetTop(&opt))) 
			{
				Push(&opt, str[i]);
				i++;
				continue;
			}
 
			//出栈不运算
			if (GetTop(&opt) == '(' && str[i] == ')')
			{
				Pop(&opt);
				i++;
				continue;
			}
 
			//出栈运算
			if ((str[i] != '\0' && EmptyStack(&opt) != OK) || (str[i] == ')' && GetTop(&opt)!= '(') || 
			Priority(str[i]) <= Priority(GetTop(&opt)))
			{
				switch (Pop(&opt))
				{
					case '+':
						Push(&num, Pop(&num) + Pop(&num));
						break;
					case '-':
						j = Pop(&num);
						Push(&num, Pop(&num) - j);
						break;
					case '*':
						Push(&num, Pop(&num) * Pop(&num));
						break;
					case '/':
						j = Pop(&num);
						Push(&num, Pop(&num) / j);
						break;
				}
				continue;
			}
		}
	}
	printf("result is:%d\n",Pop(&num));
 
}
