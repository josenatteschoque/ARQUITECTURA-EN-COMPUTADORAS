#A partir del ejercicio anterior, implementar un algoritmo que ordene el arreglo de menor
#a mayor. El arreglo ordenado debe almacenarse en uno nuevo llamado RES.

.data
Res:        .word 0, 0, 0, 0, 0
Array:      .word 22, 63, 72, 13, 1
sizeArray:  .word 5
infinito:   .word 999999    # Para "marcar" los que ya usamos
espacio:	.asciz ","	#Espacio

.text
main:
    la s0, Res          # s0 = Base de Res
    la s2, sizeArray
    lw s2, 0(s2)    # s2 = 5
    li a3, 0            # a3 = i (cuántos números ya ordenamos)

for_externo:
    beq a3, s2, fin_programa	#a3 == s2
    
    la t1, Array        # REINICIAMOS t1 al principio del array en cada vuelta
    li t4, 0            # j = 0 (índice para el for interno)
    
    li a0, 999999       # Empezamos con un mínimo muy alto
    li t6, 0            # Aquí guardaremos la DIRECCIÓN del mínimo hallado

for_busqueda:
    beq t4, s2, guardar_minimo	#t4 == s2
    lw  t3, 0(t1)       # Leer elemento actual
    
    blt t3, a0, esMenor	#t3 < a0
    j   continuar

esMenor:
    mv  a0, t3          # Nuevo valor mínimo
    mv  t6, t1          # Guardamos la dirección (donde está el mínimo en Array)

continuar:
    addi t1, t1, 4      # Avanzar al siguiente word en Array
    addi t4, t4, 1      # j++
    j   for_busqueda

guardar_minimo:
    # 1. Guardar el mínimo hallado en Res
    slli t5, a3, 2      # i * 4
    add  t5, s0, t5     # Dirección en Res[i]
    sw   a0, 0(t5)      # Guardamos el mínimo
    
    # 2. "Borrar" el mínimo del Array original para no encontrarlo de nuevo
    la   t5, infinito
    lw   t5, 0(t5)
    sw   t5, 0(t6)      # Ponemos 999999 en la posición donde estaba el mínimo

    addi a3, a3, 1      # i++
    j   for_externo

fin_programa:
imprimir:
	la a1, Res
	la t2, sizeArray
	lw t2, 0(t2)	#t2 = 5
	li a2, 0	#i = 0
	
forImprimir:
	beq a2, t2, fin
	lw a4, 0(a1)	
	
	#Imprime el numero
	li a7, 1
	mv a0, a4
	ecall
	
	#Imprime el espacio
	li a7, 4
	la a0, espacio
	ecall
	
	addi a1, a1, 4	#Avanza al siguiente elemento
	addi a2, a2, 1	#i++
	j forImprimir
	
fin:
    #Finaliza el programa
    li a7, 10
    ecall


#Este ejercicio fue planteado con una IA!