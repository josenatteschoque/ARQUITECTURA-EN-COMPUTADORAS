#Asignación de registros: Escribir un programa que asigne los siguientes valores a
#los registros indicados: x3=3, x4=4, x5=5, x6=6, x7=x7 y x8=8. Ejecutarlo paso a
#paso para comprobar que funciona correctamente.

	.text #bloque de donde se realizan las instrucciones
	
main: #etiqueta pricipal

	#carga inmediata en los registros 
	li x3, 3 #x3 = 3
	li x4, 4 #x4 = 4
	li x5, 5 #x5 = 5
	li x6, 6 #x6 = 6
	li x7, 7 #x7 = 7
	li x8, 8 #x8 = 8
	
	#finaliza el programa
	li a7, 10
	ecall
