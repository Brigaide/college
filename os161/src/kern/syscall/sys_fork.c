#include <types.h>
#include <thread.h>
#include <current.h>
#include <addrspace.h>
#include <lib.h>
#include <kern/errno.h>
#include <syscall.h>
#include <proc.h>
#include <synch.h>



int sys_fork(struct trapframe * tf, int * retval){

  struct proc * new_child = NULL;
	struct addrspace * child_as = NULL;
  // Copy parent's address space
	int err = as_copy(curthread->t_proc->p_addrspace, &child_as);
  // check for success
	if (err) {
		*retval = -1;
		return err;
	}
  // Copy parent's trap frame, and pass it to child thread
  struct trapframe * child_tf = (struct trapframe *)kmalloc(sizeof(struct trapframe));
	*child_tf = *tf;
	if (child_tf == NULL) {
		return ENOMEM;
	}
  err = thread_fork("new thread", new_child, child_fork, child_tf, (unsigned long)child_as);
  kprintf("here\n");
  if (err) {
		kfree(child_tf);
		as_destroy(child_as);
		*retval = -1;
		return err;
	}
  kprintf("here2\n");
	*retval = new_child->pid;
  mips_usermode(&child_tf);
  kprintf("here3\n");
	return 0;
}

void child_fork(void * data1, unsigned long data2){
  kprintf("here5\n");
  (void)data2;
  struct trapframe child_tf = *(struct trapframe *)data1;
  child_tf.tf_v0 = 0; // return
  child_tf.tf_a3 = 0; //err
  child_tf.tf_epc += 4; //instruction offset
  kfree(data1); //remove malloc as info has been copied
  kprintf("here4\n");
  mips_usermode(&child_tf);
}
