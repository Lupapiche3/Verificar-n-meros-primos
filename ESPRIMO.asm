.data
	numero_primo:   .asciiz " Es primo"
	numero_no_primo: .asciiz " No es primo"
	tira1: 		.asciiz "Introduzca un n�mero(positivo) y dir� si es primo: "

.text
 	
j MAIN #JUMP A ETIQUETA MAIN

VERIFICAR_SI_NUMERO_ES_PRIMO:

	addi $t0,$zero,2 #Para verificar si el valor es menor a 2	
	slt $t1,$a0,$t0 # si $a0 es < 2, t1 = 1, si no t1 = 0
	bne $t1,$zero,NUMERO_NO_PRIMO_VERIFICAR_SI_NUMERO_ES_PRIMO #si $t1 == 1, jump NUMERO_NO_PRIMO_VERIFICAR_SI_NUMERO_ES_PRIMO
	
	srl $t1,$a0,1 # desplazamos $a0 a la derecha 1 bit [0000 1000] [0000 100]
	addi $t1,$t1,1 
	
LOOP_VERIFICAR_SI_NUMERO_ES_PRIMO:

	slt $t2,$t0,$t1 # si $t0 es < $t1, t2 = 1, si no t2 = 0
	beq $t2,$zero,FIN_VERIFICAR_SI_NUMERO_ES_PRIMO # si t2 == 0, jump FIN_VERIFICAR_SI_NUMERO_ES_PRIMO
	div $a0,$t0 # $a0/$t0
	mfhi $t2 #t2 = resto de la divisi�n
	beq $t2,$zero,NUMERO_NO_PRIMO_VERIFICAR_SI_NUMERO_ES_PRIMO # si t2 == 0, JUMP NUMERO_N_PRIMO_VERIFICAR_SI_NUMERO_ES_PRIMO
	addi $t0,$t0,1 # $t0++
	j LOOP_VERIFICAR_SI_NUMERO_ES_PRIMO #Para cumplir un ciclo del bucle (va al inicio de la etiqueta)

NUMERO_NO_PRIMO_VERIFICAR_SI_NUMERO_ES_PRIMO:

	addi $v0,$zero,1 #suma 1 a $v0 para verificarci�n de no primo
	j SALIDA_VERIFICAR_SI_NUMERO_ES_PRIMO
	
FIN_VERIFICAR_SI_NUMERO_ES_PRIMO:
	
	addi $v0,$zero,0 #$v0 == 0 es primo

SALIDA_VERIFICAR_SI_NUMERO_ES_PRIMO:
	
	jr $ra #variable de retorno

MAIN:
	
	li $v0, 4 #servicio para imprimir 
 	la $a0, tira1 #Lo que imprime "Introduzca un n�mero(positivo) y dir� si es primo: "
 	syscall 
 	li $v0, 5 #servicio para scan 
 	syscall 
 	move $a0, $v0 #el contenido de $v0 se mueve a $a0
	jal VERIFICAR_SI_NUMERO_ES_PRIMO #retorna v0 si es primo o no retorno con $a0
	addi $s1,$v0,0 # s1 = v0
	li $v0,1 # imprimor el entero
	
	syscall 
	
	#$v0 == 0 es primo, del caso contrario ser� no primo
	bne $s1,$zero,NUMERO_NO_PRIMO #si $s1 != 0, jump NUMERO_NO_PRIMO
	la $a0,numero_primo #imprime "Es primo"
	j PRINT
	
NUMERO_NO_PRIMO:
	la $a0,numero_no_primo #imprime "No es primo"
	
PRINT:
	li $v0,4 #servicio para imprimir 
	syscall
	

	
