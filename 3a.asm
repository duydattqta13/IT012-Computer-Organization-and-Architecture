.data
	chuoi1: .asciiz "\nNhap Ky tu (chi 1 ky tu):"
	chuoi2: .asciiz "\nKy tu truoc:"
	chuoi3: .asciiz "\nKy tu sau:"
	so: .asciiz "\nSo"
	chuthuong: .asciiz "\nchu thuong"
	chuhoa: .asciiz "\nchu hoa"
	inval: .asciiz "\ninvalid type"	
.text
	# Nhap chuoi
	li $v0,4
	la $a0, chuoi1
	syscall
	
	li $v0,12
	syscall
	move $s0,$v0
	
	# Xuat ky tu truoc/
	addi $t1,$s0,-1
	li $v0,4
	la $a0, chuoi2
	syscall
	
	li $v0,11
	add $a0,$t1,$zero
	syscall
	
	# Xuat ky tu sau
	addi $t1,$s0,1
	li $v0,4
	la $a0, chuoi3
	syscall
	
	li $v0,11
	add $a0,$t1,$zero
	syscall
	# ---------------------------
	# Kiem Tra so
	li $t4,'0'
	li $t5,'9'
	blt $s0,$t4,koSo
	bgt $s0,$t5,koSo
	li $v0,4
	la $a0,so
	syscall
	j EXIT
	koSo:
	# ---------------------------
	# Kiem Tra chu thuong
	li $t4,'a'
	li $t5,'z'
	blt $s0,$t4,kochuthuong
	bgt $s0,$t5,kochuthuong
	li $v0,4
	la $a0,chuthuong
	syscall
	j EXIT
	kochuthuong:
	# ---------------------------
	# Kiem Tra chu hoa
	li $t4,'A'
	li $t5,'Z'
	blt $s0,$t4,kochuhoa
	bgt $s0,$t5,kochuhoa
	li $v0,4
	la $a0,chuhoa
	syscall
	j EXIT
	kochuhoa:
	#----------------------------
	# Ko hop le
	li $v0,4
	la $a0,inval
	syscall
	
	EXIT:
	li $v0,10
	syscall
	
	
	