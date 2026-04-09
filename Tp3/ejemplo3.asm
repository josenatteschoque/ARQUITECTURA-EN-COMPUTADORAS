#sume todos los elementos impares de una matriz 2x3
.data
Matriz:	.word 1, 5, 6
	.word 8, 3, 4
CF:	.word 2	#Cantidad de filas
CC:	.word 3	#Cantidad de columnas
res:	.space 4
	
.text 
main:
	#Cargo las direcciones de las variables
	la t0, Matriz
	la t1, CF
	la t2, CC
	la t3, res
	li t4, 4
	
	lw s0, 0(t1)	#s0 <-- CF
	lw s1, 0(t2)	#s1 <-- CC
	li t5, 0	#i <-- 0
	li s10, 2	#Constante para dividir 2
	
forF:
	beq t5, s0, finforF
	li t6, 0	#j <-- 0
forC:
	beq t6, s1, finforC
	
	mul t1, t5, s1	#t1 <-- i * CC
	add t2, t1, t6	#t2 <-- (i * CC) + j
	
	mul t1, t2, t4	#desplazamiento <-- k * tamaño(word)
	add s2, t1, t0	#&M[i, j] <-- &M + desplazamiento
	
	lw s3, 0(s2)	#s3 <-- M[i, j] 

	#chequeamos paridad
	
	rem s4, s3, s10	#s4 <-- s3 % 2
	beqz s4, finIter
	add s9, s9, s3
	

finIter:	
	addi t6, t6, 1	#++j  
	j forC
	
	
finforC:
	addi t5, t5, 1	#++i
	j forF
	
finforF:
	sw s9, 0(t3)	#res <-- s9

	#finalizamos el programa
	li a7, 10
	ecall
	
## k <-- i * CC + j
