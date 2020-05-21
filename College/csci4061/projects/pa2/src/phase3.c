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
#include "phase3.h"
// You are free to use your own logic. The following points are just for getting started
/* Reduce Function
	1)	The reducer receives the list from 'm' mappers via pipes
	2)	Ensure proper closing of pipe ends
	3) 	Combine the lists to create a single list
	4) 	Write the list to "ReducerResult.txt" in the current folder
*/
void phase3(int *pipefds, int m){
	//printf("%s\n", "asd");
	int final[26] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

	for(int i = 0; i < m; i++){
    int buf[26] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		close(pipefds[1+(i*2)]);
		read(pipefds[i*2],buf, sizeof(buf));
		for (int j = 0; j < 26; j++){
			final[j] += buf[j];

		}
	}
  // for ( int i = 0; i < 26; i++){
	// 	printf("%c %d\n",'A'+i, buf[i]);
	// }
  // printf("=========final============\n");
  // for(int i = 0; i < 26; i++){
	// 	printf("%c %d\n",'A'+i, final[i]);
	// }
  // printf("=====================\n");
	FILE *fptr = fopen("ReducerResult.txt", "w");
	for(int i = 0; i < 26; i++){
		fprintf(fptr, "%c %d\n",'A'+i, final[i]);
	}
	fclose(fptr);
	//return fptr;
}
