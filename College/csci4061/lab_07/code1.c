#include <stdlib.h>
#include <stdint.h>

int main() {
    int i;
    char* alphabet = malloc(26*sizeof(char)+1);
    char* destination=malloc(25*sizeof(char)+1);

    for(i = 0; i < 26; i++) {
        *(alphabet + i) = 'A' + i;
    }
    *(alphabet + 26) = '\0';

    for(i=0; i<26; i++){
      destination[i]=alphabet[i];
    }

    free(alphabet);
    free(destination);

    return 0;
}
