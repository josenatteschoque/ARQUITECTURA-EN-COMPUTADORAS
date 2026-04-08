#Uso de li y mv: Escribir un programa para inicializar los registros x5, x6, x7, x8 con
#los valores 5, 6, 7 y 8 respectivamente usando li. Luego, transferir estos valores a los
#registros x15, x16, x17 y x18 usando mv. Contar cuántas instrucciones tiene el
#programa.

	.text #bloque de instruciones
main: 
	#inicializa los registros
	li x5, 5
	li x6, 6
	li x7, 7
	li x8, 8 
 
 	#transfiere los registros
 	mv x15, x5
 	mv x16, x6
 	mv x17, x7
 	mv x18, x8
 	
 	#finaliza el programa
 	li a7, 10
 	ecall