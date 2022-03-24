.data
.text
         li, $v0, 5 
         syscall
         move ,$t0, $v0  

   	 li ,$v0,5        
   	 syscall
   	 move $t1,$v0

   	 add ,$a0, $t1, $t0 
   	 li ,$v0, 1
   	 syscall
