# GonzalezOrozcoJuanCarlos_Fibonacci.asm
# Este programa genera la serie Fibonacci y suma sus t�rminos

    .data
prompt:     .asciiz "Ingrese cuantos n�meros de Fibonacci desea: "
result:     .asciiz " La suma de la serie Fibonacci es: "

    .text
    .globl main
main:
    li $t0, 0               # Este es el primer n�mero de la serie de Fibonacci
    li $t1, 1               # Este es el segundo n�mero de la serie de Fibonacci
    li $t2, 0               # Aqu� se inicializa la suma

    li $v0, 4               # Aqu� se solicita la cantidad de t�rminos
    la $a0, prompt
    syscall

    li $v0, 5               # Aqu� se lee el n�mero
    syscall
    move $t3, $v0           # Aqu� se guarda la cantidad de t�rminos en t3

fibonacci_loop:
    beqz $t3, end_fib       # En este caso, si ya se generaron los t�rminos, se sale del ciclo

    add $t2, $t2, $t0       # Aqu� se suman los t�rminos

    li $v0, 1
    move $a0, $t0           # Aqu� se imprime el resultado
    syscall

    # Aqu� se genera el siguiente t�rmino de la serie de Fibonacci
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
    move $a0, $t2           # Se muestra la suma de t�rminos
    syscall

    li $v0, 10              # Y finalmente con esta l�nea se sale del script
    syscall
