	.globl hash
	
	.eqv P, 33	# define 'P'
	.eqv M, 4103	# define 'M'
	
	.text
hash:
	mv t0, a0	# load sequence start adress
	mv t1, a1	# load sequence end adress
	li t6, 0	# reset result register value
	
	li t2, 1	# set 'p'
	li t3, P	# set 'P' (constant)
	
loop:
	bgt t0, t1, end		# branch end if it's end of the sequence
	lb t4, (t0)		# load next bytes
	
	mul t5, t4, t2		# multiply byte value by 'p'
	add t6, t6, t5		# add value to result regiter
	
	mul t2, t2, t3		# multiply 'p' by 'P'
	addi t0, t0, 1		# go to next byte
	b loop
	
end:
	li t0, M	# set 'M'
	rem t6, t6, t0	# calculate result modulo 'M'
	
	mv a0, t6	# save temporary result to returning register
	ret
