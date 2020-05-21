#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

struct node{
  int *x;
  struct node* next;

};

struct node* create_node(int i){
	struct node *temp = NULL;
	temp = (struct node *)malloc(sizeof(struct node));
	temp->x = (int *) malloc(sizeof(int));
	*(temp->x) = i;
	return temp;

}

void free_(struct node *n){
	struct node* temp;
	temp = n->next;
       	if (temp != NULL){
		free_(temp);
	}	
	free(n->x);
	free(n);
}

int main() {
    int i=0;
    struct node* first;
    struct node* prev ;
    struct node* temp;

    first=create_node(i);
    prev=first;
    while(i<10){
      i++;
      temp=create_node(i);
      prev->next=temp;
      prev=temp;
    }
    free_(first);
    return 0;
}
