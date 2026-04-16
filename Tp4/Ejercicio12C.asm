#Escribir un programa que multiplique dos números NUM1 y NUM2 y almacene el
#resultado en RES:
#c. Llamando a una subrutina MUL, pasando los parámetros por referencia (usando
#registros) y devolviendo el resultado por valor (en un registro).

	
	.data
RES:	.space 4
NUM1:	.word 4
NUM2:	.word 5
mensaje:	.asciz "La multiplicacion es:"

	.text
main:
	#Cargo las direcciones
	la t2, RES
	lw a3, 0(t2)
	
	la t0, NUM1
	la t1, NUM2
	
	#Llamo ala subrutina y le paso las referencias de los parametros t0 y t1
	jal ra, MUL
	mv t3, a0	#Guardo el resultodo en t3
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje 
	ecall
	
	#Muestro el resultado
	li a7, 1
	mv a0, t3
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
	
	
############SUBRUTINA MUL##########################
MUL:
	#Cargo los valores de t0 y t1 
	lw a1, 0(t0)
	lw a2, 0(t1)
	mul a0, a1, a2
	ret 