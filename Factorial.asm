# Kenneth Baldridge
# Program that uses at least one procedure call 
# to calculate the factorial of N, where N is an input parameter.

.data
input:   .asciiz "Your Number: "
nl:      .asciiz "\n"
outcome: .asciiz "The factorial is "

.text
main:
	li $v0, 5		# Set to read in an integer
	syscall			# read input
	add $t0, $v0, $zero	# Setting register t0 to read integer
	add $t1, $t0, $zero     # setting register t1 to same integer
	add $t2, $t0, $zero     # Remember number
	
	jal factorial
	
	li $v0, 4            	# Set to print a string
	la $a0, input           # Load "input" into $a0
	syscall            	# Send string to Console
	
	li $v0, 1            	# Set to print an Integer
	add $a0, $t2, $zero     # Load $t2 into $a0
	syscall            	# Send Integer to Console
	
	li $v0, 4            	# Set to print a string
	la $a0, nl              # Load "nl" into $a0
	syscall            	# Send string to Console
	
	li $v0, 4            	# Set to print a string
	la $a0, outcome         # Load "outcome" into $a0
	syscall            	# Send string to Console
	
	li $v0, 1            	# Set to print an Integer
	add $a0, $t0, $zero     # Load $t0 into $a0
	syscall            	# Send Integer to Console
	
	li $v0, 10            	# Set to exit
	syscall            	# Exit

factorial:
	loop:
		blt $t1, 2, out         # is t1 less than 2 (nothing changes at 1 except more used resources.) yes-GoTo end, no-next op
		add $t1, $t1, -1        # Decrement t1 by 1
		mul $t0, $t0, $t1       # Multiply t0 and t1 and set t0 to product
		j loop			# jump to begin
	out:
		jr $ra
