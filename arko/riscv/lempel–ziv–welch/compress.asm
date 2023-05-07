	.data
prompt: .asciz "Provide filename: "
temp_path:	.asciz "example.txt"
path:	.space 100
buf:	.space 1024
	
	.text
main:
	# Print prompt
	la a0, prompt
	li a7, 4
	ecall
	
	# Get path
	la a0, path
	li a1, 100
	li a7, 8
	ecall
	
						# TODO: remove \n on the end of 'path', temporarly use already provided name instead of reading it
	 
	# Open file
	la a0, temp_path 	# path 			# TODO: replace with 'path' after fixing trailing \n
	li a1, 0    	# read-only	
	li a7, 1024 	# open
	ecall
	
	# Read file content
	la a1, buf
	li a2, 1024
	li a7, 63	# Read content within file descriptior in a0
	ecall
	
	
	
	