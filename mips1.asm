.text
         .globl __start
    __start:
         la $a0,str1 
         li $v0,4
         syscall

         li $v0,8 
         la $a0, buffer 
         li $a1, 20 
         move $t0,$a0 
         syscall

         la $a0,str2 
         li $v0,4
         syscall

         la $a0, buffer 
         move $a0,$t0 
         li $v0,4 
         syscall

         li $v0,10
         syscall


               .data
             buffer: .space 20
             str1:  .asciiz "Nhap chuoi: "
             str2:  .asciiz "Chuoi vua nhap:\n"
