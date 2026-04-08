#4. Multiplicación con sumas
#Objetivo: Multiplicar A * B usando sumas repetidas (sin instrucción mul).

.data 
A:	.word 3
B:	.word 5
RESUL:	.word 0

.text
.global main
main:
	la s0, A
	la s1, B
	
	lw t1, 0(s0) #contador
	lw t2, 0(s1)
	
	li t3, 0 #resultado
	
loop:
	beqz t1, fin #t1 == 0
	add t3, t3, t2 #t3 = t3 + t2
	addi t1, t1, -1  #contador = - 1
	j loop
	
fin:	

	#finaliza el programa
	li a7, 10
	ecall
	
	
	
	
	