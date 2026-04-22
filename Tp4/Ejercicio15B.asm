#Escribir un programa que sume dos números de 32 bits almacenados en memoria:
#a. Resolviendo todo en el programa principal, sin subrutinas.
#b. Llamando a una subrutina SUM32, que reciba los parámetros por valor a través
#de la pila y devuelva el resultado también por referencia usando la pila.

.macro apilar (%valor)
	sw %valor, 0(sp)
	addi sp, sp, 4
.end_macro
	
			
.macro desapilar (%valor)
	addi sp, sp, -4
	lw %valor, 0(sp)
.end_macro


	.data
valor1:	.word 5
valor2:	.word 3
res:	.word 0
mensaje:	.asciz "El resultado es:"

	.text
main:
	la t0, valor1
	lw a1, 0(t0)
	la t1, valor2
	lw a2, 0(t1)
	
	apilar(a1)
	apilar(a2)
	
	jal ra, SUM32
	desapilar(t3)
	
	la t4, res
	sw t3, 0(t4)	
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#Muestro el resultado
	li a7, 1
	lw t3, 0(t4)
	mv a0, t3
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
	
#############SUBRUTINA SUM32#######################
SUM32:
	desapilar(a1)
	desapilar(a2)
	add t3, a1, a2
	apilar(t3)
	addi a0, sp, -4
	ret
	
