#politica: cima vacia y crecimiento hacia abajo
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
	#Cargo los valores
	li t0, 1
	li t1, 5
	li t2, 7
	
	apilar t0
	apilar t1
	apilar t2
	
	desapilar t3
	desapilar t4
	desapilar t5
	
	fin
	