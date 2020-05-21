#include "main.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char *argv[]){


	// argument count check
	if(argc != 3){
		printf("expected 2 arguments given %d\n", argc-1);
		exit(-1);
	}

	//just make a function call to code in phase1.c
	//phase1 - Data Partition Phase
	phase1(argv[1], atoi(argv[2]));

	//create pipes
	int pipeCount = atoi(argv[2]) * 2;
	int pipefds[pipeCount];
	for(int i = 0; i < pipeCount; i += 2){
		pipe(pipefds + i);
	}

	//just make a function call to code in phase2.c
	//phase2 - Map Function
	phase2(pipefds, 0, atoi(argv[2]));

	//just make a function call to code in phase3.c
	//phase3 - Reduce Function
	phase3(pipefds, atoi(argv[2]));

	//phase4
	//wait for all processes to reach this point

	//sleep(1);
	//just make a function call to code in phase4.c
	//master process reports the final output
	phase4();

	return 0;

}
