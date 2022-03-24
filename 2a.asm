.data
.text
	bne $s0,$s1,Else # if (i=j)
	add $s2,$t0,$t1 # f=g+h
	j exit
	
Else: sub $s2,$t0,$t1  # f=g-h
exit:	