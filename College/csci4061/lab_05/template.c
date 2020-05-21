#define _BSD_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <string.h>
#include <time.h>

void printStats(char* path, int max) {

	//open directory
	DIR *dr = opendir(path);
	if (dr == NULL){
		printf("Could not open current directory");
		return;
	}

	char newpath[1000];
	struct dirent *de;

	int count = 0;
	int count1 = 0;

	while((de = readdir(dr)) != NULL){
		if ((strcmp(de->d_name, ".") != 0) && (strcmp(de->d_name, "..") != 0)){
			if (de->d_type == DT_DIR){
				printf("DIR: %s\n", de->d_name);
				strcpy(newpath, path);
				strcat(newpath, "/");
				strcat(newpath, de->d_name);
				printStats(newpath, max);
			}
			else{
				if (count < max){
					printf("FILE: %s\n", de->d_name);
					char *fd = de->d_name;
					struct stat buf;
					stat(fd, &buf);
					printf("\tUSER ID: %d\n", buf.st_uid);
					printf("\tSIZE IN BYTES: %ld\n", buf.st_size);
				}
				count++;
			}
		}
	}
}


int main(int argc, char** argv) {

	if (argc < 3) {

		printf("Wrong number of args, expected 2, given %d", argc - 1);
		exit(1);
	}

	printStats(argv[1], atoi(argv[2]));
}
