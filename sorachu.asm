.data
	Chuoi1: .asciiz "Nhap vao so nguyen duong: "
	Chuoi2: .asciiz "Invalid Entry\n"
	names:
		.align 2
			.asciiz "Zero "
		.align 2
			.asciiz "One "
		.align 2
			.asciiz "Two "
		.align 2
			.asciiz "Three "
		.align 2
			.asciiz "Four "
		.align 2
			.asciiz "Five "
		.align 2
			.asciiz "Six "
		.align 2
			.asciiz "Seven "
		.align 2
			.asciiz "Eight "
		.align 2
			.asciiz "Nine "
		.align 2
	str: .asciiz
.text
	li $v0, 4
	
	la $a0, Chuoi1
	syscall #Xuat ra chuoi dau tien
	
	li $v0, 8
	la $a0, str
	li $a1, 100
	syscall

	la $s0, names

	la $t1, str
	la $s2, str
#Kiem tra tung ki tu nhap vo co thuoc tu 0 toi 9 hay khong neu khong thi xuat ra invalid
	check:
	lb $t5, 0($s2)
	beq $t5, 10, print #gia tri tai $t5 = 10 (enter) ?
	blt $t5, 48, Invalid #gia tri tai $t5 < 48 ?
	bgt $t5, 57, Invalid #gia tri tai $t5 > 57 ?
	addi $s2, $s2, 1
	j check
#In tung chu ung voi so do
	print:
	lb $t2, 0($t1) #$t2 = gia tri cua $t1
	beq $t2, 10, end #$t2 = enter thoat
	subi $t4, $t2, 48 #Chuyen ki tu thanh so
	mul $t3, $t4, 8 #$t3 = sodo*8
	la $t0, names #$t0 = dia chi cua mang names

	add $t0, $t3, $t0 #$t0 = $t0 + so*8 = names[sodo*8] = dia chi cua ki chuoi can in
	

	li $v0, 4 #In ra string
	la $a0, 0($t0) #$a0 = dia chi cua chuoi can in
	syscall #Thuc hien lenh xuat ra man hinh
	add $t1, $t1, 1 #tang $t1 len 1 byte khi do 0($t1) se tro toi ki tu ke tiep
	j print #Quay lai buoc lap

	Invalid:
	li $v0, 4
	la $a0, Chuoi2
	syscall

	end:
	li $v0, 10
	syscall