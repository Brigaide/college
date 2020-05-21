// Server side implementation of UDP client-server model
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>


#define PORT	 8080
#define MAXLINE 1024

// Driver code
int main() {
	int sockfd;
	char buffer[MAXLINE];
	char *hello = "Hello from server";
	struct sockaddr_in servaddr, cliaddr;

	// Creating socket file descriptor
	if ( (sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0 ) {
		perror("socket creation failed");
		exit(EXIT_FAILURE);
	}

	memset(&servaddr, 0, sizeof(servaddr));
	memset(&cliaddr, 0, sizeof(cliaddr));

	// Filling server information
	servaddr.sin_family = AF_INET; // IPv4
	servaddr.sin_addr.s_addr = INADDR_ANY;
	servaddr.sin_port = htons(PORT);

	// Bind the socket with the server address
	if ( bind(sockfd, (const struct sockaddr *)&servaddr,
			sizeof(servaddr)) < 0 )
	{
		perror("bind failed");
		exit(EXIT_FAILURE);
	}

	int n;
	socklen_t addrlen;

	while(1){

		//TODO : implement server client commmunication here
		char msgbuf[MAXLINE];
		char rspbuf[MAXLINE];

		printf("Enter a message to send: ");
		scanf("%s", msgbuf);

		sendto(sockfd, &msgbuf, strlen(msgbuf), 0,
			(struct sockaddr *) &cliaddr, addrlen);

		while(recvfrom(sockfd, &rspbuf, strlen(rspbuf), 0,
			(struct sockaddr *) &cliaddr, addrlen) != -1){
				printf("%s\n", rspbuf);
			}

	}

	return 0;
}
