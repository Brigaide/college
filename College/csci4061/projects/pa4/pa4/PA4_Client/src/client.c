#include <stdio.h>
#include <netdb.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <zconf.h>
#include <pthread.h>
#include <signal.h>
#include <arpa/inet.h>
#include "../include/protocol.h"
#include "../include/phase1.h"
#include "../include/phase2.h"

FILE *logfp;

void createLogFile(void) {
    pid_t p = fork();
    if (p==0)
        execl("/bin/rm", "rm", "-rf", "log", NULL);

    wait(NULL);
    mkdir("log", ACCESSPERMS);
    logfp = fopen("log/log_client.txt", "w");
}

int main(int argc, char *argv[]) {
    int mappers;
    char folderName[100] = {'\0'};
    char *server_ip;
    int server_port;

    if (argc == 5) { // 4 arguments
        strcpy(folderName, argv[1]);
        mappers = atoi(argv[2]);
        server_ip = argv[3];
        server_port = atoi(argv[4]);
        if (mappers > MAX_MAPPER_PER_MASTER) {
            printf("Maximum number of mappers is %d.\n", MAX_MAPPER_PER_MASTER);
            printf("./client <Folder Name> <# of mappers> <server IP> <server Port>\n");
            exit(1);
        }

    } else {
        printf("Invalid or less number of arguments provided\n");
        printf("./client <Folder Name> <# of mappers> <server IP> <server Port>\n");
        exit(1);
    }

    // create log file
    createLogFile();

    // Phase1 - File Path Partitioning
    traverseFS(mappers, folderName);

    // Phase2 - Mapper Clients's Deterministic Request Handling
    phase2(mappers, server_ip, server_port, logfp);

    // Phase3 - Master Client's Dynamic Request Handling (Extra Credit)
    FILE * command_txt = fopen("./commands.txt", "r");
    if(!command_txt){
      printf("Failed to open the file: %s\n", "commands.txt");
      exit(1);
    }

    char line[10];
    while(fgets(line, 10, command_txt) != NULL){
      strtok(line, "\n");
      int request_num = atoi(line);
      phase3(server_ip, server_port, logfp, request_num);
    }

    fclose(command_txt);
    fclose(logfp);
    return 0;

}
