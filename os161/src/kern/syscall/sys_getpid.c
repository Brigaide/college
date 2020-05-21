#include <syscall.h>
#include <thread.h>
#include <current.h>
#include <spinlock.h>
#include <kern/wait.h>
#include <proc.h>


int sys_getpid(int *retval) {
  //set the return value to the pid of current proc

  *retval = curthread->t_proc->pid;
  return 0;
}
