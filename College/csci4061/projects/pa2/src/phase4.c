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
#include <fcntl.h>
#include "phase4.h"
// You are free to use your own logic. The following points are just for getting started
/* Final Result
	1)	The master process reads the "ReducerResult.txt"
	2) 	Print the contents to standard output which is redirected to "FinalResult.txt"
			i.e., on using printf, the statement should be written to "FinalResult.txt"
*/

void phase4(){
  //FILE *fReduc;
  char line[10];
  FILE *fReduc = fopen("../src/ReducerResult.txt", "r");
  if (fReduc == NULL)
    {
        printf("Cannot open file ReducerResult.txt \n");
        return;
    }

  int fFinal = open("../src/FinalResult.txt", O_WRONLY | O_CREAT, 0666);
  if (!fFinal)
    {
        printf("Cannot open file FinalResult.txt \n");
        return;
    }
  dup2(fFinal, 1);

  while((fgets(line, 10, fReduc)) != NULL){
    printf("%s", line);
  }
  fclose(stdout);
  fclose(fReduc);
  close(fFinal);
}
