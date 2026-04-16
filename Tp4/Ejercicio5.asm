#A partir del ejercicio anterior, implementar un algoritmo que ordene el arreglo de menor
#a mayor. El arreglo ordenado debe almacenarse en uno nuevo llamado RES.

.data
mensaje:	.asciz "El numero menor es: "
Array:	.word 22,63,72,13,1
sizeArray:	.word 5
Minimo:	.space 4

.text
main:

	la t0, Array	#Cargo la direccion del array
	la t1, sizeArray
	lw a1, 0(t1)
	
	li a2, 0	#Indice a2 = 0
	lw a0, 0(t0)	#Asumo que el primer elemento es el minimo
	
for:
	beq a2, a1, fin_for	#a2 == sizeArray
	lw t5, 0(t0)	#Lee el primer elemento
	
	blt t5, a0 ,esMenor	#t5 < a0 = minimo

continuar:
	addi t0, t0, 4	#Muevo el puntero al siguente entero (4 byte)
	addi a2, a2, 1	#Indice++
	j for
	
esMenor:
	mv a0, t5	#Guardo el menor temporalmente
	j continuar 
	
fin_for:	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje
	ecall

	#Guardo el menor
	la a6, Minimo
	sw a7, 0(a6)
	
	#Muestro el menor
	li a7, 1
	mv a0, a7
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
