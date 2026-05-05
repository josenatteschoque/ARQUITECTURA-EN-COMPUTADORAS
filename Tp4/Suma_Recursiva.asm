#Realizo un ejemplo de como usar recursividad en RISC-V 

	.data

n:	.word 5
mensaje:	.asciz "La suma es: "

	.text 
main:	
	la a1, n	#Cargo la direccion de N
	lw a0, 0(a1)	#Cargo el valor de N
	
	jal ra, suma	#Llama ala subrutina 
	mv t4, a0	#Guardo el resultado temporalmente

	#Muestro el mensaje
	li a7, 4
	la a0, mensaje
	ecall
	
	#Muestro el resultado
	li a7, 1
	mv a0, t4
	ecall
	
	#Finaliza el programa
	li a7, 10
	ecall
		
			
#################SUBRUTINA SUMA#######################################	
suma:
	addi sp, sp, -8		#Restamos 8 al stack pointer (reservamos espacio)
	sw ra, 4(sp)		#Guardamos ra en la posicion sp+4
	sw a0, 0(sp)		#Guardamos a0 en la posicion sp+0
	
	#CASO BASE	
	li t0, 1		#t0 = 1
	ble a0, t0, base	#a0 <= t0
	
	#CASO RECURSIVO
	addi a0, a0, -1	#N = N-1
	jal ra, suma 	#Se llama a si misma suma(N-1)
	
	lw t1, 0(sp)	#t1 = valor original
	add a0, a0, t1	#N = N + suma(N-1)
	j epilogo
base:
	li a0, 1	#retorna 1 cuando n = 1
	
epilogo:
	lw ra, 4(sp)	#Restauramos la direccion de retorno original
	addi sp, sp, 8	#Devuelve el espacio ala pila
	ret	#Retorna al main
	
	
	
	