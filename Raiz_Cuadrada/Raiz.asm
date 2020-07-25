;     nasm -felf64 Raiz.asm && gcc -no-pie Raiz.o && ./a.out

        global  main
        extern  printf
        extern scanf

        section .text
main:
        push    RBX 

        mov 	RDI, Cadena
        call 	printf 

        mov 	RDI, FormatoScanf
        mov 	RSI, Numero        
        call 	scanf

        mov     RCX, [Numero]

		xor     RAX, RAX                
	    xor     RBX, RBX  
	    xor 	RBP, RBP              
	    inc     RBX
	    mov 	RAX, RBX
	    jmp 	bucle                     

	bucle:                 
	        mul     RBX 
	        cmp 	RAX,RCX
	        je 		exacta
	        jg  	noExacta
	        inc     RBX                              
	        mov		RAX,RBX
	        jmp 	bucle

	exacta:
	        mov 	RDI, Raiz
	        mov 	RSI, RBX

	        call 	printf

	        pop     RBX                     
	        ret

	noExacta:
			mov 	RBP,RAX
			dec 	RBX
			mov 	RAX,RBX
			mul 	RBX

			mov 	RDI, RaizNoExacta
	        mov 	RSI, RBX
	        xor 	RAX, RAX

	        call 	printf

	        pop     RBX                     
	        ret

        section .data
Cadena:
		db "Ingrese un Numero: ", 0
FormatoScanf:		
		db  "%d", 0
Raiz:	
		db  "La Raiz es: %d",10, 0
RaizNoExacta:	
		db  "La Raiz mas Cercana es: %d",10, 0

		section .bss
Numero:
		resd 1