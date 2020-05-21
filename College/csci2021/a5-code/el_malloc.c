// el_malloc.c: implementation of explicit list malloc functions.

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "el_malloc.h"

////////////////////////////////////////////////////////////////////////////////
// Global control functions

// Global control variable for the allocator. Must be initialized in
// el_init().
el_ctl_t el_ctl = {};

// Create an initial block of memory for the heap using
// malloc(). Initialize the el_ctl data structure to point at this
// block. Initialize the lists in el_ctl to contain a single large
// block of available memory and no used blocks of memory.
int el_init(int max_bytes){
  void *heap = malloc(max_bytes);
  if(heap == NULL){
    fprintf(stderr,"el_init: malloc() failed in setup\n");
    exit(1);
  }

  el_ctl.heap_bytes = max_bytes; // make the heap as big as possible to begin with
  el_ctl.heap_start = heap;      // set addresses of start and end of heap
  el_ctl.heap_end   = PTR_PLUS_BYTES(heap,max_bytes);

  if(el_ctl.heap_bytes < EL_BLOCK_OVERHEAD){
    fprintf(stderr,"el_init: heap size %ld to small for a block overhead %ld\n",
            el_ctl.heap_bytes,EL_BLOCK_OVERHEAD);
    return 1;
  }

  el_init_blocklist(&el_ctl.avail_actual);
  el_init_blocklist(&el_ctl.used_actual);
  el_ctl.avail = &el_ctl.avail_actual;
  el_ctl.used  = &el_ctl.used_actual;

  // establish the first available block by filling in size in
  // block/foot and null links in head
  size_t size = el_ctl.heap_bytes - EL_BLOCK_OVERHEAD;
  el_blockhead_t *ablock = el_ctl.heap_start;
  ablock->size = size;
  ablock->state = EL_AVAILABLE;
  el_blockfoot_t *afoot = el_get_footer(ablock);
  afoot->size = size;
  el_add_block_front(el_ctl.avail, ablock);
  return 0;
}

// Clean up the heap area associated with the system which simply
// calls free() on the malloc'd block used as the heap.
void el_cleanup(){
  free(el_ctl.heap_start);
  el_ctl.heap_start = NULL;
  el_ctl.heap_end   = NULL;
}

////////////////////////////////////////////////////////////////////////////////
// Pointer arithmetic functions to access adjacent headers/footers

// Compute the address of the foot for the given head which is at a
// higher address than the head.
el_blockfoot_t *el_get_footer(el_blockhead_t *head){
  size_t size = head->size;
  el_blockfoot_t *foot = PTR_PLUS_BYTES(head, sizeof(el_blockhead_t) + size);
  return foot;
}

// REQUIRED
// Compute the address of the head for the given foot which is at a
// lower address than the foot.
el_blockhead_t *el_get_header(el_blockfoot_t *foot){
  size_t size = foot->size; //gets the size of the footer
  //subtracts the size of the footer and the size of a blockhead from the foot
  el_blockhead_t *head = PTR_MINUS_BYTES(foot, sizeof(el_blockhead_t) + size);
  return head;
}

// Return a pointer to the block that is one block higher in memory
// from the given block.  This should be the size of the block plus
// the EL_BLOCK_OVERHEAD which is the space occupied by the header and
// footer. Returns NULL if the block above would be off the heap.
// DOES NOT follow next pointer, looks in adjacent memory.
el_blockhead_t *el_block_above(el_blockhead_t *block){
  el_blockhead_t *higher =
    //adds the block size plus the size of a whole block
    PTR_PLUS_BYTES(block, block->size + EL_BLOCK_OVERHEAD);

  //checks to see if it will fall off the heap
  if((void *) higher >= (void*) el_ctl.heap_end){
    return NULL;
  }
  else{
    return higher;
  }
}

// REQUIRED
// Return a pointer to the block that is one block lower in memory
// from the given block.  Uses the size of the preceding block found
// in its foot. DOES NOT follow next pointer, looks in adjacent
// memory. Returns NULL if the block below would be outside the heap.
el_blockhead_t *el_block_below(el_blockhead_t *block){
  el_blockfoot_t *prevfoot = PTR_MINUS_BYTES(block, sizeof(el_blockfoot_t));

  //checks to see if it will fall off the heap
  if((void * ) prevfoot <= (void *) el_ctl.heap_start){
    return NULL;
  }

  else{
    //gets the header of the lower block
    el_blockhead_t *lower = el_get_header(prevfoot);
    return lower;
  }
}

////////////////////////////////////////////////////////////////////////////////
// Block list operations

// Print an entire blocklist. The format appears as follows.
//
// blocklist{length:      5  bytes:    566}
//   [  0] head @    618 {state: u  size:    200}  foot @    850 {size:    200}
//   [  1] head @    256 {state: u  size:     32}  foot @    320 {size:     32}
//   [  2] head @    514 {state: u  size:     64}  foot @    610 {size:     64}
//   [  3] head @    452 {state: u  size:     22}  foot @    506 {size:     22}
//   [  4] head @    168 {state: u  size:     48}  foot @    248 {size:     48}
//   index        offset        a/u                       offset
//
// Note that the '@ offset' column is given from the starting heap
// address (el_ctl->heap_start) so it should be run-independent.
void el_print_blocklist(el_blocklist_t *list){
  printf("blocklist{length: %6lu  bytes: %6lu}\n", list->length,list->bytes);
  el_blockhead_t *block = list->beg;
  for(int i=0; i<list->length; i++){
    printf("  ");
    block = block->next;
    printf("[%3d] head @ %6lu ", i,PTR_MINUS_PTR(block,el_ctl.heap_start));
    printf("{state: %c  size: %6lu}", block->state,block->size);
    el_blockfoot_t *foot = el_get_footer(block);
    printf("  foot @ %6lu ", PTR_MINUS_PTR(foot,el_ctl.heap_start));
    printf("{size: %6lu}", foot->size);
    printf("\n");
  }
}

// Print out basic heap statistics. This shows total heap info along
// with the Available and Used Lists. The output format resembles the following.
//
// HEAP STATS
// Heap bytes: 1024
// AVAILABLE LIST: blocklist{length:      3  bytes:    458}
//   [  0] head @    858 {state: a  size:    126}  foot @   1016 {size:    126}
//   [  1] head @    328 {state: a  size:     84}  foot @    444 {size:     84}
//   [  2] head @      0 {state: a  size:    128}  foot @    160 {size:    128}
// USED LIST: blocklist{length:      5  bytes:    566}
//   [  0] head @    618 {state: u  size:    200}  foot @    850 {size:    200}
//   [  1] head @    256 {state: u  size:     32}  foot @    320 {size:     32}
//   [  2] head @    514 {state: u  size:     64}  foot @    610 {size:     64}
//   [  3] head @    452 {state: u  size:     22}  foot @    506 {size:     22}
//   [  4] head @    168 {state: u  size:     48}  foot @    248 {size:     48}
void el_print_stats(){
  printf("HEAP STATS\n");
  printf("Heap bytes: %lu\n",el_ctl.heap_bytes);
  printf("AVAILABLE LIST: ");
  el_print_blocklist(el_ctl.avail);
  printf("USED LIST: ");
  el_print_blocklist(el_ctl.used);
}

// Initialize the specified list to be empty. Sets the beg/end
// pointers to the actual space and initializes those data to be the
// ends of the list.  Initializes length and size to 0.
void el_init_blocklist(el_blocklist_t *list){
  list->beg        = &(list->beg_actual);
  list->beg->state = EL_BEGIN_BLOCK;
  list->beg->size  = EL_UNINITIALIZED;
  list->end        = &(list->end_actual);
  list->end->state = EL_END_BLOCK;
  list->end->size  = EL_UNINITIALIZED;
  list->beg->next  = list->end;
  list->beg->prev  = NULL;
  list->end->next  = NULL;
  list->end->prev  = list->beg;
  list->length     = 0;
  list->bytes      = 0;
}

// REQUIRED
// Add to the front of list; links for block are adjusted as are links
// within list.  Length is incremented and the bytes for the list are
// updated to include the new block's size and its overhead.
void el_add_block_front(el_blocklist_t *list, el_blockhead_t *block){

  //given code to add to front
  block->prev = list->beg;
  block->next = list->beg->next;
  block->prev->next = block;
  block->next->prev = block;

  //iterates list length by one and bytes by a whole block
  list->length += 1;
  list->bytes += block->size + EL_BLOCK_OVERHEAD;

}

// REQUIRED
// Unlink block from the list it is in which should be the list
// parameter.  Updates the length and bytes for that list including
// the EL_BLOCK_OVERHEAD bytes associated with header/footer.
void el_remove_block(el_blocklist_t *list, el_blockhead_t *block){

  //given code to unlink a block
  block->prev->next = block->next;
  block->next->prev = block->prev;

  //will iterate the length and bytes down
  list->bytes = ((list->bytes) - (block->size + EL_BLOCK_OVERHEAD));
  list->length -= 1;


}

////////////////////////////////////////////////////////////////////////////////
// Allocation-related functions

// REQUIRED
// Find the first block in the available list with block size of at
// least (size+EL_BLOCK_OVERHEAD). Overhead is accounted so this
// routine may be used to find an available block to split: splitting
// requires adding in a new header/footer. Returns a pointer to the
// found block or NULL if no of sufficient size is available.
el_blockhead_t *el_find_first_avail(size_t size){
  el_blockhead_t *curnode = el_ctl.avail->beg;

  //while the current node is not null, chech if it has enough space
  while (curnode != NULL){
    if (curnode->size >= (size + EL_BLOCK_OVERHEAD)){
      return curnode;
    }
    //if not, keep iterating
    curnode = curnode->next;
  }
  return NULL;
}


// REQUIRED
// Set the pointer to block to the given size and add a footer to
// it. Creates another block above it by creating a new header and
// assigning it the remaining space. Ensures that the new block has a
// footer with the correct size. Returns a pointer to the newly
// created block while the prev block has its size altered to
// parameter size. Does not do any linking of blocks.  If the
// parameter block does not have sufficient size for a split (at least
// new_size + EL_BLOCK_OVERHEAD for the new header/footer) makes no
// changes and returns NULL.

el_blockhead_t *el_split_block(el_blockhead_t *block, size_t new_size){


  //if there is not sufficient space, return null
  if(block->size < (new_size + EL_BLOCK_OVERHEAD)){
    return NULL;
  }

  else{

    //this is the old size
    size_t prevsize = block->size;

    //this is the foot of the big block
    el_blockfoot_t *foot = el_get_footer(block);


    //this is the new size
    block->size = new_size;

    //this is the block which will be the foot of the new size
    el_blockfoot_t * newfoot = el_get_footer(block);

    //setting the new foot to have the new size
    newfoot->size = new_size;

    //this is the block above in memory
    el_blockhead_t * splitblock = el_block_above(block);

    //the new size will be the old block size minus the new size
    splitblock->size = prevsize - (new_size + EL_BLOCK_OVERHEAD);


    //this is setting the new foot size to the size of the block above
    foot->size = splitblock->size;


    return splitblock;

  }
}

// REQUIRED
// Return pointer to a block of memory with at least the given size
// for use by the user.  The pointer returned is to the usable space,
// not the block header. Makes use of find_first_avail() to find a
// suitable block and el_split_block() to split it.  Returns NULL if
// no space is available.
void *el_malloc(size_t nbytes){

  //use find first avail to get the block that has space for nbytes
  el_blockhead_t *blockmem = el_find_first_avail(nbytes);

  //if the block reaches the end, then there is no avail, return null
  if(blockmem == NULL){
    return NULL;
  }
  else{

    //remove the block from the available list
    el_remove_block(el_ctl.avail, blockmem);

    //split the block at nbytes
    el_blockhead_t * retblock = el_split_block(blockmem, nbytes);

    //change the state of the beginning part to used
    blockmem->state = EL_USED;

    //change the state of the end part to available
    retblock->state = EL_AVAILABLE;

    //add the beginning to the used list
    el_add_block_front(el_ctl.used, blockmem);

    //add the end to the available list
    el_add_block_front(el_ctl.avail, retblock);

    //the pointer should be after the head
    void *useable = PTR_PLUS_BYTES(blockmem, sizeof(el_blockhead_t));

    return useable;
  }
}

////////////////////////////////////////////////////////////////////////////////
// De-allocation/free() related functions

// REQUIRED
// Attempt to merge the block lower with the next block in
// memory. Does nothing if lower is null or not EL_AVAILABLE and does
// nothing if the next higher block is null (because lower is the last
// block) or not EL_AVAILABLE.  Otherwise, locates the next block with
// el_block_above() and merges these two into a single block. Adjusts
// the fields of lower to incorporate the size of higher block and the
// reclaimed overhead. Adjusts footer of higher to indicate the two
// blocks are merged.  Removes both lower and higher from the
// available list and re-adds lower to the front of the available
// list.
void el_merge_block_with_above(el_blockhead_t *lower){
  if (lower == NULL){
    return;
  }

  //this is the block above in memory
  el_blockhead_t *next = el_block_above(lower);

  //if the next is null
  if (next == NULL){
	  return;
  }

  //if the state of the lower block and the state of the next block are available
  if ((lower->state == EL_AVAILABLE) && (next->state == EL_AVAILABLE)){

     //removes both lower and higher from the available list
     el_remove_block(el_ctl.avail, next);
     el_remove_block(el_ctl.avail, lower);

      //incorporating size of the higher block
      size_t lowersize = lower->size;
      size_t nextsize = next->size;
      size_t newblocksize = (lowersize + nextsize) + EL_BLOCK_OVERHEAD;

      //adjusts footer of higher to indicate the two blocks are merged
      lower->size = newblocksize;
      el_blockfoot_t *higherfoot = el_get_footer(lower);
      higherfoot->size = newblocksize;

      //re-adds lower to the front of the available list
      el_add_block_front(el_ctl.avail, lower);
  }
}

// REQUIRED
// Free the block pointed to by the give ptr.  The area immediately
// preceding the pointer should contain an el_blockhead_t with information
// on the block size. Attempts to merge the free'd block with adjacent
// blocks using el_merge_block_with_above().
void el_free(void *ptr){

  //the current block should be the subtraction of the ptr and a whole head
  el_blockhead_t *current = PTR_MINUS_BYTES(ptr, sizeof(el_blockhead_t));

  //the current will be removed from the used list
  el_remove_block(el_ctl.used, current);

  //the state of current will be changed to available
  current->state = EL_AVAILABLE;

  //the current will be added to the front of the available list
  el_add_block_front(el_ctl.avail, current);

  //the block will merge with whats above it
  el_merge_block_with_above(current);

  //then it has to check if the block below it is null
  el_blockhead_t *below = el_block_below(current);
  if (below == NULL){
	return;
  }

  //if not, then it should merge below and current
  else{
  el_merge_block_with_above(below);

  }

}
