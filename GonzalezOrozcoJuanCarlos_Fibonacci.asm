# GonzalezOrozcoJuanCarlos_Fibonacci.asm
# Este programa genera la serie Fibonacci y suma sus términos

    .data
prompt:     .asciiz "Ingrese cuantos números de Fibonacci desea: "
result:     .asciiz " La suma de la serie Fibonacci es: "

    .text
    .globl main
main:
    li $t0, 0               # Este es el primer número de la serie de Fibonacci
    li $t1, 1               # Este es el segundo número de la serie de Fibonacci
    li $t2, 0               # Aquí se inicializa la suma

    li $v0, 4               # Aquí se solicita la cantidad de términos
    la $a0, prompt
    syscall

    li $v0, 5               # Aquí se lee el número
    syscall
    move $t3, $v0           # Aquí se guarda la cantidad de términos en t3

fibonacci_loop:
    beqz $t3, end_fib       # En este caso, si ya se generaron los términos, se sale del ciclo

    add $t2, $t2, $t0       # Aquí se suman los términos

    li $v0, 1
    move $a0, $t0           # Aquí se imprime el resultado
    syscall

    # Aquí se genera el siguiente término de la serie de Fibonacci
    move $t4, $t0
    add $t0, $t0, $t1
    move $t1, $t4

    addi $t3, $t3, -1       # Se decrementa el contador
    j fibonacci_loop

end_fib:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2           # Se muestra la suma de términos
    syscall

    li $v0, 10              # Y finalmente con esta línea se sale del script
    syscall
