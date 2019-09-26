TITLE HW8-1_EricLee.asm

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor eax, eax
		xor ecx, ecx

		mov cl, 2
		mov al, 33h			
		rol al, cl		; 	 al = 
		mov al, 6Dh
		mov cl, 1
		ror al, cl 		; 	 al = 
		stc
		mov al, 8Eh
		mov cl, 2
		rcl al, cl		; 	 al = 
		stc
		mov al, 0FAh
		mov cl, 1
		rcr al, cl		; 	 al = 

	exit
	main ENDP
END main