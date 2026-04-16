#Escribir un programa que multiplique dos números NUM1 y NUM2 y almacene el
#resultado en RES:
#a. Desde el programa principal, sin subrutinas.

	.data
RES:	.space 4
NUM1:	.word 4
NUM2:	.word 5
mensaje:	.asciz "La multiplicacion es:"

	.text
main:
	#Cargo las direcciones y valores
	la t0, NUM1
	lw a1, 0(t0)
	
	la t1, NUM2
	lw a2,0(t1) 
	
	la t2, RES
	lw a3, 0(t2)
	
	#Realizo la opereacion
	mul a3, a1, a2
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje 
	ecall
	
	#Muestro el resultado
	li a7, 1
	mv a0, a3
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall