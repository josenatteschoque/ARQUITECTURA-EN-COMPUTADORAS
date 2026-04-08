#sumar los incices 3 y 7 del arreglo V y guardar el resultado en R
	.data
V:	.word 23, 12, 1, 5, 2, 9, 43, 3, 8
R:	.word 0 # .space 4

	.text
main:
	#obtenemos direcciones de las variables
	la t0, V #t0 <- &V
	la t1, R #t1 <- &R
	
	#traemos direcciones de las variables
	lw s0, 12(t0) #s0 <- V[3]
	lw s1, 28(t0) #s1 <- V[7]
	
	#sumamos los valores obtenidos
	add s2, s0, s1 #s2 = s0 + s1
	
	#guardamos el resultado en memoria RAM
	sw s2, 0(t1) 
	
	#finaliza el programa 
	li a7,10
	ecall
	