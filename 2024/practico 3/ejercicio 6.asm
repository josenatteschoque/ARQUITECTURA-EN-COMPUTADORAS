#Suma de los primeros N números naturales: Escribir un programa que calcule la
#suma de los primeros N números naturales.
	.text
main:
	#inicializa los registros
	li a0, 10 #es la cantidad de sumas
	li t0, 0 #guarda el resultado
	li t1, 1 #inicializa el contador
loop:
	add t0, t0, t1 #suma 0 + 1 = t0 
	addi t1, t1, 1 #inclementa el contador 
	ble t1, a0, loop #salta si t1 >= a0
	
	#finaliza el programa
	li a7, 10
	ecall