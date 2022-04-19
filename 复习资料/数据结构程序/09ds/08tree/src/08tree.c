/*
 ============================================================================
 Name        : 08tree.c
 Author      : yas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
typedef struct __TREE__
{
	char c;
	struct __TREE__* left;
	struct __TREE__* right;
}Tree;
char str[]="abdh##i##e#j##cf#k##gl###";
int num= 0;
void create_tree(Tree**T)
{
	char c= str[num++];
	if('#' ==c)
	{
		*T=NULL;
		return ;
	}
	else
	{
		*T= malloc(sizeof(Tree));
		if(NULL == *T)
		{
			perror("create tree malloc");
			return ;

		}
		(*T)->c = c;
		create_tree(&(*T)->left);
		create_tree(&(*T)->right);
	}

}

void prv_order(Tree* T)           //前序//     根左右
{
	if(!T)return ;
	printf("%c ",T->c);                 
	prv_order(T->left);					
	prv_order(T->right);				

}

void mid_order(Tree* T)           //中序//    左根右
{
	if(!T)return ;

	mid_order(T->left);
	printf("%c ",T->c);
	mid_order(T->right);

}

void behind_order(Tree* T)        //后序//     左右根
{
	if(!T)return ;

	behind_order(T->left);

	behind_order(T->right);
	printf("%c ",T->c);
}
int main(void)
{
	Tree* T;
	create_tree(&T);
	printf("前序\n");
	prv_order(T);
	printf("中序\n");
	mid_order(T);
	printf("后序\n");
	behind_order(T);
	puts("!!!done!!!"); /* prints !!!done!!! */
	return EXIT_SUCCESS;
}
