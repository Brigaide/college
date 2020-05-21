#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char DEFAULT_NAME[10] = "John Doe";

void run(int input) {
    char * name = (char *) malloc(20);
    if (input % 10 == 0) {
        strcpy(name, DEFAULT_NAME);
    }
    else {
      char * namebuf = (char *) malloc(30);
      char *numbuf = (char * ) malloc (20);
      strcpy(namebuf, "This is number: ");
      sprintf(numbuf, "%d", input);
      strcat(namebuf, numbuf);
      strcpy(name, namebuf);

      free(namebuf);
      free(numbuf);

    }
    if (input % 3 == 0) {
        printf("Name is: %s\n", name);
    }
    else if (input % 2 == 0) {
        printf("Input is even!");
        free(name);
	return;
    }
    free(name);
}

int main() {
    int i = 0;
    while(1) {
        run(i);
        i++;
    }
    //return 0;
}
