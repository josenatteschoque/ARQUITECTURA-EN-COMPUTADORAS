#Escribir un programa que lea dos números enteros desde el teclado, los sume y
#muestre el resultado por pantalla.
.data
mensaje1:	.asciz"ingrese un numero:\n"
mensaje2:	.asciz"ingrese otro numero:\n"
resultado:	.asciz"la suma es:\n"

.text
.globl main

main:

	#muestra el primer mensaje
	li a7, 4 
	la a0, mensaje1
	ecall
	
	#lee el primer numero
	li a7, 5
	ecall
	mv t0, a0
	
	#muestra el segundo mensaje
	li a7, 4
	la a0, mensaje2
	ecall
	
	#lee el segundo numero
	li a7, 5
	ecall
	mv t1, a0
	
	#suma los numeros
	add t2, t0, t1 #t2 = t0 + t1
	
	#muestra el resultado
	li a7, 4
	la a0, resultado
	ecall
	
	#imprimir el resultado
	li a7, 1
	mv a0, t2
	ecall
	
	#finaliza el programa
	li a7, 10
	ecall 
	