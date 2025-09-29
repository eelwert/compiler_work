	.text
	.file	"compiler_study.c"
	.globl	print_values                    # -- Begin function print_values
	.p2align	4, 0x90
	.type	print_values,@function
print_values:                           # @print_values
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$256, %rsp                      # imm = 0x100
	testb	%al, %al
	je	.LBB0_9
# %bb.8:
	movaps	%xmm0, -176(%rbp)
	movaps	%xmm1, -160(%rbp)
	movaps	%xmm2, -144(%rbp)
	movaps	%xmm3, -128(%rbp)
	movaps	%xmm4, -112(%rbp)
	movaps	%xmm5, -96(%rbp)
	movaps	%xmm6, -80(%rbp)
	movaps	%xmm7, -64(%rbp)
.LBB0_9:
	movq	%r9, -184(%rbp)
	movq	%r8, -192(%rbp)
	movq	%rcx, -200(%rbp)
	movq	%rdx, -208(%rbp)
	movq	%rsi, -216(%rbp)
	movl	%edi, -4(%rbp)
	leaq	-32(%rbp), %rax
	leaq	-224(%rbp), %rcx
	movq	%rcx, 16(%rax)
	leaq	16(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movl	$48, 4(%rax)
	movl	$8, (%rax)
	movl	$0, -36(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB0_7
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	leaq	-32(%rbp), %rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	movl	-32(%rbp), %eax
	movl	%eax, -228(%rbp)                # 4-byte Spill
	cmpl	$40, %eax
	ja	.LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-240(%rbp), %rcx                # 8-byte Reload
	movl	-228(%rbp), %edx                # 4-byte Reload
	movslq	%edx, %rax
	addq	16(%rcx), %rax
	addl	$8, %edx
	movl	%edx, (%rcx)
	movq	%rax, -248(%rbp)                # 8-byte Spill
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-240(%rbp), %rcx                # 8-byte Reload
	movq	8(%rcx), %rax
	movq	%rax, %rdx
	addq	$8, %rdx
	movq	%rdx, 8(%rcx)
	movq	%rax, -248(%rbp)                # 8-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-248(%rbp), %rax                # 8-byte Reload
	movl	(%rax), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB0_1
.LBB0_7:
	leaq	.L.str.1(%rip), %rdi
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	callq	printf@PLT
	addq	$256, %rsp                      # imm = 0x100
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	print_values, .Lfunc_end0-print_values
	.cfi_endproc
                                        # -- End function
	.globl	special_function                # -- Begin function special_function
	.p2align	4, 0x90
	.type	special_function,@function
special_function:                       # @special_function
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	special_function, .Lfunc_end1-special_function
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	$40, -8(%rbp)
	movl	$50, -12(%rbp)
	movl	$60, -16(%rbp)
	leaq	.L.str.3(%rip), %rdi
	movl	$10, %esi
	movb	$0, %al
	callq	printf@PLT
	cmpl	$5, global_var(%rip)
	jle	.LBB2_10
# %bb.1:
	movl	$0, -20(%rbp)
.LBB2_2:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, -20(%rbp)
	jge	.LBB2_9
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=1
	movslq	-20(%rbp), %rcx
	movl	%ecx, %eax
	imulq	$1431655766, %rcx, %rdx         # imm = 0x55555556
	movq	%rdx, %rcx
	shrq	$63, %rcx
                                        # kill: def $ecx killed $ecx killed $rcx
	shrq	$32, %rdx
                                        # kill: def $edx killed $edx killed $rdx
	addl	%ecx, %edx
                                        # implicit-def: $rcx
	movl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	movl	%eax, -40(%rbp)                 # 4-byte Spill
	je	.LBB2_4
	jmp	.LBB2_11
.LBB2_11:                               #   in Loop: Header=BB2_2 Depth=1
	movl	-40(%rbp), %eax                 # 4-byte Reload
	subl	$1, %eax
	je	.LBB2_5
	jmp	.LBB2_12
.LBB2_12:                               #   in Loop: Header=BB2_2 Depth=1
	movl	-40(%rbp), %eax                 # 4-byte Reload
	subl	$2, %eax
	je	.LBB2_6
	jmp	.LBB2_7
.LBB2_4:                                #   in Loop: Header=BB2_2 Depth=1
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB2_7
.LBB2_5:                                #   in Loop: Header=BB2_2 Depth=1
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB2_7
.LBB2_6:                                #   in Loop: Header=BB2_2 Depth=1
	leaq	.L.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB2_7:                                #   in Loop: Header=BB2_2 Depth=1
	jmp	.LBB2_8
.LBB2_8:                                #   in Loop: Header=BB2_2 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB2_2
.LBB2_9:
	jmp	.LBB2_10
.LBB2_10:
	movl	$5, %edi
	callq	factorial
	movl	%eax, %esi
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$6, %edi
	callq	square@PLT
	movl	%eax, %esi
	leaq	.L.str.8(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	.L__const.main.p(%rip), %eax
	movl	%eax, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	shll	$24, %esi
	sarl	$24, %esi
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	shll	$16, %edx
	sarl	$24, %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	shll	$8, %ecx
	sarl	$24, %ecx
	leaq	.L.str.9(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$305419896, -36(%rbp)           # imm = 0x12345678
	movl	-36(%rbp), %esi
	movss	-36(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.10(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	movl	$3, %edi
	movl	$10, %esi
	movl	$20, %edx
	movl	$30, %ecx
	movb	$0, %al
	callq	print_values
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.globl	factorial                       # -- Begin function factorial
	.p2align	4, 0x90
	.type	factorial,@function
factorial:                              # @factorial
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jg	.LBB3_2
# %bb.1:
	movl	$1, -4(%rbp)
	jmp	.LBB3_3
.LBB3_2:
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	movl	-8(%rbp), %edi
	subl	$1, %edi
	callq	factorial
	movl	%eax, %ecx
	movl	-12(%rbp), %eax                 # 4-byte Reload
	imull	%ecx, %eax
	movl	%eax, -4(%rbp)
.LBB3_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	factorial, .Lfunc_end3-factorial
	.cfi_endproc
                                        # -- End function
	.type	global_var,@object              # @global_var
	.data
	.globl	global_var
	.p2align	2, 0x0
global_var:
	.long	10                              # 0xa
	.size	global_var, 4

	.type	const_var,@object               # @const_var
	.section	.rodata,"a",@progbits
	.globl	const_var
	.p2align	2, 0x0
const_var:
	.long	30                              # 0x1e
	.size	const_var, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"This function has a special attribute\n"
	.size	.L.str.2, 39

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Max of 5 and 10: %d\n"
	.size	.L.str.3, 21

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Red\n"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Green\n"
	.size	.L.str.5, 7

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Blue\n"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Factorial of 5: %d\n"
	.size	.L.str.7, 20

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Square of 6: %d\n"
	.size	.L.str.8, 17

	.type	.L__const.main.p,@object        # @__const.main.p
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.L__const.main.p:
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.zero	1
	.size	.L__const.main.p, 4

	.type	.L.str.9,@object                # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"Point coordinates: (%d, %d, %d)\n"
	.size	.L.str.9, 33

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Union as int: %x, as float: %f\n"
	.size	.L.str.10, 32

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym print_values
	.addrsig_sym printf
	.addrsig_sym factorial
	.addrsig_sym square
	.addrsig_sym global_var
