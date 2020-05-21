#ifndef PHASE3_H
#define PHASE3_H

#include <sys/socket.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <pthread.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

void phase3(char *server_ip, int server_port, FILE * logfp, int request_num);

int * CheckIn_Master(int * counts, int mapperID);

int * GetAZList_Master(int * counts, int mapperID);

int * GetMapperUpdates_Master(int * counts, int mapperID);

int * GetAllUpdates_Master(int * counts, int mapperID);

int * CheckOut_Master(int * counts, int mapperID);

int createConn_Master(int request_num, int mapperID, char *server_ip, int server_port, FILE * logfp);

#endif
