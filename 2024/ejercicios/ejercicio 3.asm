#3. Comparar dos números
#Objetivo: Comparar dos números y guardar 1 si A > B, 0 si no.
.data
#declaro variables hardcodeadas
A:	.word 19
B:	.word 9
MAYOR:	.word 0

.text 
.global main
main:
	#cargo las direciones de las variables
	la s0, A
	la s1, B
	la s2, MAYOR
	
	#cargo sus valores
	lw t1, 0(s0)
	lw t2, 0(s1)
	lw t3, 0(s2)
	
	#si t1 > t2 salta a mayor
	bgt t1, t2, mayor

	j fin
mayor:
	li t5, 1 #carga 1 si se cumplio la condiccion
	
fin:
	#finaliza el programa
	li a7, 10
	ecall
