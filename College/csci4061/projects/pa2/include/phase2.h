// Add Guard to header file
// Function prototypes for
//			map function that will go through text files in the Mapper_i.txt to get the (letter, wordcount)
#ifndef _PHASE2_H
#define _PHASE2_H

#define MAX_MAPPERS 32
#define REDUCERS 1

void phase2(int *pipefds, int c, int m);

#endif
