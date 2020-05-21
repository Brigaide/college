#include <unistd.h>

/*
 *  Simple program that returns
 *  its pid. Should work once the
 *  getpid system call is implemented.
 *
 *  Make sure you have added a print
 *  statement in your _exit() syscall
 *  to print out the status of the
 *  exiting process.
 */
int main() {
    return getpid();
}
