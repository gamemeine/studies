	.eqv MAX_FILE_SIZE, 1024
	.eqv TABLE_SIZE, 8206
	.eqv ALPHABET, 256
	
	.data
in:	.space MAX_FILE_SIZE
out:	.space MAX_FILE_SIZE
table:	.space TABLE_SIZE
file:	.asciz "output"

	.text
main:
	la a0, in	# load input file buffer
	jal read	# read file into buffer
	
	mv s10, a0	# save file size
	
begin:
	la a0, table		# load table adress
	li a1, ALPHABET		# load algphabet size
	jal fill		# fill table
	
	
	la s0, in	# load w
	la s1, in	# load c
	
	mv s8, s10	# store size
	
	la s4, out	# load output file buffer adress
	li s9, 0	# output size counter
	
	
	li s5, ALPHABET		# initialize first code
	
loop:
	bltz s10, check		# check for end of file
	addi s10, s10, -1	# decreement iterator 
	
	mv a0, s0
	mv a1, s1
	jal hash	# calculate hash for wc
	
	slli a0, a0, 1 	# multiply hash by 2
	
	la t0, table
	add t0, t0, a0	# get adress of table[hash(wc)]
	lh t1, (t0)	# get value of ..
	
	beqz t1, doesnt		# element not in table
	
	# element in table..
does:
	addi s1, s1, 1	# w = w + c
	b loop
	
doesnt:
	mv t0, s1	# get c
	addi t0, t0, -1	# decrement c (get w)
	
	mv a0, s0
	mv a1, t0
	jal hash	# get hash for w
	
	slli a0, a0, 1 	# multiply hash by 2
	
	la t0, table
	add t0, t0, a0	# get adress of table[hash(w)]
	lh t1, (t0)	# get value of ..
	
	sh t1, (s4)	# push to result table[hash(w)]
	addi s4, s4, 2	# increment result adress
	addi s9, s9, 1	# increment result counter
	
	mv a0, s0
	mv a1, s1
	jal hash	# calculate hash for wc
	
	slli a0, a0, 1 	# multiply hash by 2
	
	la t0, table
	add t0, t0, a0	# get adress of table[hash(wc)]
	sh s5, (t0)	# store next code value in ...
	
	addi s5, s5, 1	# increment code
	
	mv s0, s1	# w = c

	b loop
	
check:
	ebreak
	lb t0, (s0)	# get w value
	beqz t0, end
	
	la s1, in
	add s1, s1, s8

	mv a0, s0
	mv a1, s1
	jal hash	# calculate hash for w
	
	slli a0, a0, 1 	# multiply hash by 2
	
	la t0, table
	add t0, t0, a0	# get adress of table[hash(wc)]
	lh t1, (t0)	# get value from ...
	
	sh t1, (s4)	# store to result
	addi s9, s9, 1	# increment result counter
	
end:
	# Open file
	la a0, file 		# path
	li a1, 1    		# write-only	
	li a7, 1024 		# open
	ecall
	
	slli s9, s9, 1	# multiply counter by 2
	
	la a1, out
	mv a2, s9
	li a7, 64
	ecall
	
	li a7, 57
	ecall

	# End program
	li a7, 10
	ecall
