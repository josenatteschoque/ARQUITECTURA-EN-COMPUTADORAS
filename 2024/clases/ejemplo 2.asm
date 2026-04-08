#se suma 1 a todos los elementos de la matriz m (3 x 4),
#cuyos elementos sean positivos, y se resta 1 alos elementos negativos.

	.data
M:	.word 23, 9, -2, 15, 1, 8, 0, 3, 4, 89, -1, 7
CF:	.word 3
CC:	.word 4

	.text	
main:
	la s0, M #s0 <- &M
	la t0, CF #t0 <- &CF
	la t1, CC #t1 <- &CC
	
	#cargamos los tamaños de la matriz
	lw t2, 0(t0) #t2 <- CF
	lw t3, 0(t1) #t3 <- CC
	
	#inicializamos los indices
	li t0, 0 #i <- 0
	li t1, 0 #j <- 0
	
forF:
	#recorro por filas
	beq t0, t2, finforF # si i = 3 entonces salto a finfor
	
	#recorro por columnas
forC:	beq t1, t3, finforC
	
	#k <- i * CC + j
	mul t5, t0, t3 #t5 <- i * CC
	add t6, t5, t1 #t6 <- t5 + j
	
	#calculamos desplazamiento y traemos el dato
	mul t5, t6, t4 #t5 <- t6 * 4
	add t6, t5, s0 #&M + desp (t5)
	lw s1, 0(t6)
	
	bltz s1, es_negativo
	addi s2, s1, 1	#s2 <- s1 + 1	
	j continuar
es_negativo: 
	addi s2, s1, -1 #s2 <- s1 -1

continuar:
	sw s2, 0(t6) #M[i,j] <- s2
		
	addi t1, t1, 1 #j <- j+1
	j forC
finforC:	
	
	addi t0, t0, 1 #i <- i + i | i++
	j forF
	
finforF:
	