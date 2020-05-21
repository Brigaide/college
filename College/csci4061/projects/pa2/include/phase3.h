// Add Guard to header file
// Function prototype for
//			reduce function that will receive list from all the Mappers to create a single list
//			the single list is then written to ReducerResult.txt
#ifndef _PHASE3_H
#define _PHASE3_H

#define MAX_MAPPERS 32
#define REDUCERS 1

void phase3(int *pipefds, int m);

#endif
