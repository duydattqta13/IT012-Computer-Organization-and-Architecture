.data
	chuoi1: .asciiz "Chao ban! Ban la sinh vien nam thu may?\n"
	chuoi2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^-^"
.text
	li, $v0, 4
	la, $a0, chuoi1
	syscall
	
	li, $v0, 4
	la, $a0, chuoi2
	syscall
	