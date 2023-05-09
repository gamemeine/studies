	.globl fill
	
	.eqv START_VALUE, 0
	
	.text
fill:
	mv t0, a0	# get buffer adress
	mv t1, a1	# get length to fill
	mv t3, a2	# get step
	
	li t2, START_VALUE	# setup iterator

loop:
	beqz t1, end	# check for boundary
	
	sh t2, (t0)	# fill next adress
	
	add t0, t0, t3 	# increment adress by step
	addi t1, t1, -1 # decrement length to fill
	addi t2, t2, 1	# increment iterator

	
	b loop
end:
	ret