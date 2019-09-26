TITLE Subtracting Array			(main.asm)
INCLUDE Irvine32.inc

.data
array1	WORD	20h, 19h, 18h, 17h, 16h, 15h, 14h, 13h, 12h, 11h  
array2	WORD	10h, 9h, 8h, 7h, 6h, 5h, 4h, 3h, 2h, 1h, 0h
array3	WORD	10 DUP(?)

.code
main PROC
	mov ecx, lengthof array1
	mov esi, 0
	mov edx, lengthof array2
	mov edi, 0

loop1:
	mov ax, array1[esi]	
	sub ax, array2[edi]
	mov [array3 + esi], ax 
	add esi, type array1
	add edi, type array2
loop loop1

	mov ebx, offset array3
	mov ecx, lengthof array3
	mov esi, 0

	call Result

exit
main ENDP

Result PROC USES eax ebx esi
.data
	string BYTE "Result: ", 0
.code
	loop2:
	mov eax, [ebx + esi]
	call WriteString
	call WriteInt
	call Crlf
	add esi, type array3
loop loop2
Result ENDP
END main