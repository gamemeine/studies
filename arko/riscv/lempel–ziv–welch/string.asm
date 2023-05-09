	.globl print
	.globl clear
	.globl append

	.text
print:
	mv t0, a0	# get output buffer
	mv t1, a1	# get begin
	
print_loop:
	lb t3, (t1)	# get next value
	beqz t3, print_end	# end if its end of string
	
	sb t3, (t0)	# store to output
	addi t0, t0, 1	# increment pointer
	addi t1, t1, 1	# increment iterator
	
	b print_loop
	
print_end:
	mv a0, t0	# return end buffer adress
	ret
	
	
clear:
	mv t0, a0	# get begin
	mv t1, a1	# get length
	
clean_loop:
	beqz t1, clean_end	# end if its end of string
	
	li t4, 0
	sb t4, (t0)	# clear value
	addi t0, t0, 1	# increment pointer
	addi t1, t1, -1 # decrement iterator

	b clean_loop
clean_end:
	mv a0, t0	# return end adress
	ret
	
append:
	mv t0, a0	# get begin
	mv t1, a1	# get value
	
append_loop:
	lb t3, (t0)	# get next value
	beqz t3,append_end	# end if its end of string
	
	addi t0, t0, 1	# increment pointer
	
	b append_loop
	
append_end:
	sb t1, (t0)	# add value
	addi t0, t0, 1	# increment pointer
	
	mv a0, t0	# return end adress
	ret
	
	
