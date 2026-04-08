#Ejecutar y analizar código:
	.text #bloque de instrucciones
	addi x3, x0, 10 #suma 0 + 10 = x3
a: #etiqueta
	addi x3,x3,-1 #resta x3 - 1 = x3 
	bgt x3,x0, a #salto condicional x3 > x0 salta ala etiqueta

	#finaliza el codigo
	li a7, 10 
	ecall

#¿Qué hace este código?
#es una cuenta regresiva de 10 a 0