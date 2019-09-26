TITLE HW8-2-b_EricLee

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor edx, edx
		xor eax, eax

		mov eax, 07C8A2B8Fh

		and al, 11110000b
		mov dl, al
		shr eax, 4
		shr edx, 4
		shr eax, 4
		and al, 11110000b
		add dl, al
		shr eax, 4
		push edx
		shr eax, 4
		and al, 11110000b
		mov dl, al
		shr edx, 4
		shr eax, 4
		shr eax, 4
		and al, 11110000b
		add dl, al
		pop eax
		shl edx, 4
		shl edx, 4
		add eax, edx

		call WriteHex
		call Crlf



	exit
	main ENDP
END main
