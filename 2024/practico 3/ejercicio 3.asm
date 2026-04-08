#Secuencia de valores: Escribir un programa donde:
#○ x3 tome los valores 0,1,2,3,4,5...
#○ x4 tome los valores 0,3,6,9,12,15...
#○ x5 tome los valores 0,5,10,15,20,25... indefinidamente. Ejecutarlo paso a
#paso para verificar su funcionamiento.

	.text
	
main:
	mv x3, x0 #x3 = 0
	mv x4, x0 #x4 = 0
	mv x5, x0 #x5 = 0
loop:
	addi x3, x3, 1 #x3 + 1 = x3
	addi x4, x4, 3 #x4 + 3 = x4
	addi x5, x5, 5 #x5 + 5 = x5
	j loop #salta hacia la etiqueta loop
	
	#finaliza el programa
	li a7, 10
	ecall

