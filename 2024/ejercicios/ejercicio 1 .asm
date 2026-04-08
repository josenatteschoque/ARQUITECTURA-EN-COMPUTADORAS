#1. Suma de dos números
#Objetivo: Sumar dos números almacenados en registros y guardar el resultado en memoria.
.data
#declaro variables harcodeadas
A:	.word 5
B:	.word 4
RESUL:	.word 0

.text
.global main
main:	
	la s0, A	#cargo la direccion de A
	lw t1, 0(s0)	#t1 = s0
	la s1, B	#cargo la direccion de B
	lw t2, 0(s1)	#t2 = s1
	la s2, RESUL	#cargo la direccion de RESUL
	lw t3, 0(s2)	#t3 = s2
	add t3, t1, t2	#t3 = t1 + t2
	
	#finaliza el programa
	li a7, 10
	ecall
	