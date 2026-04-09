#Modificar "Hola Mundo": Modificar el programa de "Hola Mundo" para que imprima
#un mensaje personalizado.

	.data
inicio:	.asciz "Ingrese su nombre: "
saludo:	.asciz "Hola "
nombre: .space 20	#Reservo 20 bytes para el nombre

	.text
main:
	#Imprimir el inicio
	la a0, inicio
	li a7, 4	#Muestra el mensaje por consola
	ecall	#Llamada al sistema
	
	#Leer el nombre por teclado
	li a7, 8	#8 lee un string
	la a0, nombre	#Guardo el nombre
	li a1, 20	#Tamaño maximo a leer
	ecall	#Llamada al sistema
	
	#Imprimir el saludo
	li a7, 4	#Muestra el saludo
	la a0, saludo
	ecall	#Llamado al sistema
	
	#Imprime el nombre
	li a7, 4
	la a0, nombre
	ecall	#Llamado al sistema
	
	#Finaliza el programa
	li a7, 10
	ecall
