#2. Resta y almacenamiento
#Objetivo: Restar B de A y guardar el resultado en memoria.
.data
#declaro variables hardcodeadas 	
A:	.word 5
B:	.word 3
RESUL:	.word 0

.text
.global main
main:	
	#cargo la direcciones de las varibles
	la s0, A
	la s1, B
	la s2, RESUL
	
	#guardo los valores 
	lw t1, 0(s0)
	lw t2, 0(s1)
	lw t3, 0(s2)
	
	sub t3, t1, t2 #t3 = t1 - t2
	
	#finaliza el programa
	li a7, 10
	ecall
	