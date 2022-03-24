.data
	chuoi1: .asciiz "So lon hon la: "
	chuoi2: .asciiz "\nTong 2 so la: "
	chuoi3: .asciiz "\nHieu 2 so la: "
	chuoi4: .asciiz "\nTich 2 so la: "
	chuoi5: .asciiz "\nThuong 2 so la: "
	chuoi6: .asciiz "  du:"
.text
	li $v0,5
	syscall
	move $s0,$v0
	
	li $v0,5
	syscall
	move $s1,$v0
	# In ra so lon hon
	li $v0,4
	la $a0,chuoi1
	syscall
	
	bgt $s0,$s1,othercase
	li $v0,1
	add $a0,$s1,$zero
	syscall
	j end1
	
	othercase:
	li $v0,1
	add $a0,$s0,$zero
	syscall
	
	end1:
	#----------------------------
	# Tong 2 so 
	li $v0,4
	la $a0,chuoi2
	syscall
	
	li $v0,1
	add $a0,$s0,$s1
	syscall
	#----------------------------
	# Hieu 2 so
	li $v0,4
	la $a0,chuoi3
	syscall
	
	li $v0,1
	sub $a0,$s0,$s1
	syscall
	#----------------------------
	# Tich 2 so
	li $v0,4
	la $a0,chuoi4
	syscall
	
	li $v0,1
	mul $a0,$s0,$s1
	syscall
	#----------------------------
	# Thuong 2 so
	li $v0,4
	la $a0,chuoi5
	syscall
	
	li $v0,1
	div $a0,$s0,$s1
	syscall
	move $s2,$a0
	
	li $v0,4
	la $a0,chuoi6
	syscall
	
	li $v0,1
	mul $s3,$s2,$s1
	sub $a0,$s0,$s3
	syscall
	
	
	
	
	
	
	

	