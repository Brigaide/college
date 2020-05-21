#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "deltas.h"
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>



int *read_text_deltas(char *fname, int *len){


  int length = 0;                                          //initializes the variables used in this function
  int data;
  int i = 0;
  int cmd;
  int success = 1;
  int currentidx;
  int nextidx;

  FILE *file;
  file = fopen(fname, "r");                               //open file and read it
  if (file == NULL){                                      //if file is null, throw a warning, set the value of len to 0 and return NULL
    printf("%s\n", "File not found\n");
    *len = -1;
    return NULL;
  }
  fscanf(file, "%d", &data);                              //scans in integers from the file

  while (success > 0){                                    //while success is greater than 0, keep adding one to the length so we know the size of the array
    length++;
    success = fscanf(file, "%d\n", &cmd);                 //fscanf will return 0 when done so success will equal 0 and break the loop
  }

  *len = length;


   struct stat sb;
   int result = stat(fname, &sb);                           // unix system call to determine size of named file
   if(result==-1 || sb.st_size < sizeof(int)){
   *len = -1;	                                              // if something went wrong or bail if file is too small
   return NULL;
   }

                                                            //allocates an array that is the size of the amount of numbers that was scanned in
  int *arr = malloc(length*sizeof(int));
  rewind(file);                                             //rewinds the file back to the beginning

  fscanf(file, "%d", &currentidx);                          //scans the file that is at memory address of current index
  arr[i++] = currentidx;                                    //iterates the index over

                                                            //keeps doing this for the length of the file
  while ( i < length ){
    fscanf(file, "%d\n", &nextidx);
    currentidx = currentidx + nextidx;
    arr[i++] = currentidx;
  }

  fclose(file);                                             //closes File
  return arr;                                               //returns array
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int *read_int_deltas(char *fname, int *len){

  int length = 0;                                          //initializes the variables used in this function
  int i = 0;
  int cmd;
  int success = 1;
  int currentidx;
  int nextidx;

  FILE *file;
  file = fopen(fname, "r");                               //open file and read it
  if (file == NULL){                                      //if file is null, throw a warning, set the value of len to 0 and return NULL
    printf("%s\n", "File not found\n");
    *len = -1;
    return NULL;
  }

  struct stat sb;                                         // struct to hold
  int result = stat(fname, &sb);                          // unix system call to determine size of named file
  if(result==-1 || sb.st_size < sizeof(int)){
  *len = -1;                                              // if something went wrong or bail if file is too small
  return NULL;
  }
  int total_bytes = sb.st_size;                           // size of file in bytes
  int *arr = malloc(total_bytes*sizeof(int));             //allocates an array that is the size times the size of an int

  fread(&arr[i], sizeof(int), 1, file);                   //reads in the file


  while (success > 0){                                    //keeps reading as long as there is something to read in
    length++;
    success = fread(&cmd, sizeof(int), 1, file);;
  }

  *len = length;

  rewind(file);                                           //rewinds the file

  fread(&currentidx, sizeof(int), 1, file);               //takes in the address and the size in bytes, the no of elements, and the file
  arr[i++] = currentidx;                                  //iterates the array by 1

  while ( i < length ){                                   //does this for the length of the file but adds the current index plus the next index
    fread(&nextidx, sizeof(int), 1, file);
    currentidx = currentidx + nextidx;
    arr[i++] = currentidx;
  }

  fclose(file);                                           //closes file
  return arr;                                             //returns the array
}
