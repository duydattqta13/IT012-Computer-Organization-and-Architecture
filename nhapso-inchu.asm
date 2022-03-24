.data
	chuoi1: .asciiz "Nhap vao so nguyen duong: "
	zero: .asciiz "zero "
	one: .asciiz "one "
	two: .asciiz "two "
	three: .asciiz "three "
	four: .asciiz "four "
	five: .asciiz "five "
	six: .asciiz "six "
	seven: .asciiz "seven "
	eight: .asciiz "eight "
	nine: .asciiz "nine "
	arr: .word 0:100
.text
	la $a1,arr 
	li $t2,0 # khoi tao chi so mang
	
	li $v0, 4
	la $a0, chuoi1
	syscall 
	
	li $v0,5
	syscall
	move $t0,$v0
	
  insert_arr:
  	beq $t0,$zero,print_num
  	div $t0,$t0,10
  	mfhi $t1
  	sw $t1,0($a1)
  	addi $t2,$t2,1
  	addi $a1,$a1,4
  	j insert_arr	
  print_num:	
  	beq $t2,$zero,END
  	subi $a1,$a1,4
  	subi $t2,$t2,1
  	lw $a0,0($a1)
  print_0:
  	bne $a0,0,print_1
  	li $v0,4
  	la $a0,zero
  	syscall
  	j print_num
  print_1:
  	bne $a0,1,print_2
  	li $v0,4
  	la $a0,one
  	syscall
  	j print_num	
  print_2:
  	bne $a0,2,print_3
  	li $v0,4
  	la $a0,two
  	syscall
  	j print_num
  print_3:
  	bne $a0,3,print_4
  	li $v0,4
  	la $a0,three
  	syscall
  	j print_num 
  print_4:
  	bne $a0,4,print_5
  	li $v0,4
  	la $a0,four
  	syscall
  	j print_num 				
  print_5:
  	bne $a0,5,print_6
  	li $v0,4
  	la $a0,five
  	syscall
  	j print_num 		
  print_6:
  	bne $a0,6,print_7
  	li $v0,4
  	la $a0,six
  	syscall
  	j print_num
  print_7:
  	bne $a0,7,print_8
  	li $v0,4
  	la $a0,seven
  	syscall
  	j print_num 		
  print_8:
  	bne $a0,8,print_9
  	li $v0,4
  	la $a0,eight
  	syscall
  	j print_num
  print_9:
  	bne $a0,9,END
  	li $v0,4
  	la $a0,nine
  	syscall
  	j print_num
END:  	