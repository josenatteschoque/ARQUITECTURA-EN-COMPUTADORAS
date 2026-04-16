#Escribir un programa que calcule el factorial de un número:
#a. Directamente desde el programa principal, sin usar subrutinas.
#b. Utilizando una subrutina llamada FACT.

	.data
N:	.word 5
mensaje:	.asciz "El factorial es:"

.text
main:
	la t0, N	#Obtengo la direccion de N
	lw t0, 0(t0)	#Cargo el valor de N
	li t1, 1	#Contador
	
for:
	ble t0, zero, fin_for	#t0 <= zero
	mul t1, t1, t0	#t1 = t1 * t0
	addi t0, t0, -1	#t0 = t0 +(-1) 
	j for	#Salta ala etiqueta for
	
fin_for:
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