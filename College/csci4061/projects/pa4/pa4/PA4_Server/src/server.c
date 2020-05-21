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

int azList[26] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int updateStatus[MAX_MAPPER_PER_MASTER][3];
pthread_mutex_t mut;
pthread_mutex_t currentConn_lock;
int currentConn = 0;

struct threadArg {
	int clientfd;
	char * clientip;
	int clientport;
};
void threadFunction(void * arg){
    struct threadArg * client = (struct threadArg *) arg;
    while(1){
        int recbuf[28];
        // package is what will be sent back to the client if needed
        int package[28];
				for(int i = 0; i < 28; i++){
					package[i] = 0;
				}
        //initialize the response code to NOK
        package[1] = RSP_NOK;
				int readsize;
        readsize = read(client->clientfd, recbuf, sizeof(recbuf));
				if(readsize == -1){
					perror("recv failed");
				}

        // CHECKIN
				int task_request = recbuf[0];
				int mapperID = recbuf[1];
				// the rest of the recbuf is data

				if(task_request != 1 && mapperID > 0){
					if(updateStatus[mapperID-1][2] == 0){
						printf("Mapper %d is not checked in\n", mapperID);
					}
				}

        if(task_request == 1){
            // update mapper id slot to recieved id.
						pthread_mutex_lock(&mut);
						if(mapperID < 0){
							printf("[%d] CHECKIN\n", mapperID);
							printf("Mapper PID (%d) should be greater than 0\n", mapperID);
							package[0] = 1;
							package[1] = RSP_NOK;
							package[2] = mapperID;
							// pthread_mutex_lock(&currentConn_lock);
							// currentConn--;
							// pthread_mutex_unlock(&currentConn_lock);
							write(client->clientfd, package, sizeof(package));
							close(client->clientfd);
							printf("close connection from %s:%d\n", client->clientip, client->clientport);
							free(client);
							pthread_mutex_unlock(&mut);
							return;
						}
						else{
	            updateStatus[mapperID-1][0] = mapperID;
	            // update check in slot to 1
	            updateStatus[mapperID-1][2] = 1;
	            printf("[%d] CHECKIN\n", mapperID);
							package[0] = 1;
							package[1] = RSP_OK;
							package[2] = mapperID;
							write(client->clientfd, package, sizeof(package));
							pthread_mutex_unlock(&mut);
						}
        }

        // UPDATE_AZLIST
        else if(task_request == 2){
					pthread_mutex_lock(&mut);
						package[0] = 2;
						package[1] = RSP_OK;
						package[2] = mapperID;

            // update azList
            for(int i = 2; i < 28; i++){
                azList[i-2] += recbuf[i];
								//printf("%c: %d  ",'a'+i, recbuf[i+2]);
            }
            // increment #updates
            updateStatus[mapperID-1][1]++;
            pthread_mutex_unlock(&mut);
						write(client->clientfd, package, sizeof(package));
        }

        // GET_AZLIST
        else if(task_request == 3){
            pthread_mutex_lock(&mut);
            // assign first 2 response fields
            package[0] = 3;
            package[1] = RSP_OK;
            // last 28 slots are alphabet counts
            for(int i = 2; i < 28; i++){
                package[i] = azList[i-2];
            }
            printf("[%d] GET_AZLIST\n", mapperID);
						if(mapperID < 0){
							package[1] = RSP_OK;
							printf("close connection from %s:%d\n", client->clientip, client->clientport);
							// pthread_mutex_lock(&currentConn_lock);
							// currentConn--;
							// pthread_mutex_unlock(&currentConn_lock);
							write(client->clientfd, package, sizeof(package));
							close(client->clientfd);
							free(client);
							pthread_mutex_unlock(&mut);
							return;
						}
						else{
            	write(client->clientfd, package, sizeof(package));
							pthread_mutex_unlock(&mut);
						}
				}

        // GET_MAPPER_UPDATES
        else if(task_request == 4){
						pthread_mutex_lock(&mut);
            // assign first 2 response fields
            package[0] = 4;
            package[1] = RSP_OK;
            // assign 3rd field to #updates for mapper
            package[2] = updateStatus[mapperID-1][1];
            printf("[%d] GET_MAPPER_UPDATES\n", mapperID);
						if(mapperID < 0){
							package[1] = RSP_NOK;
							printf("Mapper PID (%d) should be greater than 0\n", mapperID);
							printf("close connection from %s:%d\n", client->clientip, client->clientport);
							// pthread_mutex_lock(&currentConn_lock);
							// currentConn--;
							// pthread_mutex_unlock(&currentConn_lock);
							write(client->clientfd, package, sizeof(package));
							close(client->clientfd);
							free(client);
							pthread_mutex_unlock(&mut);
							return;
						}
						else{
            	write(client->clientfd, package, sizeof(package));
							pthread_mutex_unlock(&mut);
						}
				}

        // GET_ALL_UPDATES
        else if(task_request == 5){
						pthread_mutex_lock(&mut);
            // assign first 2 response fields
            package[0] = 5;
            package[1] = RSP_OK;
            // use a loop to sum #updates among all mappers
            int total = 0;
            for(int i = 0; i < MAX_CONCURRENT_CLIENTS; i++){
                total += updateStatus[i][1];
            }
            package[2] = total;
            printf("[%d] GET_ALL_UPDATES\n", mapperID);
						if(mapperID < 0){
							package[1] = RSP_NOK;
							printf("close connection from %s:%d\n", client->clientip, client->clientport);
							// pthread_mutex_lock(&currentConn_lock);
							// currentConn--;
							// pthread_mutex_unlock(&currentConn_lock);
							write(client->clientfd, package, sizeof(package));
							close(client->clientfd);
							free(client);
							pthread_mutex_unlock(&mut);
							return;
						}
						else{
							write(client->clientfd, package, sizeof(package));
							pthread_mutex_unlock(&mut);
						}
        }

        // CHECKOUT
				else if(task_request == 6){
						pthread_mutex_lock(&mut);
            updateStatus[mapperID-1][2] = 0;
						package[0] = 6;
            package[1] = RSP_OK;
						if(mapperID < 0){
							package[1] = RSP_NOK;
						}
						package[2] = mapperID;
            printf("[%d] CHECKOUT\n", mapperID);
						if(mapperID < 0){
							package[1] = RSP_NOK;
							printf("Mapper PID (%d) should be greater than 0\n", mapperID);
						}
						pthread_mutex_lock(&currentConn_lock);
						currentConn--;
						pthread_mutex_unlock(&currentConn_lock);
						write(client->clientfd, package, sizeof(package));
						close(client->clientfd);
						printf("close connection from %s:%d\n", client->clientip, client->clientport);
						free(client);
						pthread_mutex_unlock(&mut);
            return;
        }
    }
}

int main(int argc, char *argv[]) {

    int server_port;

    if (argc == 2) { // 1 arguments
        server_port = atoi(argv[1]);
    } else {
        printf("Invalid or less number of arguments provided\n");
        printf("./server <server Port>\n");
        exit(0);
    }

    // Server (Reducer) code
    pthread_t threads[MAX_CONCURRENT_CLIENTS];

    pthread_mutex_init(&mut, NULL);
		pthread_mutex_init(&currentConn_lock, NULL);

    // Create a TCP socket.
		int sock = socket(AF_INET , SOCK_STREAM , 0);

		// Bind it to a local address.
		struct sockaddr_in servAddress;
		servAddress.sin_family = AF_INET;
		servAddress.sin_port = htons(server_port);
		servAddress.sin_addr.s_addr = htonl(INADDR_ANY);
		bind(sock, (struct sockaddr *) &servAddress, sizeof(servAddress));

		// We must now listen on this port.
    if (listen(sock, MAX_CONCURRENT_CLIENTS) == 0){
        printf("server is listening\n");
    }

		// A server typically runs infinitely, with some boolean flag to terminate.
    int count = 0;
		while (count < MAX_CONCURRENT_CLIENTS) {

			// Now accept the incoming connections.
			struct sockaddr_in clientAddress;
			socklen_t size = sizeof(struct sockaddr_in);
			int clientfd = accept(sock, (struct sockaddr*) &clientAddress, &size);


	    struct threadArg *arg = (struct threadArg *) malloc(sizeof(struct threadArg));
			arg->clientfd = clientfd;
			arg->clientip = inet_ntoa(clientAddress.sin_addr);
			arg->clientport = clientAddress.sin_port;
			printf("open connection from %s:%d\n", arg->clientip, arg->clientport);
			pthread_mutex_lock(&currentConn_lock);
			// printf("post lock\n");
	  	if(currentConn == MAX_CONCURRENT_CLIENTS) {
				printf("Server is too busy\n");
				close(clientfd);
				free(arg);
				continue;
			}
			else {
				// printf("making thread %d\n", count);
		    pthread_create(&threads[count], NULL, (void *)threadFunction, (void *) arg);
				currentConn++;
		    count ++;
				if(count == MAX_CONCURRENT_CLIENTS){
					count = 0;
				}
			}
			pthread_mutex_unlock(&currentConn_lock);
	}


	// Close the socket.
	close(sock);
	return 0;
}
