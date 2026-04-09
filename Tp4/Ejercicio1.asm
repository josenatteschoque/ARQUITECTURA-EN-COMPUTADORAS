#Escribir un programa que lea dos números enteros desde el teclado, los sume y
#muestre el resultado por pantalla.

	.data
	
mensaje:	.asciz "Ingrese 2 numeros:\n"
mensajeResultado:	.asciz "El resultado es:"

	.text
main:
	#Solicita el ingreso de datos
	li a7, 4
	la a0, mensaje
	ecall
	
	#Ingresa los datos

	#Ingresa el pirmer numero
	li a7, 5	#5 lee un entero por teclado
	ecall
	mv t0, a0	#Muevo el valor ingresado al registro t0
	
	#Ingresa el segundo numero	
	li a7, 5	#5 lee un entero por teclado
	ecall
	mv t1, a0	#Muevo el valor ingresado al registro t1
		
	#Muestro el mensaje del resultado
	li a7, 4
	la a0, mensajeResultado
	ecall
	
	#Realiza la suma
	add t2, t0, t1
	
	#Muestro el resultado
	li a7, 1	#1 Imprime un entero por consola
	mv a0, t2
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall