# GonzalezOrozcoJuanCarlos_Menor.asm
# Este programa pide al usuario entre 3 y 5 números y encuentra el número menor

    .data
prompt:     .asciiz "Ingrese el número: "
result:     .asciiz "El número menor es: "

    .text
    .globl main
main:
    li $t0, 3               # Contador de números ingresados (mínimo 3)
    li $t1, 99999           # Número menor inicial (gran valor)

loop:
    li $v0, 4               # Aquí se incluye la llamada para imprimir
    la $a0, prompt
    syscall

    li $v0, 5               # Aquí se incluye la llamada para leer número
    syscall
    move $t2, $v0           # Aquí se guarda el número ingresado en t2

    # Aquí se compara el número ingresado con el número menor
    bge $t2, $t1, skip      
    move $t1, $t2           # Se actualiza el número menor

skip:
    addi $t0, $t0, -1       # Se decrementa el contador
    bgtz $t0, loop          # Se repite si faltan números

# Aquí se imprime el resultado
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1           # Aquí se muestra el número menor
    syscall

    li $v0, 10              # Y finalmente con esta línea se sale del script
    syscall
