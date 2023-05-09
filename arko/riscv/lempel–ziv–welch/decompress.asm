	.eqv MAX_FILE_SIZE, 2048
	.eqv CODES_SIZE, 8210
	.eqv MAX_SUBSTRING_LENGTH, 64
	.eqv ALPHABET, 256
	
	.data
in:	.space MAX_FILE_SIZE
out:	.space MAX_FILE_SIZE

w:	.space MAX_SUBSTRING_LENGTH

	.text
main:
	la a0, in	# load input file buffer
	jal read	# read file into buffer
	
	mv s10, a0	# save file size
	
alloc:
	li t0, CODES_SIZE
	li t1, MAX_SUBSTRING_LENGTH
	
	mul a0, t0, t1	# table size
	li a7, 9	
	ecall		# allocate
	
	mv s7, a0	# store table adress
	
begin:
	
	mv a0, s7		# load table adress
	li a1, ALPHABET		# load algphabet size
	li a2, MAX_SUBSTRING_LENGTH	# load step
	slli a2, a2, 1		# multiply step by two to handle 2-byte words
	jal fill		# fill table
	
	la t0, w	# get w
	la t1, in	# get in[0] adress
	
	lb t2, (t1)	# get value of
	sb t2, (t0)	# push to w
	 
	
	la s1, in	# k
	
	li s5, ALPHABET		# initialize first code
	
	la s4, out	# load output file buffer adress
	
	mv a0, s4	# load output buffer
	la a1, w	# load w
	jal print	# print to output
		
	mv s4, a0	# get next output adress
	
	addi s1, s1, 2	# increment k
	
loop:
	lh t0, (s1)	# get in[k]
	beqz t0, end	# check for end of in
	
	
	li t3, MAX_SUBSTRING_LENGTH
	
	mul t1, t0, t3	# get in[k] * max_substring_length
	slli t1, t1, 1	# multiply by 2 (word size)
	
	add t0, s7, t1	# get table[k] adress
	lb t1, (t0)	# get value
	
	beqz t1, doesnt	# if there wasn't this key before
	
	# if there was
do:
	mv a0, s4	# load output buffer adress
	mv a1, t0	# load string begin from above
	jal print
	
	mv s4, a0	# increment output buffer adress
	
	lh t0, (s1)	# get in[k]
	
	li t3, MAX_SUBSTRING_LENGTH
	
	mul t1, t0, t3	# get in[k] * max_substring_length
	slli t1, t1, 1	# multiply by 2 (word size)
	
	add t0, s7, t1	# get table[k] adress
	lb t1, (t0)	# get value
	
	la a0, w	# get w
	mv a1, t1	# get table[k]
	jal append
	
	
	
	
	li t3, MAX_SUBSTRING_LENGTH
	mul t1, s5, t3	# get dict_size * max_substring_length
	slli t1, t1, 1	# multiply by 2 (word size)
	
	add t0, s7, t1	# get table[dict_size] adress
	
	mv a0, t0	# load table[dict_size] adress
	la a1, w	# load w + table[k] adress
	jal print
	
	
	
	
	addi s5, s5, 1	# dict_size ++
	
	
	
		
	lh t0, (s1)	# get in[k]
	
	li t3, MAX_SUBSTRING_LENGTH
	
	mul t1, t0, t3	# get in[k] * max_substring_length
	slli t1, t1, 1	# multiply by 2 (word size)
	
	add t0, s7, t1	# get table[k] adress
	
	
	la a0, w	# load w adress
	mv a1, t0	# load table[k] adress
	jal print
	
	addi s1, s1, 2	# increment iterator
	
	b loop

doesnt:
	
	
	
	
	
	ebreak

	
	
	
	
end:
	la t0, out	# get output adress
	sub t1, s4, t0	# get file size
	
	la a0, out	# load output adress
	mv a1, t1	# load output size
	jal write

	li a7, 10
	ecall		# end program
	
	
	