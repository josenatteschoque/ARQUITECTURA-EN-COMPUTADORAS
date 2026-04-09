#Secuencia de valores: Escribir un programa donde:
#x3 tome los valores 0,1,2,3,4,5...
#x4 tome los valores 0,3,6,9,12,15...
#x5 tome los valores 0,5,10,15,20,25... indefinidamente. Ejecutarlo paso a
#paso para verificar su funcionamiento.
	.text
main:
	#Inicializo los registos en cero
	li x3, 0
	li x4, 0
	li x5, 0
	
	#Loop que uso para la suma repetitiva
loop:
	#Suma repetitiva  
	addi x3, x3,1	#x3 Incrementa de 1 en 1  
	addi x4, x4, 3	#x4 incrementa de 3 en 3
	addi x5, x5, 5	#x5 Incrementa de 5 en 5
	j loop
	
	#Finaliza el programa
	li a7, 10
	ecall