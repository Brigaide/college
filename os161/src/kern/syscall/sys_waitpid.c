#include <syscall.h>
#include <thread.h>
#include <current.h>
#include <spinlock.h>
#include <kern/wait.h>
#include <proc.h>
#include <synch.h>
#include <kern/errno.h>
#include <copyinout.h>
#include <proc.h>

// struct spinlock *process_array_lock;
struct semaphore pp_lock;

int sys_waitpid(pid_t child_pid, userptr_t status, int *retval, int flags){
  // check for flags
  if (flags != 0) {
		*retval = -1;
		return EINVAL;
	}
  // check if child pid is in appropriate range
	if (child_pid< 1 || child_pid > MAX_PROCESS_NO) {
		*retval = -1;
		return ESRCH;
	}
  // check that the pid is associated with a process, now that we have checked
  // that it is 'in bounds'
	if (process_array[child_pid] == NULL) {
		*retval = -1;
		return ESRCH;
	}
  // check if the process array parent pid matches the current threads pid
  if (process_array[child_pid]->parentprocess->pid != curthread->t_proc->pid) {
		*retval = -1;
		return ECHILD;
	}
  if (status == NULL) {
		*retval = -1;
		return EFAULT;
	}

  lock_acquire(wait_pid_lock);
  if (process_array[child_pid]->exited == 1) {
		copyout((const void *)&process_array[child_pid]->exit_code, status, sizeof(int));
		*retval = child_pid;
    kfree(process_array[child_pid]);
	  process_array[child_pid] = NULL;
	}
  else {
		while (process_array[child_pid]->exited != 1) {
			cv_wait(wait_pid_cv, wait_pid_lock);
		}

		//lock_acquire(waitpidlock);
		copyout((const void *)&process_array[child_pid]->exit_code, status, sizeof(int));
		*retval = child_pid;
    kfree(process_array[child_pid]);
	  process_array[child_pid] = NULL;
	}


  lock_release(wait_pid_lock);
  return 0;

}
