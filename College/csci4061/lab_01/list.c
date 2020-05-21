#include<stdio.h>
#include<stdlib.h>

struct node{
  int x;
  struct node * next;
};



struct node* create_list(struct node* head){

    //create first node
    head = (struct node*)malloc(sizeof(struct node));
    head->x=2;
    head->next=NULL;

    //create second node
    struct node * temp =(struct node*)malloc(sizeof(struct node));
    temp->x=6;
    temp->next=NULL;
    head->next=temp;

    //create third node
    struct node * temp2 =(struct node*)malloc(sizeof(struct node));
    temp2->x=10;
    temp2->next=NULL;
    head->next->next=temp2;

    return head;

}

void print_list(struct node* head){

  struct node* cur=head;

  while(cur!=NULL){
    printf("%d ", cur->x);
    cur=cur->next;
  }
  printf("\n");


}

struct node* insert_list (struct node* head, int num){
  //TO DO
  // create a node, store num there, and insert the node in the list so that the list remains in sorted order

  struct node* new_node = (struct node*)malloc(sizeof(struct node));
  new_node->x= num;

  struct node* cur_node = head;
  struct node* prev_node = NULL;

  if (cur_node->x >= new_node->x){
    new_node->next = cur_node;
    return new_node;
  }

  else{
    while(cur_node->x < new_node->x){
	prev_node = cur_node;
	cur_node=cur_node->next;

	if (cur_node == NULL){
		prev_node->next = new_node;
		return head;
	    }
 	 }
    }

  prev_node->next = new_node;
  new_node->next = cur_node;

  return head;
}

int main (int argc, char** argv){
  if (argc < 2) {

  		printf("Invalid number of args. Please enter 1 argument\n");
  		exit(1);
  	}
    int num = atoi(argv[1]);

    //build an initial list
    struct node * head;
    head = create_list(head);

    head = insert_list(head, num);

    print_list(head);

    return 0;


}
