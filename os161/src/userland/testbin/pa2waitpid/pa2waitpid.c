#include <unistd.h>

#define WAIT_TIME 5 /* in seconds */

/*
 *  Simple program for tesing waitpid
 *  implementation. Also requires that
 *  fork be implemented or else we
 *  cannot generate a process to wait
 *  on.
 *
 *  Will fork a child process that will
 *  busy wait for a few seconds. Should
 *  print out zero when the child exits
 *  followed by the parent printing out
 *  the child's pid when it exits, since
 *  the parent will wait for the child
 *  to finish before exiting.
 *
 *  Make sure you have added a print
 *  statment to your _exit syscall to
 *  print the status of the exiting
 *  process.
 */

int main() {
    int pid = fork();
    if (pid == 0) { /* Child process */
        time_t start, end;
        time(&start);

        /* Wait for specified time */
        while(1) {
            time(&end);
            if (end - start > WAIT_TIME)
                return 0;
        }
    }

    /* Parent process */
    int status = -1;
    waitpid(pid, &status, 0);

    if (status == 0) { /* Child returned normally */
        return pid;
    }

    /* Return -1 if child did not exit normally */
    return -1;
}

