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
#include "phase1.h"

// You are free to use your own logic. The following points are just for getting started
/* 	Data Partitioning Phase - Only Master process involved
	1) 	Create 'MapperInput' folder
	2) 	Traverse the 'Sample' folder hierarchy and insert the text file paths
		to Mapper_i.txt in a load balanced manner
	3) 	Ensure to keep track of the number of text files for empty folder condition

*/

void makeMapperDirectory(){
  DIR *dr;
  if((mkdir("../src/MapperInput", 0777)) == -1){
    printf("MapperInput already exists, not creating a new directory...\n");
    //remove("../src/MapperInput");
    //makeMapperDirectory();
  }
}

// Global count to be used in fileMapper to make sure .txt file paths are evenly
// distributed to the Mapper_i.txt files
int count = 0;
void fileMapper(char *cwd, int amount, FILE **fptrs) {
	char path2[1024];
	path2[0] = '\0';
	DIR *dr = opendir(cwd);
	if (dr == NULL){
		// opendir returns NULL if couldn't open directory
		printf("Could not open the directory\n" );
		return;
	}

	struct dirent *de;

  // count will help evely divide the text file pahts into the mapper files
  //int count = 0;

	while((de = readdir(dr)) != NULL){
    // check to avoid . and .. directories
		if(strcmp(de->d_name, ".") != 0 && strcmp(de->d_name, "..") != 0){
      // check for nested directory, update path accordingly if so, then recurse
			if(de->d_type == DT_DIR){
				strcpy(path2, cwd);
				strcat(path2, "/");
				strcat(path2, de->d_name);
				fileMapper(path2, amount, fptrs);
			}
      // Else it's a text file of interest
			else{
				char *fd = de->d_name;

        // Same path update
        strcpy(path2, cwd);
				strcat(path2, "/");
				strcat(path2, fd);

        // Print path to Mapper_i.txt file, where i is count
        fprintf(fptrs[count], "%s\n", path2);
        count++;

        // if i reaches amount (the m input of terminal), set it back to 0
        if(count >= amount){
          count = 0;
        }
			}
		}
	}

	closedir(dr);
}


char *Mapper_namer(int i){
  return "ge";
}

void phase1(char *filename, int m){
  // Helper to make MapperInput directory
  makeMapperDirectory();

  //////////////////////////////////////////////////////

  char * newdir = (char *)malloc(sizeof(char)*(strlen(filename))+25);
  char * testcases = (char *)"../Testcases/";
  strcpy(&newdir[0], testcases);
  strcpy(&newdir[13], filename);

  //////////////////////////////////////////////////////

  // File pointer array created so the files can all open at once and avoid
  // closing files which might cause deletion later
  FILE *fptrs[MAX_MAPPERS];
  for(int i = 0; i < m; i++){
    char * file1 = (char *)malloc(sizeof(char)*26);
    strcpy(&file1[0], "./MapperInput/Mapper_");
    char int1[2];
    sprintf(int1, "%d", i);
    int len2 = strlen(int1);
    strcpy(&file1[21], int1);
    strcpy(&file1[21+len2], ".txt");
    fptrs[i] = fopen(file1, "w");
    free(file1);
  }

  // Call to helper function which maps all the text files evenly
  fileMapper(newdir, m, fptrs);

  // Finally close files
  for(int i = 0; i < m; i++){
    fclose(fptrs[i]);
  }

  FILE* fp= fopen("./MapperInput/Mapper_0.txt","r");
  long fsize = 0;
  if(fp != NULL)
  {
    // Go to end of the file
    fseek(fp, 0, SEEK_END);
    fsize= ftell(fp);
    if(fsize == 0){
      printf("The ../Testcases/%s folder is empty\n", filename);
      exit(1);
    }
  }

  free(newdir);
}
