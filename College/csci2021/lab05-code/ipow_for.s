	.file	"ipow_for.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	ipow
	.type	ipow, @function
ipow:
.LFB1:
	.cfi_startproc
	movl	$0, %edx //this is the register for the i var and it starts at 0
	movl	$1, %eax //this is the register for the pow var and it starts at 1
	jmp	.L3
.L4:
	imull	%edi, %eax //this is how you find the base var because that is %eax and it is
										//being multiplied by %edi which is the register for base
	addl	$1, %edx //add one to i, iterate
.L3:
	cmpl	%esi, %edx //compare func that compares i to exp var, %esi is the exp var
	jl	.L4
	rep ret
	.cfi_endproc
.LFE1:
	.size	ipow, .-ipow
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
