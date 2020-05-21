#include <stdio.h>
#include <string.h>
#include "tree.h"

int main(int argc, char *argv[]){
	int echo = 0;
	char cmd[128];	// controls echoing, 0: echo off, 1: echo on
	if(argc > 1 && strcmp("-echo",argv[1])==0) {  // turn echoing on via -echo command line option
	echo=1;
       	}

 	printf("BST Demo\n");
 	printf("Commands:\n");
 	printf("  print:          shows contents of the tree in reverse sorted order\n");
 	printf("  clear:          eliminates all elements from the tree\n");
 	printf("  quit:           exit the program\n");
 	printf("  add <name>:     inserts the given string into the tree, duplicates ignored\n");
 	printf("  find <name>:    prints FOUND if the name is in the tree, NOT FOUND otherwise\n");
 	printf("  preorder:       prints contents of the tree in pre-order which is how it will be saved\n");
 	printf("  save <file>:    writes the contents of the tree in pre-order to the given file\n");
 	printf("  load <file>:    clears the current tree and loads the one in the given file\n");

  bst_t tree;
  bst_init(&tree);


  while(1){
	   printf("BST> ");                                                         // print prompt, type after this
	   int success = fscanf(stdin,"%s",cmd);
	   if(success==EOF){
		   printf("\n");                   
       break;
		 }

    else if( strcmp("print", cmd)==0 ){                                       // print command, calls revorder and prints tree
	   	if(echo){
			  printf("print\n");
		  }
		  bst_print_revorder(&tree);
	  }

	   else if( strcmp("quit", cmd)==0 ){                                       // check for exit command, if found, breaks
	   	if(echo){
			  printf("quit\n");
		  }
			break;
	   }

	  else if( strcmp("add", cmd)==0 ){                                         // inserts new node into tree using insert func
	   	fscanf(stdin,"%s",cmd);
		if(echo){
			printf("add %s\n",cmd);
		}
		bst_insert(&tree, cmd);
	   }

	   else if( strcmp("clear", cmd)==0 ){                                      // clears the current tree by calling the clear func
	   	if(echo){
		        printf("clear\n");
	        }
			bst_clear(&tree);

	   }
	   else if( strcmp("find", cmd)==0 ){                                       //finds a node in the tree
		   fscanf(stdin, "%s", cmd);
		   if(echo){
			   printf("find %s\n", cmd);
		   }
		   int result = bst_find(&tree, cmd);                                     //if find returns 1, print FOUND
			 if (result == 1){
				 printf("%s\n", "FOUND");
			 }
			 else{
				 printf("%s\n", "NOT FOUND");                                         //if find returns 0, print NOT FOUND
			 }
	   }

	   else if(strcmp("preorder", cmd)==0 ){                                    //prints back the tree in preorder by calling preorder func
		   if(echo){
			   printf("preorder\n");
		   }
		   bst_print_preorder(&tree);
	   }
	   else if( strcmp("save", cmd)==0 ){                                       //saves the tree by writing to a file by calling save func
		   fscanf(stdin,"%s",cmd);
		   if(echo){
			   printf("save %s\n", cmd);
		   }
		   bst_save(&tree, cmd);
	   }
	   else if( strcmp("load", cmd)==0){                                        //loads the current tree by calling the load func
		   fscanf(stdin, "%s", cmd);
		   if(echo){
			   printf("load %s\n", cmd);
		   }
		   bst_load(&tree, cmd);
	   }

		 else {																																		//if any other command is given, print unknown command
			 if (echo) {
			   printf("%s\n", cmd);
		 	 }
			 printf("Unknown command '%s'\n", cmd);
		 }

   }
	 bst_clear(&tree);																													//clear the tree at the end of the commands and return
	 return 0;
}
