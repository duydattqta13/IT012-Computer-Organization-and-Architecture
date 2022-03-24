.data
	input: .space 20
	newline: .asciiz "\n"
.text
main:
   	li $v0, 8
    	la $a0, input
    	li $a1, 20
    	syscall

    	li $v0, 4
    	li $t0, 1
loop:
    	lb $t1, input($t0) 
    	beq $t1, 0, exit
  	
    	blt $t1, 'a', not_lower
    	bgt $t1, 'z', not_lower	
	
    	sub $t1, $t1, 32
    	sb $t1, input($t0)
not_lower:
    	addi $t0, $t0, 2
    	j loop
exit:
    	li $v0, 4
    	la $a0, input
    	syscall

    	li $v0, 10
    	syscall
