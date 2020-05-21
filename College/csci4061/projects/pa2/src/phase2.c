#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include "phase2.h"
// You are free to use your own logic. The following points are just for getting started
/* 	Map Function
	1)	Each mapper selects a Mapper_i.txt to work with
	2)	Creates a list of letter, wordcount from the text files found in the Mapper_i.txt
	3)	Send the list to Reducer via pipes with proper closing of ends
*/

void phase2(int *pipefds, int c, int m){
  // printf("%d\n", m);
  pid_t pid;
  int counts[26];
  memset(&counts[0], 0, sizeof(counts));
  if((pid = fork()) == -1){
    perror("fork");
    return;
  }
  if(pid == 0){
    // child
    // Calls phase2 recursively to create appropriate number of mappers
    if(c < m-1){
      phase2(pipefds, c+1, m);
      exit(0);
    }
    exit(0);
  }
  else if(pid >0){
    // parent
    wait(NULL);
    char * fl = (char *)malloc(sizeof(char)*26);
    strcpy(&fl[0], "./MapperInput/Mapper_");
    char int1[2];
    sprintf(int1, "%d", c);
    int len2 = strlen(int1);
    strcpy(&fl[21], int1);
    strcpy(&fl[21+len2], ".txt");
    // printf("%s\n", fl);
    FILE *fptr = fopen(fl, "r");
    if(!fptr){
      printf("Failed to open the file: %s\n", fl);
    }
    char txtFilePath[128];
    while(fgets(txtFilePath, 128, fptr)){

      // remove new line character ('\n') from path
      strtok(txtFilePath, "\n");

      // mark as readable, not writable (writable would cause contents to delete)
      FILE *txtFilePtr = fopen(txtFilePath, "r");

      char ch;
      char word[100];
      while((fgets(word, 100, txtFilePtr)) != NULL){
        ch = word[0];
        if(ch >= 'a' && ch <= 'z'){
          ++counts[ch - 'a'];
        }
	      else if(ch >= 'A' && ch <= 'Z'){
          //printf("A")
	       	++counts[ch - 'A'];
        }
      }
	    fclose(txtFilePtr);
    }
  write(pipefds[1+(c*2)], counts, sizeof(counts)+1);
  fclose(fptr);
  free(fl);
  }
}
