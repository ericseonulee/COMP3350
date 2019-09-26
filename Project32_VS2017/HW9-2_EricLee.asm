TITLE HW9-2_EricLee.asm
INCLUDE Irvine32.inc
.data
	myAuburnID BYTE 09d,03d,75d,09d,90d
	myAurbunIdRev BYTE 09d,90d,57d,30d,90d
	Result BYTE 5 DUP(0)
	Message1 BYTE "MYAUBURNID",0
	Message2 BYTE "RESULT",0
.code
MAIN PROC
	mov edx, OFFSET Message1
	CALL WriteString
	mov edx,0
	CALL Crlf
	push OFFSET myAuburnID
	push 5 
	CALL PrintArray
	CALL Crlf

	mov edx, OFFSET Message2
	CALL WriteString
	mov edx,0
	CALL Crlf

	push OFFSET Result
	push 5
	CALL PrintArray

	CALL Crlf
	mov ecx, 6
	mov edx, 5
	mov esi, OFFSET myAuburnID
	mov edi, OFFSET myAurbunIdRev
	mov ebx, OFFSET Result


	L1:
		mov al, [esi + edx]
		mov ah, [edi + edx]
		add al, ah
		daa
		mov byte ptr [ebx + edx],al
		dec edx
	loop L1

	CALL Crlf
	push OFFSET Result 
	push 5
	CALL PrintArray
	exit
MAIN ENDP

PrintArray PROC
push ebp
mov ebp, esp
mov esi, [ebp+12] 
mov ecx, [ebp+8]
mov ebx, 0
L1:
movzx eax, BYTE PTR [esi + ebx]
add ebx, TYPE BYTE
CALL WriteDec
CALL Crlf
Loop L1
pop ebp
ret 8
PrintArray ENDP

END main