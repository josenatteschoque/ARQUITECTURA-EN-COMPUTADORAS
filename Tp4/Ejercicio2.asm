#Escribir un programa que lea un número entero desde el teclado y calcule su tabla de
#multiplicar del 1 al 10, mostrando cada resultado.
	
	.data
mensaje:	.asciz "Ingrese un numero:\n"
tabla:	.asciz "Su tabla de multiplicar es:\n"

	.text
main:	
	li a7, 5
	ecall
	mv t0, a0
	
loop:	
	mul  
	#Falta!!
	
	
	#Finaliza el programa 
	li a7, 10
	ecall
	