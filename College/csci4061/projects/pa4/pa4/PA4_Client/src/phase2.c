#include "../include/phase2.h"

#define _BSD_SOURCE

void phase2(int mappers, char *server_ip, int server_port, FILE * logfp) {

    for(int i = 1; i <= mappers; i++){
        pid_t pid = fork();

        if (pid < 0){
            printf("Fork failed\n");
            exit(-1);
        }

        // if (pid > 0){
        //     wait(NULL);
        // }

        else if (pid == 0){
            createConn(i, server_ip, server_port, logfp);
            exit(0);
        }
    }
    for (int i = 0; i < mappers; i++){
      wait(NULL);
    }
}


int * CheckIn(int * counts, int mapperID){
    counts[0] = 1;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * UpdateAZList(int * counts, int mapperID, FILE * txtFilePtr){
    counts[0] = 2;
    counts[1] = mapperID;
    // reset word count numbers
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    // count words case insensitive
    char ch;
    char word[100];
    while((fgets(word, 100, txtFilePtr)) != NULL){
        ch = word[0];
        if(ch >= 'a' && ch <= 'z'){
            ++counts[(ch - 'a')+2];
        }
        else if(ch >= 'A' && ch <= 'Z'){
            ++counts[(ch - 'A')+2];
        }
    }
    return counts;
}

int * GetAZList(int * counts, int mapperID){
    counts[0] = 3;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * GetMapperUpdates(int * counts, int mapperID){
    counts[0] = 4;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * GetAllUpdates(int * counts, int mapperID){
    counts[0] = 5;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * CheckOut(int * counts, int mapperID){
    counts[0] = 6;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int createConn(int mapperID, char *server_ip, int server_port, FILE * logfp){
    // Create a TCP socket.
    int sockfd = socket(AF_INET , SOCK_STREAM , 0);

    // Specify an address to connect to (we use the local host or 'loop-back' address).
    struct sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(server_port);
    address.sin_addr.s_addr = inet_addr(server_ip);

    // Connect it.

    if (connect(sockfd, (struct sockaddr *) &address, sizeof(address)) == 0) {
        int counts[28]; // [request, mapperID, ...]
                // rest of the 26 indices of the array are 0 if request is 1,3-6
                // rest of the 26 indices of the array have word count result if request is 2
                // ^^will be parsed on server side
        int * request_package;
        fprintf(logfp, "[%d] open connection\n", mapperID);
        request_package = CheckIn(counts, mapperID);
        write(sockfd, request_package, sizeof(int)*28);
        int checkin_response[28];
        read(sockfd, checkin_response, sizeof(checkin_response));
        fprintf(logfp, "[%d] CHECKIN %d %d\n", mapperID, checkin_response[1], checkin_response[2]);
        fflush(logfp);


        // open correct file
        char * fl = (char *)malloc(sizeof(char)*26);
        strcpy(&fl[0], "./MapperInput/Mapper_");
        char int1[2];
        sprintf(int1, "%d", mapperID);
        int len2 = strlen(int1);
        strcpy(&fl[21], int1);
        strcpy(&fl[21+len2], ".txt");
        FILE *fptr = fopen(fl, "r");
        if(!fptr){
            printf("Failed to open the file: %s\n", fl);
            exit(1);
        }
        char txtFilePath[128];
        int send_count = 0;

        while(fgets(txtFilePath, 128, fptr)){

        // remove new line character ('\n') from paths of file
            strtok(txtFilePath, "\n");

        // mark as readable, not writable (writable would cause contents to delete)
            FILE *txtFilePtr = fopen(txtFilePath, "r");
            request_package = UpdateAZList(counts, mapperID, txtFilePtr);
            write(sockfd, request_package, sizeof(int)*28);
            send_count++;
            int update_az_data[28];
            read(sockfd, update_az_data, sizeof(update_az_data));
            fclose(txtFilePtr);
        }
        fclose(fptr);
        fprintf(logfp, "[%d] UPDATE_AZLIST: %d\n", mapperID, send_count);

        fflush(logfp);

        // GET AZLIST
        request_package = GetAZList(counts, mapperID);
        write(sockfd, request_package, sizeof(int)*28);
        int getAZ[28];
        read(sockfd, getAZ, sizeof(getAZ));
        fprintf(logfp, "[%d] GET_AZLIST: %d ", mapperID, getAZ[1]);
        for(int i = 2; i < 28; i++){
            fprintf(logfp, "%d ", getAZ[i]);
        }
        fprintf(logfp, "\n");
        fflush(logfp);

        request_package = GetMapperUpdates(counts, mapperID);
        write(sockfd, request_package, sizeof(int)*28);
        int mapper_updates[28];
        read(sockfd, mapper_updates, sizeof(mapper_updates));
        fprintf(logfp, "[%d] GET_MAPPER_UPDATES: %d %d\n", mapperID, mapper_updates[1], mapper_updates[2]);

        fflush(logfp);

        request_package = GetAllUpdates(counts, mapperID);
        write(sockfd, request_package, sizeof(int)*28);
        int all_updates[28];
        read(sockfd, all_updates, sizeof(all_updates));
        fprintf(logfp, "[%d] GET_ALL_UPDATES: %d %d\n", mapperID, all_updates[1], all_updates[2]);
        fflush(logfp);

        request_package = CheckOut(counts, mapperID);
        write(sockfd, request_package, sizeof(int)*28);
        int check_out_rec[28];
        read(sockfd, check_out_rec, sizeof(check_out_rec));
        fprintf(logfp, "[%d] CHECKOUT %d %d\n", mapperID, check_out_rec[1], check_out_rec[2]);
        fflush(logfp);

        //close connection
        fprintf(logfp, "[%d] close connection\n", mapperID);
        fflush(logfp);
        close(sockfd);

    } else {
        perror("Connection failed!");
    }
}
