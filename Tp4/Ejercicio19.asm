#19. Escribir un programa principal que lea una cadena ingresada por el usuario y calcule su
#longitud. Debe llamar a una función len(pcad) que reciba un puntero a la cadena y
#devuelva su longitud. Implementar esta función de forma recursiva.

	.data
mensaje_input:	.asciz "Ingrese una cadena: "	
mensaje_ouput:	.asciz "La longitud de la cadena es: "
cadena:		.space 100	#Espacio de la cadena
longitud:	.word 0		#Guardo la longitud de la cadena

	.text 
main:	

	#Muestra el mensaje
	li a7, 4
	la a0, mensaje_input
	ecall
	
	#Leer la cadena
	li a7, 8
	la a0, cadena
	li a1, 100
	ecall
	
	la a0, cadena
	jal ra, len
	
	#Guardo el resultado
	la t0, longitud
	sw a0, 0(t0)
	
	#Muestra el mensaje
	li a7, 4
	la a0, mensaje_ouput
	ecall
	
	#Imprimir cadena
	li a7, 1
	la t0, longitud
	lw a0, 0(t0)
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
	
	
##############SUBRUTINA LEN(PCAD)######################
len:
	addi sp, sp, -8		#Reservo espacio 
	sw ra, 4(sp)		##Guardamos ra en la posicion sp+4
	sw a0, 0(sp)		#Guardamos a0 en la posicion sp+0
	
	#Lee el caracter actual (1 byte
	lb t0, 0(a0)

	#Caso base: si es 0 (fin de la cadena), retornar 0
	beq t0, zero, caso_base	#t0 = 0 salta a caso_base
	
	#Caso recursivo
	addi a0, a0, 1	#a0 = cadena + 1 (siguiente caracter)
	jal ra, len	#Se llama a si misma len(cadena + 1)
	
	#Cuando vuelve a0 tiene len(cadena+1)
	addi a0, a0, 1
	j retornar	
	
caso_base:
	li a0, 0	#Retorna 0
	
retornar:
	#Restaura 
	lw ra, 4(sp)	#Restauramos la direccion de retorno original
	addi sp, sp, 8	#Devuelve el espacio ala pila
	ret	#Retorna al main
	
#Este ejercicio fue planteado con la ayuda de una IA.