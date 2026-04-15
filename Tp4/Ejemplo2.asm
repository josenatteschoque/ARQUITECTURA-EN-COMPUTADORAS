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

#Programa para sumar una constante a cada elemento de 
.data 
V:	.word 7,9,2,5,1
N:	.word 5
R:	.space 20	#N * tamaño de word

.text
main:
	la s0, V
	la t0, N
	la s1, R
	
	lw s2, 0(t0)	#s2 <-- N
	
for:	beqz s2, fin_for
	apilar s0
	apilar s1
	apilar s2
	
	lw a0, 0(s0)
	jal ra, procesar
	mv s3, a6
	sw s3, 0(s1)
	
	desapilar s2
	desapilar s1
	desaílar s0
	
	addi s0,s0, 4
	addi s1, s1, 1
	addi s2, s2, -1
	j for
	
fin_for:
	fin

	#Falta