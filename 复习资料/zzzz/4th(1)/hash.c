#include <stdio.h>
#include <stdlib.h>

typedef struct node{
	int data;
	struct node* next;
}Node;

Node* build_hash(int *pa)
{
	Node* head = malloc(sizeof(Node)*8);	
	
	int i;	
	for(i=0; i<8; i++)
	{
		head[i].data = -1;
		head[i].next = NULL;	
	}	
	
	Node* find = NULL;
	int tmp;	
	for(i=0; i<8; i++)
	{
		tmp = pa[i] % 8;
		if(head[tmp].data == -1)
			head[tmp].data = pa[i];
		else 
		{
			Node* new = malloc(sizeof(Node));	
			new->data = pa[i];
			new->next = NULL;
			find = &head[tmp];
			while(find->next  != NULL)
				find = find->next;
			find->next = new;
		}
	}
	return head;
}
void show(Node* head)
{
	int i;
	Node* tmp = head;
	Node* find = NULL;

	for(i=0; i<8; i++)
	{
		printf("[%d]: ", i);
		if(tmp[i].data != -1 )
		{
			find = &tmp[i];
			while(find)
			{
				printf("%d      ", find->data);
				find = find->next;
			}
		}
		printf("\n");
	}
}
int search(Node* head, int value)
{
	int tmp = value % 8;
	Node* find = &head[tmp];

	while(find){
		if(find->data == value){
			printf("success \n");
			return 0;
		}
		find = find->next;
	}
	printf("search failed, not found \n");
	return 1;
}
void destroy(Node* head)
{
	Node* find = head;
	Node* tmp = NULL;

	int i;
	for(i=0; i<8; i++){
		find = &head[i];
		while(find->next != NULL){
			tmp = find->next;
			find->next = tmp->next;
			free(tmp);	
		}
	}
	free(head);
}
int main()
{
	int a[8] = {12, 4, 90, 200, 3, 89, 45, 2567};	
	
	Node* head = build_hash(a);

	show(head);

	search(head, 2000);

	destroy(head);

	return 0;
}



