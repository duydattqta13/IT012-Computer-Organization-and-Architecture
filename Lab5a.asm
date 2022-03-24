.data
	chuoi1: .asciiz "Nhap so luong phan tu cua mang: "
	chuoi2: .asciiz "\nNhap phan tu:\n "
	chuoi3: .asciiz "\nMax="
	chuoi4: .asciiz "\nMin="
	chuoi5: .asciiz "\nTong="
	chuoi6: .asciiz "\nNhap chi so: "
	mang: .word 0:100
.text
	# Nhap so luong phan tu
	li $v0,4
	la $a0,chuoi1
	syscall
	li $v0,5
	syscall
	move $t0,$v0 # t0 = n
	# Nhap phan tu
	li $v0,4
	la $a0,chuoi2
	syscall
	
	li $t1,0
	la $t2,mang	
  phantu_loop:
	li $v0,5
	syscall
	
	sw $v0,0($t2)
	addi $t1,$t1,1
	addi $t2,$t2,4
	blt $t1,$t0,phantu_loop			
#---------------------------------
	# tim Max
  max:		
	li $v0,4
	la $a0,chuoi3
	syscall
  
  	li $t1,1
	la $t2,mang
	lw $t3,0($t2) # cho Max la t3
  max_loop:
  	lw $t4,4($t2)
  	bgt $t4,$t3,max_change
  	addi $t1,$t1,1
  	addi $t2,$t2,4
  	blt $t1,$t0,max_loop
  	j max_out
  max_change:
  	move $t3,$t4
  	addi $t1,$t1,1
  	addi $t2,$t2,4
  	blt $t1,$t0,max_loop	
  max_out:
  	li $v0,1
  	move $a0,$t3		
  	syscall
#---------------------------------
	# tim Min
  min:		
	li $v0,4
	la $a0,chuoi4
	syscall
  
  	li $t1,1
	la $t2,mang
	lw $t3,0($t2) # cho Min la t3
  min_loop:
  	lw $t4,4($t2)
  	blt $t4,$t3,min_change
  	addi $t1,$t1,1
  	addi $t2,$t2,4
  	blt $t1,$t0,min_loop
  	j min_out
  min_change:
  	move $t3,$t4
  	addi $t1,$t1,1
  	addi $t2,$t2,4
  	blt $t1,$t0,min_loop	
  min_out:
  	li $v0,1
  	move $a0,$t3		
  	syscall
#---------------------------------
	# tinh tong		
	li $v0,4
	la $a0,chuoi5
	syscall
	
	li $t1,0
	la $t2,mang
	li $s0,0 #Tong = 0
  tong:
  	lw $t3,0($t2)
  	add $s0,$s0,$t3
  	addi $t1,$t1,1
  	addi $t2,$t2,4	
  	blt $t1,$t0,tong
  tong_out:
  	li $v0,1
  	move $a0,$s0
  	syscall		
#---------------------------------
	# nhap vao chi so va in ra gia tri		
	li $v0,4
	la $a0,chuoi6
	syscall
	
	li $v0,5 #Nhap chi so
	syscall
	move $s1,$v0
	
	li $t1,0
	la $t2,mang
  timchiso:	
	lw $t3,0($t2)
	addi $t1,$t1,1
	addi $t2,$t2,4
	blt $t1,$s1,timchiso
  ingiatri:
  	li $v0,1
  	move $a0,$t3
  	syscall	
	
  					
	
	
	
	

	
