	.file	1 "ls.c"
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
	.frame	$fp,256,$31		# vars= 224, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-256
	sw	$31,252($sp)
	sw	$fp,248($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,244($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L3:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$2,-204($2)
	sw	$2,36($fp)
	lw	$2,36($fp)
	sw	$2,32($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$3,28($fp)
	lw	$2,40($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	li	$2,1			# 0x1
	sw	$2,28($fp)
	.option	pic0
	b	$L4
	nop

	.option	pic2
$L7:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$2,-204($2)
	lw	$3,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L5
	nop

	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$2,-204($2)
	sw	$2,32($fp)
$L5:
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$2,-204($2)
	lw	$3,36($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L6
	nop

	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,248
	addu	$2,$3,$2
	lw	$2,-204($2)
	sw	$2,36($fp)
$L6:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L4:
	lw	$3,28($fp)
	lw	$2,40($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L7
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,244($fp)
	lw	$3,0($3)
	beq	$4,$3,$L9
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L9:
	move	$sp,$fp
	lw	$31,252($sp)
	lw	$fp,248($sp)
	addiu	$sp,$sp,256
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
