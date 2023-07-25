.data

numbers: .word 78, 456, 1, 89, 13, 56, 267, 102, 3, 51	
.text
main:
	la $s2, numbers					

	li $s0, 0					
	li $s6, 9 					
	
	li $s1, 0 					

	li $t2, 0					
	li $t4, 10

	

innerloop:
	sll $t6, $s1, 2				#//1	//rd rs address t6 =0
	add $t6, $s2, $t6 			#//2	// rd rs rt t6 = 0

	lw $t0, 0($t6)  		#	//3 //15 16 16 78 78 78 t0 = 78
	lw $t1, 4($t6) 			#	//15 17 17 78 456 456 t1 = 456

	ble $t0, $t1, next  # 5

	sw $t1, 0($t6) 					# 6
	sw $t0, 4($t6)           # 7

next:	

	addi $s1, $s1, 1				# 8
	sub $s5, $s6, $s0 				# 9

	bne  $s1, $s5, innerloop				# 10
	addi $s0, $s0, 1 				# 11
	li $s1, 0 					# 12

	bne  $s0, $s6, innerloop				# 13
	
printarr:
	beq $t2, $t4, final				
	
	lw $t5, 0($s2)					
	li $v0, 1					
	move $a0, $t5
	syscall

	li $a0, 32					
	li $v0, 11
	syscall
	
	addi $s2, $s2, 4				
	addi $t2, $t2, 1				

	j printarr

final:	
	li $v0, 10					
	syscall