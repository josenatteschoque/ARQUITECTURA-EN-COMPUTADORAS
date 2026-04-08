#Escribir un programa que recorra un arreglo de 10 enteros (llamado TABLA) y cuente
#cuántos son mayores que un valor X. Guardar el resultado en una dirección de memoria
#etiquetada como CANT. Además, generar otro arreglo llamado RES, donde cada
#elemento sea 1 si el valor correspondiente en TABLA es mayor que X, o 0 si es menor o
#igual.

.data
TABLA:      .word 5, 12, 8, 23, 7, 15, 30, 4, 10, 18  # Arreglo de 10 enteros
X:          .word 10                                  # Valor de comparación
CANT:       .word 0                                   # Resultado del conteo
RES:        .space 40                                # Espacio para 10 palabras (4 bytes c/u)

.text
.globl _start

_start:
    la t0, TABLA         # t0 = dirección de TABLA
    la t1, RES           # t1 = dirección de RES
    lw t2, X             # t2 = valor de X
    li t3, 0             # t3 = contador (CANT)
    li t4, 10            # t4 = tamaño del arreglo
    li t5, 0             # t5 = índice del bucle

loop:
    bge t5, t4, end      # Si índice >= tamaño, terminar
    lw t6, 0(t0)         # Cargar elemento actual de TABLA en t6
    
    # Comparar con X
    ble t6, t2, menor    # Si TABLA[i] <= X, saltar a menor
    addi t3, t3, 1       # Incrementar contador CANT
    li a0, 1             # Usar a0 para almacenar temporalmente el 1 (en lugar de t6)
    sw a0, 0(t1)         # Almacenar 1 en RES[i]
    j siguiente

menor:
    li a0, 0             # Usar a0 para almacenar temporalmente el 0 (en lugar de t6)
    sw a0, 0(t1)         # Almacenar 0 en RES[i]

siguiente:
    addi t0, t0, 4       # Avanzar al siguiente elemento en TABLA
    addi t1, t1, 4       # Avanzar al siguiente elemento en RES
    addi t5, t5, 1       # Incrementar índice
    j loop

end:
    la t0, CANT          # Cargar dirección de CANT
    sw t3, 0(t0)         # Almacenar el valor del contador en CANT
    
    # Terminar el programa
    li a7, 93            # Código de llamada al sistema para exit
    li a0, 0             # Código de retorno 0
    ecall