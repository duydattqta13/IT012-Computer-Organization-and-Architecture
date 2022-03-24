.data
  str: .space 100
.text
main:
#Bat dau nhap:
  	li $v0,8
  	la $a0,str
  	li $a1,100
	syscall
	
# Xuat chuoi
	li $v0,4
	syscall
	

