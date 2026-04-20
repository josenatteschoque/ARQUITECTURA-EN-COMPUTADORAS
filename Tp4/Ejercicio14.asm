#Escribir una subrutina RESTO que calcule el resto de dividir dos números positivos. Los
#parámetros deben pasarse por valor usando registros y el resultado debe devolverse
#por referencia usando un registro.

	.data
	
valor1:	.word 4
valor2:	.word 5
resultado:	.word 0
mensaje:	.asciz "El resultado es: "

.text 
main:
	la s1, valor1
	lw a1, 0(s1)
	
	la s2, valor2
	lw a2, 0(s2)
	
	la a3, resultado
	
	jal ra, RESTO	#Llamo ala subrutina RESTO
	lw a3, 0(a3)
	mv a5, a3
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#Muestro el resultado
	li a7, 1
	mv a0, a5
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
	
	
##########SUBRUTINA RESTO#############################
RESTO:
	rem t0, a1, a2	#Obtengo el resto
	sw t0, 0(a3)	#Guardo el resultado en resultado
	ret 
	
	
	
	