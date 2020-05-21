#ifndef PHASE2_H
#define PHASE2_H

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

void phase2(int mappers, char *server_ip, int server_port, FILE * logfp);

int * CheckIn(int * counts, int mapperID);

int * UpdateAZList(int * counts, int mapperID, FILE * txtFilePtr);

int * GetAZList(int * counts, int mapperID);

int * GetMapperUpdates(int * counts, int mapperID);

int * GetAllUpdates(int * counts, int mapperID);

int * CheckOut(int * counts, int mapperID);

int createConn(int mapperID, char *server_ip, int server_port, FILE * logfp);

#endif
