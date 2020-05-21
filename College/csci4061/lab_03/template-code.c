#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char** argv) {

	if (argc < 2) {

		printf("Incorrect number of args: given %d, expected 1.\n", argc - 1);
		exit(1);
	}

	pid_t pid1 = fork();


	char *const argList[] = {"/home/gnana005/College/csci4061/lab_03/rtime.o", argv[1], NULL};

	if (pid1 > 0){
		waitpid(pid1, NULL, 0);

		pid_t pid2 = fork();

		if (pid2 > 0){
			waitpid(pid2, NULL, 0);
		}

	
		else if (pid2 == 0){
			execv(argList[0], argList);
		}
	}

	else if (pid1 == 0){
	
		execl("/bin/echo", "echo", "hello world!", (char*) NULL);
	}
}
