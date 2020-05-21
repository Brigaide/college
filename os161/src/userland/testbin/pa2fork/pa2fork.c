#include <unistd.h>

/*
 *  Simple program for testing
 *  fork system call. Should
 *  print two numbers: zero for
 *  the child process and the
 *  pid of the child for the
 *  parent process.
 *
 *  Make sure you have added a
 *  print statement in your
 *  _exit syscall to print out
 *  the status of the exiting
 *  process.
 */
int main() {
    int pid = fork();
    return pid;
}
