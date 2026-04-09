#Asignación de registros: Escribir un programa que asigne los siguientes valores a
#los registros indicados: x3=3, x4=4, x5=5, x6=6, x7=x7 y x8=8. Ejecutarlo paso a
#paso para comprobar que funciona correctamente.
	
#es este caso no uso el .data porque no necesito variables ya que solo me pide cargar valores alos registros

	.text
main:	#Etiqueta princupal

	#Cargo los valores
	li x3, 3	#x3 = 3
	li x4, 4	#x4 = 4
	li x5, 5	#x5 = 5
	li x6, 6	#x6 = 6
	li x7, 7	#x7 = 7
	li x8, 8	#x8 = 8
	
	
	#Finalizar el programa
	li a7, 10
	ecall