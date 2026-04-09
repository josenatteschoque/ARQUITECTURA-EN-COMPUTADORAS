#Dado un arreglo de valores genera un segundo arreglo del mismo tamaño que indique si cada elemento es par o no.
#usando una rutina de chequeo de paridad

.data
V:	.word 8,3, 9, 6, 7
N:	.word 5
R:	.word 0, 0, 0, 0, 0

.text
main:
	la t0, V
	la t1, N
	la t2, R

	lw s0, 0(t1)	#s0 <-- N
	li t1, 4	#t1 es tamaño del dato
	
loop:	
	beqz s0, finloop
	
	lw s1, 0(t0)
	#Invocamos retina de chequeo
	mv a0, s1
	jal ra, chequeo
	
	add t0, t0, t1
	addi s0, s0, -1	
	j loop
finloop: 
	li a7, 10
	ecall
	
	
	

#######	rutinas	#########
chequeo:
	li t6, 2 
	rem a6, a0, t6
	jr ra	#return a6