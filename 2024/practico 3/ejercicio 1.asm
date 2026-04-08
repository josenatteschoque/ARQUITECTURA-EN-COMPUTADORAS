#Escribir el código del programa en el simulador.
	.data #inicia el bloque de instrucciones
str: 	.asciz"hola mundo"

	.text #bloque donde se realizan las instrucciones
	
main: #etiqueta principal
	la a0, str #carga la direccion de la variable
	li a7, 4 #carga el argumento del string
	ecall 
	
	#finaliza el programa
	li a7, 10
	ecall
	
