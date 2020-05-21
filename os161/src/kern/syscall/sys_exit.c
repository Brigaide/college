#include <syscall.h>
#include <thread.h>
#include <current.h>
#include <spinlock.h>
#include <kern/wait.h>
#include <proc.h>

void sys_exit(int code){
  spinlock_acquire(&curthread->t_proc->p_lock);
  curthread->t_proc->exit_code = _MKWAIT_EXIT(code);
  curthread->t_proc->exited = 1;
	spinlock_release(&curthread->t_proc->p_lock);
  kprintf("here3\n");
	thread_exit();

}
