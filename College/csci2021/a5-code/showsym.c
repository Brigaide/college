// Template for parsing an ELF file to print its symbol table. You are
// free to rename any variables that appear below as you see fit.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <elf.h>


#define PTR_PLUS_BYTES(ptr,off) ((void *) (((size_t) (ptr)) + ((size_t) (off))))

int DEBUG = 0;                  // controls whether to print debug messages

int main(int argc, char *argv[]){
  if(argc < 2){
    printf("usage: %s [-d] <file>\n",argv[0]);
    return 0;
  }

  char *objfile_name = argv[1];

  // check for debug mode
  if(argc >=3){
    if(strcmp("-d",argv[1])==0){ // command line arg -d enables debug printing
      DEBUG = 1;
      objfile_name = argv[2];
    }
    else{
      printf("incorrect usage\n");
      return 1;
    }
  }


  // Open file descriptor and set up memory map for objfile_name
  // memory map the binary data file
  int fd = open(objfile_name, O_RDONLY);         // open file to get file descriptor
  struct stat stat_buf;
  fstat(fd, &stat_buf);                      // get stats on the open file such as size
  int size = stat_buf.st_size;               // size for mmap()'ed memory is size of file
  char *file_bytes =                         // pointer to file contents
    mmap(NULL, size, PROT_READ, MAP_SHARED,  // call mmap with given size and file descriptor
         fd, 0);                             // read only, potentially share, offset 0

  // CREATE A POINTER to the intial bytes of the file which are an ELF64_Ehdr struct
  Elf64_Ehdr *ehdr = (Elf64_Ehdr *) file_bytes;
  // CHECK e_ident field's bytes 0 to for for the sequence {0x7f,'E','L','F'}.

  int ident_matches =                // check the first bytes to ensure correct file format
    ehdr->e_ident[0] == 0x7F &&
    ehdr->e_ident[1] == 'E'  &&
    ehdr->e_ident[2] == 'L'  &&
    ehdr->e_ident[3] == 'F';

  // Exit the program with code 1 if the bytes do not match
  if(!ident_matches){
    printf("Magic bytes wrong, this is not an ELF file\n");
    exit(1);
  }

  // PROVIDED: check for a 64-bit file
  if(ehdr->e_ident[EI_CLASS] != ELFCLASS64){
    printf("Not a 64-bit file ELF file\n");
    return 1;
  }

  // PROVIDED: check for x86-64 architecture
  if(ehdr->e_machine != EM_X86_64){
    printf("Not an x86-64 file\n");
    return 1;
  }

  // DETERMINE THE OFFSET of the Section Header Array (e_shoff), the
  // number of sections (e_shnum), and the index of the Section Header
  // String table (e_shstrndx). These fields are from the ELF File
  // Header.

  // Set up a pointer to the array of section headers. Use the section
  // header string table index to find its byte position in the file
  // and set up a pointer to it.

  long off = ehdr->e_shoff;
  long num = ehdr->e_shnum;
  long ndx = ehdr->e_shstrndx;


  Elf64_Shdr *sec_hdrs = PTR_PLUS_BYTES(ehdr, off);
  char *sec_names = PTR_PLUS_BYTES(ehdr, sec_hdrs[ndx].sh_offset);

  // Search the Section Header Array for the section with name .symtab
  // (symbol table) and .strtab (string table).  Note their positions
  // in the file (sh_offset field).  Also note the size in bytes
  // (sh_size) and and the size of each entry (sh_entsize) for .symtab
  // so its number of entries can be computed.

  //flags to see if the sym and str were found
  int symflag = 0;
  int strflag = 0;

  //variables for the size,offset,entrysize, and entries
  long sym_offset = -1;
  long sym_size = -1;
  long sym_entsize = -1;
  long entries = -1;

  long strtab_offset = -1;

  //iterate through the number of sections
  for(int i=0; i<(num); i++){


    char *ptr = PTR_PLUS_BYTES(sec_hdrs[i].sh_name, sec_names);

    if(strcmp(".symtab", ptr) == 0){
      symflag = 1;
      sym_offset = sec_hdrs[i].sh_offset;
      sym_size = sec_hdrs[i].sh_size;
      sym_entsize =sec_hdrs[i].sh_entsize;

    }
    if(strcmp(".strtab", ptr) == 0){
      strflag = 1;
      strtab_offset = sec_hdrs[i].sh_offset;

    }

}
  //entries variable
  entries = ((sym_size)/(sym_entsize));


  if(symflag == 0){
    printf("Couldn't find symbol table\n");
    return 1;
    }

  if(strflag == 0){
    printf("Couldn't find string table\n");
    return 1;
  }



  // PRINT byte information about where the symbol table was found and
  // its sizes. The number of entries in the symbol table can be
  // determined by dividing its total size in bytes by the size of
  // each entry.
  printf("Symbol Table\n");
  printf("- %ld bytes offset from start of file\n", sym_offset);
  printf("- %ld bytes total size\n",sym_size);
  printf("- %ld bytes per entry\n",sym_entsize);
  printf("- %ld entries\n",entries);


  // Set up pointers to the Symbol Table and associated String Table
  // using offsets found earlier.
  Elf64_Sym *sym_table = PTR_PLUS_BYTES(ehdr, sym_offset);
  //char *str_table = PTR_PLUS_BYTES(sec_hdrs, strtab_offset);


  // Print column IDs for info on each symbol
  printf("[%3s]  %8s %4s %s\n",
         "idx","TYPE","SIZE","NAME");

  // Iterate over the symbol table entries
  for(int i=0; i<entries; i++){
    // Determine size of symbol and name.
    long symbolsize = sym_table[i].st_size;
    char *symname = (char *) (strtab_offset + sym_table[i].st_name + file_bytes);

    // Use <NONE> name has zero length.
    if (strlen(symname) == 0){
      symname = "<NONE>";
    }

    //code given to us to find typec
    unsigned char typec = ELF64_ST_TYPE(sym_table[i].st_info);

    //switch case that checks for the different
    char *simtype;
    switch (typec) {
      case STT_NOTYPE : simtype = "NOTYPE" ;break;
      case STT_OBJECT : simtype = "OBJECT" ;break;
      case STT_FUNC : simtype = "FUNC" ;break;
      case STT_FILE : simtype = "FILE" ;break;
      case STT_SECTION : simtype = "SECTION" ;break;
    }


    // Print symbol information
    printf("[%3d]: %8s %4lu %s\n",i,simtype,symbolsize,symname);
  }


  // Unmap file from memory and close associated file descriptor
  munmap(file_bytes, size);                  // unmap and close file
  close(fd);

  return 0;
}
