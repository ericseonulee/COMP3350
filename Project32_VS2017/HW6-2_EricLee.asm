TITLE HW6-2_EricLee.asm
Include Irvine32.inc
LengthOfArray = LENGTHOF Oranges
TypeOfArray = TYPE Oranges
.data
Oranges   SWORD 15 DUP(?)
.code
main PROC
Call GenerateArray
Call DisplayArray
exit
main ENDP

GenerateArray PROC
.data
PromptUser BYTE "Please enter a value: ", 0
.code
mov edx, OFFSET PromptUser
mov ecx, LengthOfArray
mov ebx, 0
L1:
   CALL WriteString
   CALL ReadInt
   mov [Oranges + ebx], ax
   add ebx, TYPE Oranges
Loop L1
Ret
GenerateArray ENDP

DisplayArray Proc
.data
MessageElement BYTE "Orange[", 0
MessageElement2 BYTE "]: ", 0
.code
mov ecx, LengthOfArray
mov ebx, 0
   CALL Clrscr
L2:
   mov edx, OFFSET MessageElement
   CALL WriteString
   mov eax, ebx
   CALL WriteInt
   mov edx, OFFSET MessageElement2
   Call WriteString
   movsx eax, [Oranges + ebx]
   Call WriteInt
   Call Crlf
   Add ebx, TYPE Oranges
Loop L2
ret
DisplayArray ENDP
end main
