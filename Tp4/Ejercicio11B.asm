#Escribir un programa que calcule el factorial de un número:
#a. Directamente desde el programa principal, sin usar subrutinas.
#b. Utilizando una subrutina llamada FACT.

	.data
N:	.word 5
mensaje:	.asciz "El factorial es:"

.text
main:
	la t0, N	#Obtengo la direccion de N
	lw a0, 0(t0)	#Cargo el valor de N

	jal ra, FACT	#Llama ala subrutina FACT 
	mv t1, a0	#guardo el valor de la subrutina a t1
	
	#Muestro el mensaje por consola
	li a7, 4
	la a0, mensaje
	ecall
	
	#Muestro el valor obtenido
	li a7, 1
	mv a0, t1
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
	
	
###########SUBRUTINA FACTORIAL##############
FACT:
	li t0, 1	#Contador
	
for:	
	ble a0, t1, fin_for	#a0 <= t1 
	mul t0, t0, a0
	addi a0, a0, -1
	j for
	
fin_for:	
	mv a0, t0	#guardo el valor obtenido en a0
	ret	#Vuelve a main
	
	