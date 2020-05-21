#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <errno.h>

//Receive a line from sock until we see \r\n, return 0 if success
int ReceiveLine(int sock, char * buf) {
	int nRecv = 0;
	while (1) {
		int n = recv(sock, buf + nRecv, 1, 0);
		if (n > 0) {
			nRecv++;
			if (nRecv>=2 && buf[nRecv-2]=='\r' && buf[nRecv-1]=='\n') break;
		} else if (n == 0 || (n < 0 && errno == ECONNRESET)) {
			printf("Error: Connection closed unexpectedly\n");
			return -1;
		} else {
			printf("Error: unexpected error when reading a line. Error No=%d, Error Message=%s\n", errno, strerror(errno));
			return -1;
		}
	}
	
	//remove the trailing "\r\n"
	buf[nRecv-2] = 0;
	return 0;
}

//Receive [len] bytes from sock, return 0 if success
int ReceiveData(int sock, unsigned char * buf, int len) {
	int nRecv = 0;
	while (nRecv < len) {
		int n = recv(sock, buf + nRecv, len - nRecv, 0);
		if (n > 0) {
			nRecv += n;
		} else if (n == 0 || (n < 0 && errno == ECONNRESET)) {
			printf("Error: Connection closed unexpectedly\n");
			return -1;
		} else {
			printf("Error: unexpected error when receiving data. Error No=%d, Error Message=%s\n", errno, strerror(errno));
			return -1;
		}
	}
	
	return 0;
}

//Send [len] bytes to sock, return 0 if success
int SendData(int sock, const unsigned char * buf, int len) {
	int nSent = 0;
	while (nSent < len) {
		int n = send(sock, buf + nSent, len - nSent, 0);
		if (n >= 0) {
			nSent += n;
		} else if (n < 0 && (errno == ECONNRESET || errno == EPIPE)) {
			printf("Error: Connection closed unexpectedly\n");
			return -1;
		} else {
			printf("Error: unexpected error when receiving data. Error No=%d, Error Message=%s\n", errno, strerror(errno));
			return -1;
		}
	}
	return 0;
}

int main() {
	//The request to be sent to the server
	const char * request = "GET / HTTP/1.1\r\nHost: 52.90.167.79\r\n\r\n";

	//Set the destination IP address and port number
	struct sockaddr_in serverAddr;
	memset(&serverAddr, 0, sizeof(serverAddr));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons((unsigned short) 80);
	inet_pton(AF_INET, "52.90.167.79", &serverAddr.sin_addr);
	
	//Create the socket, connect to the server
	int sock = socket(AF_INET, SOCK_STREAM, 0);	
	if (sock < 0) {
		printf("Error: cannot create the socket. Error No=%d, Error Message=%s\n", errno, strerror(errno));
		return -1;
	}
	
	int ret;
	
	//connect to web server
	ret = connect(sock, (const struct sockaddr *) &serverAddr, sizeof(serverAddr));
	if (ret == 0) {
		printf("Success: connected to server\n");
	} else {
		printf("Error: cannot connect to the server. Error No=%d, Error Message=%s\n", errno, strerror(errno));
		return -1;
	}
		
	//Send request
	int requestLength = strlen(request);
	if (SendData(sock, request, requestLength) != 0) {
		close(sock);
		return -1;
	} else {
		printf("Success: sent the request. Now waiting for server's response\n");
	}

	//Read response header
	char buf[30000];
	int contentLength = 0;
	while (1) {
		//read a response header line from server
		if (ReceiveLine(sock, buf) != 0) {
			close(sock);
			return -1;
		} 
		
		if (strlen(buf) == 0) break; //end of the response header
		if (strstr(buf, "Content-Length: ") != NULL) {
			contentLength = atoi(buf + 16);
		}
		
		printf("Received header field: %s\n", buf);
	}
	
	//check contentLength
	if (contentLength == 0) {
		printf("Error: contentLength is unknown\n");
		close(sock);
		return -1;
	}
	
	if (contentLength > sizeof(buf)) {
		printf("Error: the page is too large\n");
		close(sock);
		return -1;
	}
	printf("Success: the HTML page has %d bytes\n", contentLength);
	
	//Read response body i.e., the web page
	if (ReceiveData(sock, buf, contentLength) != 0) {
		close(sock);
		return -1;
	} else {
		printf("Success: downloaded the page. Closing the connection\n");
		close(sock);
	}

	//write HTML page into a file
	FILE * ofs = fopen("index.html", "wb");
	if (ofs == NULL) {
		printf("Error: cannot open index.html to write\n");
		return -1;
	}
	
	ret = fwrite(buf, contentLength, 1, ofs);
	if (ret == 1) {
		printf("Success: saved the page to file\n");
	} else {
		printf("Error: cannot fully write the page\n");
	}
	
	fclose(ofs);	
	return 0;
}
