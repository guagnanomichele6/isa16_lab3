#################
# Basic VERSION
# This program takes an array v and computes
# min{|v[i]|}, the minimum of the absolute value,
# where v[i] is the i-th element in the array
	.data
	.align	2
v:
	.word	10
	.word	-47
	.word	22
	.word	-3
	.word	15
	.word	27
	.word	-4
m:
	.word	0

	.text
	.align	2
	.globl	__start
__start:
	addi x16,x0,0x00000007    # put 7 in x16
	auipc x4,0x0000fc10	# put in x4 the address of v
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x4,x4,0xfffffffc
	auipc x5,0x0000fc10	# put in x5 the address of m
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x5,x5,0x00000010
	lui x13,0x00040000 	# init x13 with max pos
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x13,x13,0xffffffff
loop:
	beq x16,x0,done   	# check all elements have been tested
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	lw x8,0(x4)       	# load new element in x8
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	srai x9,x8,31    	# apply shift to get sign mask in x9
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	xor x10,x8,x9     	# x10 = sign(x8)^x8
	andi x9,x9,0x1    	# x9 &= 0x1 (carry in)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	add x10,x10,x9   	 # x10 += x9 (add the carry in)
	addi x4,x4,0x4	  	# point to next element
	addi x16,x16,-1  	 # decrease x16 by 1
	addi x0,x0,0		# (NOP)
	slt x11,x10,x13   	# x11 = (x10 < x13) ? 1 : 0
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	beq x11,x0,loop   	# next element
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	add x13,x10,x0   	 # update min
	jal loop          	# next element
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
done:
	sw x13,0(x5)      	# store the result
endc:
	jal endc  	  		# infinite loop
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
	addi x0,x0,0		# (NOP)
