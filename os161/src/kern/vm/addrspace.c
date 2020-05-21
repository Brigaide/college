/*
 * Copyright (c) 2000, 2001, 2002, 2003, 2004, 2005, 2008, 2009
 *	The President and Fellows of Harvard College.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <types.h>
#include <kern/errno.h>
#include <lib.h>
#include <addrspace.h>
#include <vm.h>
#include <proc.h>
#include <coremap.h>

/*
 * Note! If OPT_DUMBVM is set, as is the case until you start the VM
 * assignment, this file is not compiled or linked or in any way
 * used. The cheesy hack versions in dumbvm.c are used instead.
 */

struct addrspace *as_create(void){

	struct addrspace *as;
	as = kmalloc(sizeof(struct addrspace));

	if (as == NULL) {
		return NULL;
	}

	for (int i = 0; i < 128; i++){

		as.ptable_array[i].virtual = NULL;
		as.ptable_array[i].physical = NULL;
		as.ptable_array[i].avail = 0;

	}

	as->as_vbase1 = 0;
	as->as_pbase1 = 0;
	as->as_npages1 = 0;
	as->as_vbase2 = 0;
	as->as_pbase2 = 0;
	as->as_npages2 = 0;
	as->as_stackpbase = 0;



	/*
	 * Initialize as needed.
	 */

	return as;
}

/*
	*    as_create - create a new empty address space. You need to make
  *                sure this gets called in all the right places. You
  *                may find you want to change the argument list. May
  *                return NULL on out-of-memory error.
*/

int as_copy(struct addrspace *old, struct addrspace **ret){

	struct addrspace *newas;
	newas = as_create();

	if (newas==NULL) {
		return ENOMEM;
	}
	int i;
	for(i = 0; i < 128; i++){
		if(old.ptable_array[i].avail){
			newas.ptable_array[i].virtual = old.segment_table[i].virtual;
			newas.ptable_array[i].physical = old.segment_table[i].physical;
			newas.ptable_array[i].avail = 1;
		}
	}

	(void)old;

	*ret = newas;
	return 0;
}

void as_destroy(struct addrspace *as){

//loop thru 1st lvl page table
int i,j;
	for(i = 0; i < 128; i++)
		if(as.page_table[i].avail) {
			//TODO
    	free_kpages(as.page_table[i].virtual);
    }
	}
	//free addrspace struct
	kfree(as);
}

void
as_activate(void)
{
	struct addrspace *as;

	as = proc_getas();
	if (as == NULL) {
		/*
		 * Kernel thread without an address space; leave the
		 * prior address space in place.
		 */
		return;
	}

	/*
	 * Write this.
	 */
}

void
as_deactivate(void)
{
	/*
	 * Write this. For many designs it won't need to actually do
	 * anything. See proc.c for an explanation of why it (might)
	 * be needed.
	 */
	 return;
}

/*
 * Set up a segment at virtual address VADDR of size MEMSIZE. The
 * segment in memory extends from VADDR up to (but not including)
 * VADDR+MEMSIZE.
 *
 * The READABLE, WRITEABLE, and EXECUTABLE flags are set if read,
 * write, or execute permission should be set on the segment. At the
 * moment, these are ignored. When you write the VM system, you may
 * want to implement them.
 */
int
as_define_region(struct addrspace *as, vaddr_t vaddr, size_t memsize,
		 int readable, int writeable, int executable)
{
	size_t npages;

	/* Align the region. First, the base... */
	memsize += vaddr & ~(vaddr_t)PAGE_FRAME;
	vaddr &= PAGE_FRAME;

	/* ...and now the length. */
	memsize = (memsize + PAGE_SIZE - 1) & PAGE_FRAME;

	npages = memsize / PAGE_SIZE;

	/* We don't use these - all pages are read-write */
	(void)readable;
	(void)writeable;
	(void)executable;

	if (as->as_vbase1 == 0) {
		as->as_vbase1 = vaddr;
		as->as_npages1 = npages;
		for(int i = 0; i < npages; i++){
			for(int j=0; j < 128; j++){
				if (as.ptable_array[j].avail == 0){
					as.ptable_array[j].virtual = vaddr;
					as.ptable_array[j].physical = 
				}
			}
		}
		return 0;
	}

	if (as->as_vbase2 == 0) {
		as->as_vbase2 = vaddr;
		as->as_npages2 = npages;
		return 0;
	}

	return 0;

	/*
	 * Write this.
	 */

	(void)as;
	(void)vaddr;
	(void)memsize;
	return ENOSYS;
}

int
as_prepare_load(struct addrspace *as)
{
	/*
	 * Write this.
	 */

	int x = vaddr;
 	for(int i = 0; i < npages; i++) {
 		if(as.ptable_array[i].avail == 0){
 			as.ptable_array[i].virtual = x;
 			x = x + PAGE_SIZE;
 			for(int j = 0; j < 128; j++){
 				if (isfree(j)){
 					x + (i*PAGE_SIZE);
 				}
 			}

 			as.ptable_array[i].avail = 1;
 		}
 	}

	(void)as;
	return 0;
}

int
as_complete_load(struct addrspace *as)
{
	/*
	 * Write this.
	 */

	 vm_tlbshootdown_all();

	(void)as;
	return 0;
}

int
as_define_stack(struct addrspace *as, vaddr_t *stackptr)
{
	/*
	 * Write this.
	*/

	(void)as;

	/* Initial user-level stack pointer */
	*stackptr = USERSTACK;

	return 0;
}