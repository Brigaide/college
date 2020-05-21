	.file	"col_check.c"
	.text
	.globl	col_check
	.type	col_check, @function
col_check:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	cmpl	$0, -8(%rbp)
	jg	.L2
	orl	$1, -12(%rbp)
.L2:
	cmpl	$0, -4(%rbp)
	jns	.L3
	orl	$2, -12(%rbp)
.L3:
	cmpl	$1, -8(%rbp)
	jne	.L4
	cmpl	$0, -4(%rbp)
	jns	.L4
	orl	$4, -12(%rbp)
.L4:
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	col_check, .-col_check
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
