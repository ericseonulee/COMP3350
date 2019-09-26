TITLE HW10-1_EricLee.asm

INCLUDE Irvine32.inc

.DATA
	table BYTE 89, 'A',0
			rowSize = ($ - table)
			BYTE 79, 'B',0
			BYTE 69, 'C',0
			BYTE 59, 'D',0
			BYTE  0, 'F',0
	numRows = ($ - table) / rowSize

	input BYTE "Enter a score: ",0
	original BYTE "Original Score: ",0
	final BYTE "Final Score: ",0
	letter BYTE "Letter Grade: ",0

.CODE
	MAIN PROC

		mov edx, offset input
		call WriteString
		call ReadDec

		mov edx, offset original
		call WriteString
		call WriteDec
		call Crlf

		add eax, 1
		mov edx, offset final
		call WriteString
		call WriteDec
		call Crlf

		mov edx, offset letter
		call WriteString

		mov ebx, offset table
		mov ecx, numRows
		L1:
			cmp al, BYTE PTR [ebx]
			jb next

			mov edx, ebx
			inc edx
			jmp quit

			next:
				add ebx, rowSize
		loop L1
		quit:

		call WriteString
		call Crlf

	exit
MAIN ENDP
END MAIN