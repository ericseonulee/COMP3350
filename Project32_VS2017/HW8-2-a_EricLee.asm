TITLE HW8-2-a_EricLee.asm

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor eax, eax
		xor ebx, ebx

		mov eax, 6h ; EAX
		push eax
		add ebx, eax
		shl ebx, 3
		pop eax
		add ebx, eax
	
		mov eax, ebx
		call WriteInt
		call Crlf

	exit
	main ENDP
END main