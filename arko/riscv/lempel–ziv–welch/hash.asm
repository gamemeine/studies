	.globl hash
	
	.eqv P, 33	# define 'P'
	.eqv M, 4103	# define 'M'
	
	.text
hash:
	mv t0, a0	# load label adress
	li t6, 0	# reset result register value
	
	li t1, 1	# set 'p'
	li t2, P	# set 'P' (constant)
	
loop:
	lb t3, (t0)		# load next character
	beqz t3, end		# branch end if it's end of the string
	
	mul t4, t3, t1		# multiply character value by 'p'
	add t6, t6, t4		# add value to result regiter
	
	mul t1, t1, t2		# multiply 'p' by 'P'
	addi t0, t0, 1		# go to next character
	b loop
	
end:
	li t0, M	# set 'M'
	rem t6, t6, t0	# calculate result modulo 'M'
	
	mv a0, t6	# save temporary result to returning register
	ret