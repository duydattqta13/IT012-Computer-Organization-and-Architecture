.data
	chuoi1: .asciiz "Nhap chuoi: "
	chuoi2: .space 30
	chuoi3: .asciiz "\nChuoi dao nguoc la: "
.text
	li $v0,4
	la $a0,chuoi1
	syscall
	
	li $v0,8
	la $a0,chuoi2
	li $a1,30
	syscall

	la $t2,chuoi2
  lap1:
  	lb $t1,0($t2)
  	beq $t1,$0,lap2
  	addi $t2,$t2,1
  	j lap1
  lap2:
  	li $v0,4
  	la $a0,chuoi3
  	syscall
  lap3:
  	subi $t2,$t2,1
  	lb $t1,0($t2)
  	beq $t1,$0,END
  	
  	li $v0,11
  	move $a0,$t1
  	syscall
  	j lap3
  END:			
  			
  		
  	
  	
  		
	
	
