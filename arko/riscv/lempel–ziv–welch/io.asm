	.globl read
	
	.eqv PATH_LENGTH, 100
	.eqv MAX_FILE_SIZE, 1024
	
	.data
prompt: .asciz "Provide filename: "

path:	.space PATH_LENGTH
temp:	.asciz "example.txt"
	
	.text
read:
	# Save buffer adresss to t0
	mv t0, a0
	
	# Print prompt
	la a0, prompt
	li a7, 4
	ecall
	
	# Get path
	la a0, path
	li a1, PATH_LENGTH
	li a7, 8
	ecall
	
						# TODO: remove \n on the end of 'path', temporarly use already provided name instead of reading it
	 
	# Open file
	la a0, temp 		# path 			# TODO: replace with 'path' after fixing trailing \n
	li a1, 0    		# read-only	
	li a7, 1024 		# open
	ecall
	
	# Read file content
	mv a1, t0
	li a2, MAX_FILE_SIZE
	li a7, 63		# Read content within file descriptior in a0
	ecall
	
	# Close file
	li a7, 57		# Close file with file descriptor in a0
	ecall
	
	ret