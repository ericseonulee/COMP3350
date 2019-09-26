TITLE HW7-1_EricLee.asm
Include Irvine32.inc
.data
	array1 SWORD 0, 1, 2, 3, 'a', 'b', 'c'
	array2 SWORD '!', '@', '$', '%', '^', '&', '*'
	array3 SWORD '!', '@', 1, 2, 3

	message1 BYTE "non-alphanumeric character found"
	message2 BYTE "no non-alphanumeric character found"
.code
	main PROC
		;test array1
		mov esi, OFFSET array1
		mov ecx, LENGTHOF array1
	
		call findNonAlphanumericNum

		;test array2
		mov esi, OFFSET array2
		mov ecx, LENGTHOF array2

		call findNonAlphanumericNum

		;test array3
		mov esi, OFFSET array3
		mov ecx, LENGTH array3

		call findNonAlphanumericNum

		exit
	main ENDP

	findNonAlphanumericNum PROC
;		mov eax, 1
;
;		L1:
;			test BYTE PTR [esi], 080h
;			jz zero
;
;		notFound:
;			add esi, TYPE array1
;			loop L1
;			mov edx, OFFSET message2
;			call WriteString
;			call Crlf
;			ret
;
;		zero:
;			AND eax, [esi]
;			ja done
;			jnz notFound
;
;		done:
;			mov edx, OFFSET message1
;			call WriteString
;			call Crlf
;			xor eax, eax
;			mov al, [esi]
;			add edi, TYPE array1
;			
;			ret

	findNonAlphanumericNum ENDP

END main