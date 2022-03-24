.data
.text
	li, $s2, 0
	li, $s0, 1
	addi $v0,$zero,5
	syscall
	move $s1,$v0
	
	lap:
		bgt $s0,$s1,thoat_lap
		
		add $s2,$s2,$s0
		addi $s0,$s0,1
		
		j lap
		
	thoat_lap:	
		
		
