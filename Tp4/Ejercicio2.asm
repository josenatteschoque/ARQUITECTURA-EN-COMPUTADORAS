#Escribir un programa que lea un número entero desde el teclado y calcule su tabla de
#multiplicar del 1 al 10, mostrando cada resultado.
	
	.data
mensaje:	.asciz "Ingrese un numero:"
salto:	.asciz "\n"
multi:	.asciz "X"
igual:	.asciz "="
	.text
main:	
	#Muestra el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#Lee el dato
	li a7, 5
	ecall
	mv t0, a0
	
	li t1, 1	#Inicio el contador

loop:	
	#Muestro el multiplicando
	mv a0, t0
	li a7,1
	ecall
	
	#Muestro la X
	li a7, 4
	la a0, multi
	ecall

	#Muestro el multiplicador
	li a7, 1
	mv a0, t1
	ecall
	
	#Muestro el igual
	li a7, 4
	la a0, igual
	ecall
	
	#Realizo la operacio
	mul t2, t0, t1	#t0=s1*t1
	
	#muestro la operacio
	mv a0, t2
	li a7, 1
	ecall
	
	#Muestra el salto de linea
	li a7, 4
	la a0, salto
	ecall
	
	addi t1, t1, 1	#Contador++
	li t5, 11	#t5 = 11
	blt t1, t5, loop	#Repetir hasta t1 < 11
	
	
	#Finaliza el programa 
	li a7, 10
	ecall
	
