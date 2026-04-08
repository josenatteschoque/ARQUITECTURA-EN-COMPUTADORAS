#Programa que sume dos variables y guarde el resultado en memoria

.data

valor1:	.word 7
valor2:	.word 2
res:	.space 4	#.(space 4) indica que va a reservar un espacio de 4 

.text
main:
	la t1, valor1	#t1 = &valor1
	la t2, valor1	#t2 = &valor2
	la t3, res	#t3 = &res
	
	lw s0, 0(t1)	#s0 =  MP[&t1]
	lw s1, 0(t2)	
	
	
	add s2, s0, s1 #suma s2 = s1 + s0
	
	sw s2, 0(t3)	#se guarda el resultado en s2
	
	# Finalizamos el programa
	li a7, 10
	ecall
	
#verificar el resultado creo que el profe se equivoco!
	
	 
	

