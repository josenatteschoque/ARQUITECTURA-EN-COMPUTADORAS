#Escribir un programa que sume dos números de 32 bits almacenados en memoria:
#a. Resolviendo todo en el programa principal, sin subrutinas.
#b. Llamando a una subrutina SUM32, que reciba los parámetros por valor a través
#de la pila y devuelva el resultado también por referencia usando la pila.

	.data
valor1:	.word 3
valor2:	.word 5
res:	.word 0
mensaje:	.asciz "EL resultado es:"
	.text
main:
	la t1, valor1
	lw s1, 0(t1)
	la t2, valor2
	lw s2, 0(t2)
	
	add a1, s1, s2
	
	la t3, res
	sw a1, 0(t3)	#Guardo el resultado en t3
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#Muestro el resultado
	li a7, 1
	lw t3, 0(t3)	#Cargo el valor de t3
	mv a0, t3
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall