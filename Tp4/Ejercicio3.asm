#Escribir un programa que recorra un arreglo de 10 enteros (llamado TABLA) y cuente
#cuántos son mayores que un valor X. Guardar el resultado en una dirección de memoria
#etiquetada como CANT. Además, generar otro arreglo llamado RES, donde cada
#elemento sea 1 si el valor correspondiente en TABLA es mayor que X, o 0 si es menor o
#igual.

	.data
TABLA:	.word 1,2,3,5,2,8,9,23,0,6	#Arreglo con 10 elementos
X:	.word 5		#Valor a comparar
CANT:	.word 0		#Guardamos la cantidad de mayores
RES:	.space 40	#son 40 bytes porque son 10 elementos

mensCant:	.asciz "La cantidad es: "
mensCorchete1:	.asciz "["
mensComa:	.asciz ","
mensCorchete2:	.asciz "]"
salto:	.asciz "\n"
	.text
main:
cargaReg:
	#Direcciones de memoria
	la t0, TABLA	#to es un puntero a TABLA
	la t1, RES	#t1 Apunta a RES
	la t2, CANT	#t2 Apunta a CANT
	
	#Valores
	la t3, X	#Obtengo la direccion de X
	lw t3, 0(t3)	#Guardo en t3 el valor X
	li t4, 10	#t4 = cantidad de elementos a procesar
	li t5, 0	#t5 = Cantidad de valores mayores a X

ini_for:
	beq t4, zero,fin_for
	lw t6, 0(t0)	#t6 = t0[i]
	ble t6, t3 ,menor_igual	#TABLA[t0] <= t3
	
mayor:
	li s0,1
	sw s0,0(t1)	#Ponemos un 1 en el vector de resultados RES
	addi t5,t5,1	#incrementamos el contador de mayores 


menor_igual:
	sw zero, 0(t1)
	
siguiente:
	addi t0, t0, 4
	addi t1, t1, 4
	addi t4, t4, -1
	j ini_for	
fin_for:
	sw t5, 0(t2)	
	
	#Muestro el mensaje
	li a7, 4
	la a0, mensCant
	ecall
	
	#Muestro el valor de cantidad
	li a7, 1
	mv a0, t5
	ecall
	
	#Muestro el salto de linea
	li a7, 4
	la a0, salto
	ecall
	
	#muestro el [
	li a7,4
	la a0,mensCorchete1
	ecall

#Falta mostrar el arreglo RES = []!
#	li s1, 0
#	li s2, 10
#loop:

#	li a7, 1
#	mv a0, t1
#	lw a0,0(a0)
#	ecall
	
	#Falta!!!
#	li a7, 4
#	la a0, mensComa
#	ecall
	
#	addi s1, s1,1	#s2++
#	blt s1, s2, finloop
#	j loop 
	
#finloop:
	
	#Muestro el ]
	li a7, 4
	la a0, mensCorchete2
	ecall
	
	#Finalizar el programa
	li a7, 10
	ecall
