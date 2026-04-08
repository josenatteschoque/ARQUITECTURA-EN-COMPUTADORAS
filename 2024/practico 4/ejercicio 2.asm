#Escribir un programa que lea un número entero desde el teclado y calcule su tabla de
#multiplicar del 1 al 10, mostrando cada resultado.

.data
mensaje:	.asciz"ingrese un numero:\n"
multi:		.asciz" X "
igual:		.asciz" = "
salto:		.asciz"\n"

.text

.globl main

main:
	#muestra el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#lee el numero
	li a7, 5
	ecall
	mv t0, a0
 	
	li t1, 1 #inicia contador
	
loop:

	#muestrar multiplicando
	mv a0, t0 
	li a7, 1
	ecall
	
	#muestra la X
	li a7, 4
	la a0, multi
	ecall
	
	#muestra el multiplicador
	mv a0, t1
	li a7, 1
	ecall
	
	
	#muestra el igual
	li a7, 4
	la a0, igual
	ecall
	
	#realiza la multiplicacion
	mul t2, t0, t1 #t2 = t0 * t1
	mv a0, t2
	li a7, 1
	ecall
	
	#salto de linea
	li a7, 4
	la a0, salto
	ecall
	
	#inclementa el contador
	addi t1, t1, 1
	li t3, 11
	blt t1, t3, loop #repetir hasta que t1 < 11
	
	#finaliza el programa
	li a7, 10
	ecall