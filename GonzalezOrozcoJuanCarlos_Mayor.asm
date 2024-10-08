# GonzalezOrozcoJuanCarlos_Mayor.asm
# Este programa pide al usuario entre 3 y 5 n�meros y encuentra el n�mero mayor

    .data
prompt:     .asciiz "Ingrese el n�mero: " # Se piden los n�meros al usuario
result:     .asciiz "El n�mero mayor es: " # Se genera el resultado de la operaci�n

    .text
    .globl main
main:
    li $t0, 3               # Contador de n�meros ingresados (m�nimo 3)
    li $t1, 0               # N�mero mayor inicial

loop:
    li $v0, 4               # Aqu� se incluye la llamada para imprimir
    la $a0, prompt
    syscall

    li $v0, 5               # Aqu� se incluye la llamada para leer n�mero
    syscall
    move $t2, $v0           # Aqu� se guarda el n�mero ingresado en t2

    # Aqu� se compara el n�mero ingresado con el n�mero mayor
    ble $t2, $t1, skip      
    move $t1, $t2           # Se actualiza el n�mero mayor

skip:
    addi $t0, $t0, -1       # Se decrementa el contador
    bgtz $t0, loop          # Se repite si faltan n�meros

# Aqu� se imprime el resultado
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1           # Aqu� se muestra el n�mero mayor
    syscall

    li $v0, 10              # Y finalmente con esta l�nea se sale del script
    syscall
