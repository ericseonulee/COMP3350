TITLE HW7-2_EricLee.asm
INCLUDE Irvine32.inc
.data
myName BYTE "Eric Lee", 0
studentID = 094

.code
	main PROC
		mov edx, OFFSET myName
		call WriteString
		call Crlf

		call encode

		mov edx, OFFSET myName
		call WriteString
		call Crlf

		call encode

		mov edx, OFFSET myName
		call WriteString
		call Crlf

		exit

	main ENDP

	encode proc
		mov ecx, SIZEOF myName
		xor esi, esi

		L1: XOR myName[esi], studentID
		inc esi
		loop L1

		ret
	encode endp

end main