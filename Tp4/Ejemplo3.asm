.macro apilar (%valor)
	sw %valor, 0(sp)
	addi sp, sp, 4
.end_macro

.macro desapilar (%valor)
	addi sp, sp,-4
	lw a6,  0(sp)
.end_macro

.macro fin
	li a7,10
	ecall
.end_macro

.text
main:
	li a0 ,4
	jal s0, factorial
	mv s0, a6
	
	fin	
	
######
factorial:
	#li t0, 1
	#beq a0, t0 , caso_base
	beqz a0, caso:base
	
	apilar s0
	apilar ra
	
	addi a0, a0, -1
	jal factorial
	desapilar ra
	desapilar a0
	mul a6, a6, a0
	j salir
		#####Mirar la clase 14/04!!! 11:47
caso_base:
	li a6,1
	
salir:	ret


