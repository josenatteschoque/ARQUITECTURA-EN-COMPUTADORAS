#10. Escribir un programa que pida al usuario una cadena, calcule su longitud y la
#imprima en la consola. La cadena tiene un máximo de 1024 bytes y termina con \n.
	.data
	
buffer:	.space 64
mensaje:	.asciz  "Ingrese una cadena: "
mensaje1:	.asciz "La longitud es:"
	.text
	
	#Muestra el mensaje
	li a7, 4
	la a0, mensaje
	ecall

	
	#Lee la cadena
	li a7, 8
	la a0, buffer
	li a1, 64
	ecall
	
	la t0, buffer
	li t1, 0	#Contador
loop:
	lb t2, 0(t0)	#Carga un byte (caracter)
	li t3, 10	#ASCII 10 = \n
	beq t2, t3, fin	#Si es el \n termina el loop
	
	addi t1, t1, 1	#Longitud = longitud +1
	addi t0, t0, 1	#Avanzo al siguiente caracter
	j loop
	
fin:
	#Muestra el mensaje resultado
	li a7, 4
	la a0, mensaje1
	ecall
	
	#Muestro el resultado
	li a7, 1
	mv a0, t1
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall	
