	.file	1 "a_swa.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,88,$31		# vars= 56, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,76($fp)
	li	$2,10			# 0xa
	sw	$2,36($fp)
	li	$2,20			# 0x14
	sw	$2,40($fp)
	li	$2,30			# 0x1e
	sw	$2,44($fp)
	li	$2,40			# 0x28
	sw	$2,48($fp)
	li	$2,50			# 0x32
	sw	$2,52($fp)
	sw	$0,56($fp)
	li	$2,1			# 0x1
	sw	$2,60($fp)
	li	$2,2			# 0x2
	sw	$2,64($fp)
	li	$2,3			# 0x3
	sw	$2,68($fp)
	li	$2,4			# 0x4
	sw	$2,72($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L3:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,80
	addu	$2,$3,$2
	lw	$2,-44($2)
	sw	$2,32($fp)
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,80
	addu	$2,$3,$2
	lw	$3,-24($2)
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,80
	addu	$2,$4,$2
	sw	$3,-44($2)
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,80
	addu	$2,$3,$2
	lw	$3,32($fp)
	sw	$3,-24($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,4
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,76($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,84($sp)
	lw	$fp,80($sp)
	addiu	$sp,$sp,88
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
