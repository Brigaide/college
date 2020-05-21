#include <stdio.h>                                                                                                                                                                                                                                                                                                                                                                                                                                                 #include <stdio.h>
#include <signal.h>
#include <unistd.h>

//int flag = 1;

void foo() {
  //flag = 0;
  while(1){
    sleep(1);
    static int count = 0;
    printf("%d: Count = %d\n", time(NULL), ++count);
  }
}

int main() {

	/* Print infinitely. */
	while (1) {
    struct sigaction newact;        // instantiate the signal action
    newact.sa_handler = foo;        // set signal handler to function
    sigemptyset(&newact.sa_mask);   // no other signals to be blocked

    newact.sa_flags = 0;            //no special options

    //while(flag){
    sigaction(SIGINT, &newact, NULL);  // if signal is caught, trigger the
                                         // function
	}
}
