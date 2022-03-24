.data
	str1: .asciiz "Nhap ky tu: "
	str2: .asciiz "Ki tu truoc: "
	str3: .asciiz "\nKi tu sau: "
	str4: .asciiz "\nDay la chu so\n"
	str5: .asciiz "\nDay la chu hoa\n"
	str6: .asciiz "\nDay la chu thuong\n"
	str7: .asciiz "\nInvalid"
	str: .byte
.text
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 12
	syscall
	move $s0, $v0 #luu vao $s0

checkIfValid:
	li $t7, 48 # ascii cua '0'
	slt $t0, $s0, $t7
	bne $t0, $zero, printInvalid #if s0<'0'
	li $t7, 58 # ascii cua '9'+1
	slt $t0, $s0, $t7
	bne $t0, $zero, printChuso #if s0<='9'
	
	li $t7, 65 # ascii cua 'A'
	slt $t0, $s0, $t7
	bne $t0, $zero, printInvalid #if s0<'A'
	li $t7, 91 # ascii cua 'Z'+1
	slt $t0, $s0, $t7
	bne $t0, $zero, printChuhoa #if s0<='Z'
	
	li $t7, 97 # ascii cua 'a'
	slt $t0, $s0, $t7
	bne $t0, $zero, printInvalid #if s0<'a'
	li $t7, 123 # ascii cua 'z'+1
	slt $t0, $s0, $t7
	bne $t0, $zero, printChuthuong #if s0<='z'
	j printInvalid
printChuso:
	li $v0, 4
	la $a0, str4
	syscall
	j printValid
	
printChuhoa:
	li $v0, 4
	la $a0, str5
	syscall
	j printValid
	
printChuthuong:
	li $v0, 4
	la $a0, str6
	syscall
	j printValid
	
printValid:
	li $v0, 4
	la $a0, str2 #ki tu truoc
	syscall
	li $v0, 11
	subi $a0, $s0, 1
	syscall
	li $v0, 4
	la $a0, str3 #ki tu sau
	syscall
	li $v0, 11
	addi $a0, $s0, 1
	syscall
	j endProgram
	
printInvalid:
	li $v0, 4
	la $a0, str7
	syscall
	
endProgram:
	