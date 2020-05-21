#include "../include/phase3.h"

void phase3(char *server_ip, int server_port, FILE * logfp, int request_num) {
      createConn_Master(request_num, -1, server_ip, server_port, logfp);
}


int * CheckIn_Master(int * counts, int mapperID){
    counts[0] = 1;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * GetAZList_Master(int * counts, int mapperID){
    counts[0] = 3;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * GetMapperUpdates_Master(int * counts, int mapperID){
    counts[0] = 4;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * GetAllUpdates_Master(int * counts, int mapperID){
    counts[0] = 5;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int * CheckOut_Master(int * counts, int mapperID){
    counts[0] = 6;
    counts[1] = mapperID;
    for(int i = 2; i < 28; i++){
        counts[i] = 0;
    }
    return counts;
}

int createConn_Master(int request_num, int mapperID, char *server_ip, int server_port, FILE * logfp){
    // Create a TCP socket.
    int sockfd = socket(AF_INET , SOCK_STREAM , 0);

    // Specify an address to connect to (we use the local host or 'loop-back' address).
    struct sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(server_port);
    address.sin_addr.s_addr = inet_addr(server_ip);

    // Connect it.

    if (connect(sockfd, (struct sockaddr *) &address, sizeof(address)) == 0) {
        fprintf(logfp, "[%d] open connection\n", mapperID);
        int counts[28]; // [request, mapperID, ...]
                // rest of the 26 indices of the array are 0 if request is 1,3-6
                // rest of the 26 indices of the array have word count result if request is 2
                // ^^will be parsed on server side
        int * request_package;
        if(request_num == 1){
          request_package = CheckIn_Master(counts, mapperID);
          write(sockfd, request_package, sizeof(int)*28);
          int checkin_response[28];
          read(sockfd, checkin_response, sizeof(checkin_response));
          fprintf(logfp, "[%d] CHECKIN %d %d\n", mapperID, checkin_response[1], checkin_response[2]);
          fflush(logfp);
        }
        // GET AZLIST
        else if(request_num == 3){
          request_package = GetAZList_Master(counts, mapperID);
          write(sockfd, request_package, sizeof(int)*28);
          int getAZ[28];
          read(sockfd, getAZ, sizeof(getAZ));
          fprintf(logfp, "[%d] GET_AZLIST: %d ", mapperID, getAZ[1]);
          for(int i = 2; i < 28; i++){
              fprintf(logfp, "%d ", getAZ[i]);
          }
          fprintf(logfp, "\n");
          fflush(logfp);
        }
        else if(request_num == 4){
          request_package = GetMapperUpdates_Master(counts, mapperID);
          write(sockfd, request_package, sizeof(int)*28);
          int mapper_updates[28];
          read(sockfd, mapper_updates, sizeof(mapper_updates));
          fprintf(logfp, "[%d] GET_MAPPER_UPDATES: %d %d\n", mapperID, mapper_updates[1], mapper_updates[2]);
          fflush(logfp);
        }
        else if(request_num == 5){
          request_package = GetAllUpdates_Master(counts, mapperID);
          write(sockfd, request_package, sizeof(int)*28);
          int all_updates[28];
          read(sockfd, all_updates, sizeof(all_updates));
          fprintf(logfp, "[%d] GET_ALL_UPDATES: %d %d\n", mapperID, all_updates[1], all_updates[2]);
          fflush(logfp);
        }
        else if(request_num == 6){
          request_package = CheckOut_Master(counts, mapperID);
          write(sockfd, request_package, sizeof(int)*28);
          int check_out_rec[28];
          read(sockfd, check_out_rec, sizeof(check_out_rec));
          fprintf(logfp, "[%d] CHECKOUT %d %d\n", mapperID, check_out_rec[1], check_out_rec[2]);
          fflush(logfp);
        }
        else{
          fprintf(logfp, "[%d] wrong command\n", mapperID);
        }


        //close connection
        fprintf(logfp, "[%d] close connection\n", mapperID);
        fflush(logfp);
        close(sockfd);

    } else {
        perror("Connection failed!");
    }
}
