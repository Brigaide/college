#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "deltas.h"
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>



int *read_text_deltas(char *fname, int *len){

  int length = 0;
  int data;
  int i = 0;
  int cmd;
  int success = 1;
  int currentidx;
  int nextidx;

  FILE *file;
  file = fopen(fname, "r");
  if (file == NULL){
    printf("%s\n", "File not found\n");
    *len = -1;
    return NULL;
  }

  fscanf(file, "%d", &data);

  while (success > 0){
    length++;
    success = fscanf(file, "%d\n", &cmd);
  }

  *len = length;

   struct stat sb;
   int result = stat(fname, &sb);                     // unix system call to determine size of named file
   if(result==-1 || sb.st_size < sizeof(int)){
   *len = -1;	   // if something went wrong or bail if file is too small
   return NULL;
   }

  int *arr = malloc(length*sizeof(int));
  rewind(file);

  fscanf(file, "%d", &currentidx);
  arr[i++] = currentidx;

  while ( i < length ){
    fscanf(file, "%d\n", &nextidx);
    currentidx = currentidx + nextidx;
    arr[i++] = currentidx;
  }

  fclose(file);
  return arr;
}

// Reads integers in text delta format from the file named by fname
// and returns an array of them. The first integer in the file gives
// the starting point and subsequent integers are changes from the
// previous total.
//
// Opens the file with fopen() and scans through its contents using
// fscanf() counting how many text integers exist in it.  Then
// allocates an array of appropriate size using malloc(). Uses
// rewind() to go back to the beginning of the file then reads
// integers into the allocated array. Closes the file after reading
// all ints.  Returns a pointer to the allocated array.
//
// The argument len is a pointer to an integer which is set to the
// length of the array that is allocated by the function.
//
// If the file cannot be opened with fopen() or if there are no
// integers in the file, sets len to -1 and returns NULL.


int *read_int_deltas(char *fname, int *len){

  int length = 0;
  int i = 0;
  int cmd;
  int success = 1;
  int currentidx;
  int nextidx;

  FILE *file;
  file = fopen(fname, "r");
  if (file == NULL){
    printf("%s\n", "File not found\n");
    *len = -1;
    return NULL;
  }

  struct stat sb;
                                   // struct to hold
  int result = stat(fname, &sb);                     // unix system call to determine size of named file
  if(result==-1 || sb.st_size < sizeof(int)){
  *len = -1;
		  // if something went wrong or bail if file is too small
  return NULL;
  }
  int total_bytes = sb.st_size;
                      // size of file in bytes
  int *arr = malloc(total_bytes*sizeof(int));

  fread(&arr[i], sizeof(int), 1, file);


  while (success > 0){
    length++;
    success = fread(&cmd, sizeof(int), 1, file);;
  }

  *len = length;

  rewind(file);

  fread(&currentidx, sizeof(int), 1, file);
  arr[i++] = currentidx;

  while ( i < length ){
    fread(&nextidx, sizeof(int), 1, file);
    currentidx = currentidx + nextidx;
    arr[i++] = currentidx;
  }

  fclose(file);
  return arr;
}
// Reads integers in binary delta format from the file named by fname
// and returns an array of them.  The first integer in the file gives
// the starting point and subsequent integers are changes from the
// previous total.
//
// Integers in the file are in binary format so the size of the file
// in bytes indicates the quantity of integers. Uses the stat() system
// call to determine the file size in bytes which then allows an array
// of appropriate size to be allocated. DOES NOT scan through the file
// to count its size as this is not needed.
//
// Opens the file with fopen() and uses repeated calls to fread() to
// read binary integers into the allocated array. Does delta
// computations as integers are read. Closes the file after reading
// all ints.
//
// The argument len is a pointer to an integer which is set to
// the length of the array that is allocated by the function.
//
// If the file cannot be opened with fopen() or file is smaller than
// the size of 1 int, sets len to -1 and returns NULL.
