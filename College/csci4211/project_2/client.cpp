//Rolling alphabetical table
//Client
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/tcp.h>
#include <sys/timeb.h>
#include <fcntl.h>
#include <stdarg.h>
#include <time.h>
#include <signal.h>

typedef unsigned char BYTE;
typedef unsigned int DWORD;
typedef unsigned short WORD;

void Error(const char * format, ...) {
	char msg[4096];
	va_list argptr;
	va_start(argptr, format);
	vsprintf(msg, format, argptr);
	va_end(argptr);
	fprintf(stderr, "Error: %s\n", msg);
	exit(-1);
}

void Log(const char * format, ...) {
	char msg[2048];
	va_list argptr;
	va_start(argptr, format);
	vsprintf(msg, format, argptr);
	va_end(argptr);
	fprintf(stderr, "%s\n", msg);
}

//Make sure the alphabetical tables are correct
void CheckData(BYTE * buf, int size) {
	for (int i=0; i<size; i++) if (buf[i] != 'A' + i % 26) {
		Error("Received wrong data.");
	}
}

int Send_Blocking(int sockFD, const BYTE * data, int len) {
	int nSent = 0;
	while (nSent < len) {
		int n = send(sockFD, data + nSent, len - nSent, 0);
		if (n >= 0) {
			nSent += n;
		} else if (n < 0 && (errno == ECONNRESET || errno == EPIPE)) {
			Log("Connection closed.");
			close(sockFD);
			return -1;
		} else {
			Error("Unexpected error %d: %s.", errno, strerror(errno));
		}
	}
	return 0;
}

int Recv_Blocking(int sockFD, BYTE * data, int len) {
	int nRecv = 0;
	while (nRecv < len) {
		int n = recv(sockFD, data + nRecv, len - nRecv, 0);
		if (n > 0) {
			nRecv += n;
		} else if (n == 0 || (n < 0 && errno == ECONNRESET)) {
			Log("Connection closed.");
			close(sockFD);
			return -1;
		} else {
			Error("Unexpected error %d: %s.", errno, strerror(errno));
		}
	}
	return 0;
}

//generate a random number between min and max
int GetRandom(int min, int max) {
	DWORD r = 0;
	for (int i=0; i<4; i++) {
		r = (r | (DWORD)(rand() % 256)) << 8;
	}

	return int(r % (max-min+1) + min);
}

void DoClient(const char * svrIP, int svrPort, int nReq, int minSize, int maxSize) {
	BYTE * buf = (BYTE *)malloc(maxSize);

	struct sockaddr_in serverAddr;
	memset(&serverAddr, 0, sizeof(serverAddr));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons((unsigned short) svrPort);
	inet_pton(AF_INET, svrIP, &serverAddr.sin_addr);

	//ignore the SIGPIPE signal that may crash the program in some corner cases
	signal(SIGPIPE, SIG_IGN);

	for (int i=0; i<nReq; i++) {		//Make nReq requests
		//Create the socket
	int sockFD = socket(AF_INET, SOCK_STREAM, 0);
	if (sockFD == -1) { 
		Error("Cannot create socket.");
	}

	int size = GetRandom(minSize, maxSize);	//Randomize the request size

	struct timeb t;
	ftime(&t);
	double beginTime =  t.time + t.millitm / (double) 1000.0f;	//record when we start

	//Connect to server
	if (connect(sockFD, (const struct sockaddr *) &serverAddr, sizeof(serverAddr)) != 0) {
		Error("Cannot connect to server %s:%d.", svrIP, svrPort);
	}

		//Send 4-byte request
		if (Send_Blocking(sockFD, (const BYTE *)&size, 4) < 0) break;

		//Read response
		if (Recv_Blocking(sockFD, buf, size) < 0) break;

		ftime(&t);
		double endTime =  t.time + t.millitm / (double) 1000.0f;	//record when we stop

		Log("Transaction %d: %d bytes, %.2lf seconds.", i, size, endTime - beginTime);

		CheckData(buf, size);
		close(sockFD);
	}

	free(buf);
}

char * getCommand(char * buff){
	char * loc = strchr(buff, ' ');

  char * command = (char *) malloc(sizeof(char)*((loc-buff)+1));
  strncpy(command, buff, (loc-buff));
  command[(loc-buff)] = '\0';

  return command;
}

//gets first input when there are two inputs
char * getFirstInput(char * buff, int cmdlength){
  char * firstInput = getCommand(buff+cmdlength);
  return firstInput;
}

//gets first input when there is only one input
char * getFirstInput_2(char * buff, int cmdlength){
  char * firstInput = buff+cmdlength;
  return firstInput;
}

//gets second input when there are two inputs
char * getSecondInput(char * buff, int cmdlength, int firstlength){
  char * secondInput = buff+cmdlength+firstlength+1;
  return secondInput;
}


int main(int argc, char * * argv) {

	if (argc != 6) {
		Log("Usage: %s [server IP] [server Port] [# requests] [min_request_size] [max_request_size]", argv[0]);
		return -1;
	}

	const char * serverIP = argv[1];
	int port = atoi(argv[2]);
	int nReq = atoi(argv[3]);
	int minSize = atoi(argv[4]);
	int maxSize = atoi(argv[5]);
	int BUF_SIZE = 271;
	const char *FILE_NAME = "testtxt.txt";

	srand(time(NULL));

	char buff[BUF_SIZE];

	FILE *ptr = fopen(FILE_NAME, "r");


	if (ptr == NULL){
		return -1;
	}

	while (fgets(buff, BUF_SIZE, ptr) != NULL){
		char *lineptr = &buff[0];
		char * command = getCommand(buff);
		printf("%s\n", command);

		// if (strcmp(command, "REGISTER") == 0){
		// 	char * firstInput = getFirstInput(buff, 9);
		// 	printf("%s\n", firstInput);
		//
		// 	char * secondInput = getSecondInput(buff, 9, strlen(firstInput));
		// 	printf("%s\n", secondInput);
		//
		// }

		// else if (strcmp(command, "LOGIN") == 0){
		//   char * firstInput = getFirstInput(buff, 6);
		//   printf("%s\n", firstInput);
		//
		//   char * secondInput = getSecondInput(buff, 6, strlen(firstInput));
		//   printf("%s\n", secondInput);
		// }
		//
		// // else if (strcmp(command, "LOGOUT") == 0){
		// //   //no inputs
		// // }
		//
		if (strcmp(command, "SEND") == 0){
		  char * firstInput = getFirstInput_2(buff, 5);
		  printf("%s\n", firstInput);
			DoClient(serverIP, port, nReq, minSize, maxSize);
		}
		//
		// else if (strcmp(command, "SEND2")== 0){
		//   char * firstInput = getFirstInput(buff, 6);
		//   printf("%s\n", firstInput);
		//
		//   char * secondInput = getSecondInput(buff, 6, strlen(firstInput));
		//   printf("%s\n", secondInput);
		// }
		//
		// else if (strcmp(command, "SENDA") == 0){
		//   char * firstInput = getFirstInput_2(buff, 6);
		//   printf("%s\n", firstInput);
		// }
		//
		// else if (strcmp(command, "SENDA2") == 0){
		//   char * firstInput = getFirstInput(buff, 7);
		//   printf("%s\n", firstInput);
		//
		//   char * secondInput = getSecondInput(buff, 7, strlen(firstInput));
		//   printf("%s\n", secondInput);
		// }
		//
		// else if (strcmp(command, "SENDF") == 0){
		//   char * firstInput = getFirstInput_2(buff, 7);
		//   printf("%s\n", firstInput);
		// }
		//
		// else if (strcmp(command, "SENDF2") == 0){
		//   char * firstInput = getFirstInput(buff, 7);
		//   printf("%s\n", firstInput);
		//
		//   char * secondInput = getSecondInput(buff, 7, strlen(firstInput));
		//   printf("%s\n", secondInput);
		// }
		//
		// // else if (strcmp(command, "LIST") == 0){
		// //   //no inputs(list users)
		// // }
		//
		// else if (strcmp(command, "DELAY") == 0){
		//   char * firstInput = getFirstInput_2(buff, 6);
		//   printf("%s\n", firstInput);
		// }

		else{
			printf("Allowed inputs are REGISTER, LOGIN, LOGOUT, SEND, SEND2, SENDA, SENDA2, SENDF, SENDF2, LIST, or DELAY");
			break;
		}
	}

}
