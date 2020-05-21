
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "tree.h"

void move_array(char arr1[], char arr2[]);


void bst_init(bst_t *tree){                                                   //initializes the tree and gives it a null root anda size of 0
	tree->root = NULL;
	tree->size =0;

}
int bst_insert(bst_t *tree, char name[]){                                     //inserts a name into the bst
	node_t *pointer = tree->root;                                               //sets a pointer to the root of the tree

	if (pointer == NULL){                                                       //if there are no nodes in the tree
		node_t *newnode = malloc(sizeof(node_t));                                 //allocates an array of size of the node_t which is 128
		tree->root = newnode;
		move_array(newnode -> name, name);                                        //moves character by character to the allocated array
		newnode -> left = NULL;                                                   //sets left and right to null because it is being added to the end
		newnode -> right = NULL;
		tree->size = tree->size + 1;                                              //tree is one node bigger now
	} else {
		while(pointer != NULL){                                                   //else while the pointer is pointing to a node
			int string_compare = strcmp(name, pointer->name);                       //compare the strings

			if (string_compare < 0){                                                //if the new name is less than the node we are looking at
				if (pointer->left == NULL){                                           //if the left is null
					node_t *newnode = malloc(sizeof(node_t));                           //allocate the array and put the node there
					move_array(newnode -> name, name);
					newnode -> left = NULL;
					newnode -> right = NULL;
					tree->size = tree->size+1;
					pointer->left = newnode;
				  return 1;
				}
				pointer = pointer->left;                                              //otherwise just go to the left
			}
			else if (string_compare > 0){                                           //if the new name is more than the node we are looking at
				if (pointer->right == NULL){                                          //if the right is null
					node_t *newnode = malloc(sizeof(node_t));                           //allocate the array and put the node there
					move_array(newnode -> name, name);
					newnode -> left = NULL;
					newnode -> right = NULL;
					tree->size = tree->size+1;
					pointer->right = newnode;
					return 1;
				}
				pointer = pointer->right;                                             //otherwise just go to the right
			} else {
				return 0;
			}
		}
	}
	return 0;
}


int bst_find(bst_t *tree, char name[]){                                       //finds a name in the tree
	if (tree->root == NULL){                                                    //if there is no tree return 0
		return 0;
	}
	else{
		node_t *pointer = tree->root;

		while(pointer != NULL){                                                   //while the pointer points tot a node

			if (strcmp(pointer->name, name) == 0){                                  //if the string we are looking for the the node string match, return 1
				return 1;
			}

			else if (strcmp(pointer->name, name) > 0){                              //if they are more, go left
				pointer = pointer-> left;
			}
			else if(strcmp(pointer->name,name)< 0){                                 //if they are less, go right
				pointer = pointer -> right;
			}

		}
		return 0;
	}

}

void bst_clear(bst_t *tree){                                                  //clears the tree
	if(tree->root == NULL){                                                     //if there is no tree, return
		return;
	}
	node_remove_all(tree->root);                                                //call function below on the root node
	tree -> root = NULL;                                                        //initialize them to zero and null
	tree->size = 0;
	return;
}

void node_remove_all(node_t *cur){                                            //function goes all the way through the tree and frees up the memory
	if (cur != NULL){
		node_remove_all(cur->left);
		node_remove_all(cur->right);
		free(cur);
	}

}

void move_array(char arr1[], char arr2[]){                                    //moves characters from one array to the next
	for(int i =0; i<128; i++){
		arr1[i] = arr2[i];
	}
}

void bst_print_revorder(bst_t *tree){                                         //prints the contents of the tree in reverse order
	node_t *newnode = tree->root;
	node_print_revorder(newnode, 0);

}

void node_print_revorder(node_t *cur, int indent){                            //helper function
	if(cur == NULL){                                                            //if the current node is null, return
		return;
	}
	if(cur->right != NULL){                                                     //if the right is null, call the function on its right
		node_print_revorder(cur->right, indent+1);
	}
	int counter = 0;
	while(counter < indent){                                                    //print indents
		printf("  ");
		counter++;
	}
  printf("%s\n", cur->name);                                                  //if you go all the way right you wanna start coming back up and working the left nodes
	if(cur->left !=NULL){
			node_print_revorder(cur->left, indent+1);
	}
}


void bst_save(bst_t *tree, char *fname){                                      //save the file function
	node_t *newnode = tree->root;                                               //set node to root
	FILE *fl;
	fl = fopen (fname, "w");                                                    //open a file to write to

	if (fl == NULL){
		printf("%s", "File not found\n");                                         //if there is no file, return NULL
		return;
	}
	node_write_preorder(newnode, fl, 0);                                        //call the write funtion to write the nodes to the file
	fclose(fl);                                                                 //close it
}

void bst_print_preorder(bst_t *tree){                                         //prints the nodes in preorder
	node_t *newnode = tree->root;                                               //points to the root of the tree
	node_write_preorder(newnode, NULL, 0);                                      //recursively calls the write function
}

void node_write_preorder(node_t *cur, FILE *out, int depth){                  //write function, will write with or without file
	if(cur ==NULL){                                                             //return if current is null
		return;
	}
	if(out == NULL){                                                            //if we arent writing from a file

		int count = 0;
		while(count < depth){
			printf("  ");

			count++;
		}
		printf("%s\n", cur->name);                                                //print the name after above indentation
		if (cur->left != NULL){                                                   //work all the way left
			node_write_preorder(cur->left, NULL, depth+1);
		}
		if (cur->right !=NULL){                                                   //then work your way back right
			node_write_preorder(cur->right, NULL, depth+1);
		}

	}
	else {
		int count = 0;
		while(count < depth){
			fprintf(out, "  ");
			count++;
		}
		fprintf(out, "%s\n", cur->name);

		if (cur->left != NULL){                                                   //same as above if we are writing from a file
			node_write_preorder(cur->left, out, depth+1);
		}
		if (cur->right !=NULL){
			node_write_preorder(cur->right, out, depth+1);
		}
	}
}

int bst_load(bst_t *tree, char *fname ){									                    //saves the tree
	FILE *fl;
	fl = fopen(fname, "r");                                                     //opens the file
	bst_clear(tree);																														//clears the tree
	if(fl == NULL){																															//if file is null, return 0
		printf("File not found\n");
		return 0;
	}
	int loaded = 1; 																														//variable to scan as long as there is something to scan
	char next[128];
	while (loaded > 0){                                                         //as long as there is something to scan, scan the next string
		loaded = fscanf(fl, "%s", next);
		if (loaded == 0) {                                                        //break if theres nothing to scan
			break;
		}
		bst_insert(tree,next);																										//calls insert and puts the nodes in
	}
	fclose(fl);                                                                 //closes file
	return 1;
}
