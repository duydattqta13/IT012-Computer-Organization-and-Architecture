.data
.text
	li, $v0, 12
	syscall
	move $a0, $v0
	
	addi $a0, $a0, -32
	li $v0, 11
	syscall
