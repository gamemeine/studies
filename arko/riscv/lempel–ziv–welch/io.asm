	.globl read
	.globl write
	
	.eqv MAX_FILE_SIZE, 1024
	
	.text
read:
	mv t0, a0	# get filename
	mv t1, a1	# get buffer adresss

	mv a0, t0 		# path
	li a1, 0    		# read-only	
	li a7, 1024 		
	ecall			# open file
	
	mv a1, t1		# buffer adress
	li a2, MAX_FILE_SIZE	# max input length
	li a7, 63	
	ecall		# read from file to buffer
	
	li a7, 57
	ecall		# close file with file descriptor in a0
	
	ret
	
write:
	mv t0, a0	# get filename
	mv t1, a1 	# get output buffer adresss
	mv t2, a2	# get output length
	
	
	mv a0, t0 		# path
	li a1, 1    		# write-only	
	li a7, 1024
	ecall			# open file
	
	mv a1, t1	# buffer adress
	mv a2, t2	# output length
	li a7, 64	
	ecall		# write buffer to file
	
	li a7, 57	
	ecall		# close file with file descriptor in a0
	
	ret
	
