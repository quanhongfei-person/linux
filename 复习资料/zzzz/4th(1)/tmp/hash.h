#ifndef _HASH_H
#define _HASH_H

#include <stdio.h>
#include <stdlib.h>

typedef struct node{
	int data;
	struct node* next;
}Node;

Node* build_hash(int *pa);
void show(Node* head);
int search(Node* head, int value);
void destroy(Node* head);
int test_fun();

#endif

