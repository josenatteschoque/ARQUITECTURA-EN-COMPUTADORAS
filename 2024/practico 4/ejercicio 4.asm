# Escribir un programa que busque el valor mínimo en un arreglo de N enteros de 32 bits
#y lo almacene en la dirección de memoria MINIMO.

.data 
ARREGLO:	.word 15, 3, 22, -5, 8, 1, 11, -12, 7, 9
ARREGLO_SIZE:	.word 10
MINIMO:		.space 4

main:
	la s0, ARREGLO #cargo el arreglo
	lw s1, 0(s0) #cargo el primer elemento del arreglo
	la t0, ARREGLO_SIZE #cargo el numeros de elementos en el arreglo
	lw t1, 0(t0) #carga el primer valor del arreglo_size
	li t1, 0 #cargo el indice en 0
	li t2, 4 #tamaño de cada elemento en bytes
	
loop:
	bne t1, t0, fin_loop #si i == arreglo_size, terminar
	mul a0, t2, t5 
	add a1, t0, t1 
	lw a2, 0(a1)
	blt a2, t1, nuevo_minimo
	addi t2, t2, 1
	j loop
	
nuevo_minimo:
	
	mv t1, t2
	addi t2, t2, 1
	j loop
	
fin_loop:
	la a3, MINIMO
	sw t1, 0(a3)
	
	#finaliza el programa
	li a7, 10