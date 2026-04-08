#5. Contar elementos pares en un arreglo
#Objetivo: Contar cuántos números en un arreglo son pares.

.data
array:		.word 2,5,7,8,4,0
size:		.word 6
cont:		.word 0

.text 
.global main
main:
	la s0, array
	la s1, size
	
	lw a1, 0(s1) #longitud del array
	
	li t0, 0 #indice = 0
	
	li t1, 0 #contador de pares
	li t4, 2
	
loop:	
	bge t0, a1 #t0 >= a1
	
	#accede al elemento del arreglo
	slli t2, t0, 2
	add t2, s0, t2
	lw t3, 0(t2) #obtengo el valor del array
	
	#verificar si es par
	rem t5, t3, t4 #t5 = t3 / t4
	
	
	
	

fin: