#include <unistd.h>

#define PROG "/testbin/add"

/*  Simple program to test the fuctionality
 *  of execv. Calls the add program provided
 *  with OS/161. This should print out the
 *  value '70', although you are welcome to
 *  change the values at the top if you'd like.
 *  You should also change the provided add
 *  program to return the result of the add
 *  rather than print it out since we haven't
 *  implemented the file syscalls. No value
 *  should be printed out by this function
 *  since it will call execv. Feel free to
 *  modify this test to call other functions
 *  if you want to do more in-depth testing
 *  of your execv implementation.
 *
 *  Make sure that you have added a print
 *  statement to your _exit syscall
 *  implementation to print out the status of
 *  the process that just exited.
 */

int main() {

    char *arg0 = (char *) PROG;
    char *arg1 = (char *) "58";
    char *arg2 = (char *) "12";
    char *const paramList[4] = { arg0, arg1, arg2, NULL };

    execv(PROG, paramList);

    /* This point should never be reached */
    return -1;
}
