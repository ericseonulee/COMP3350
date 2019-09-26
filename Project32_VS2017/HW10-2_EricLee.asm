TITLE HW10-2_EricLee.asm
INCLUDE Irvine32.inc

.data
       source BYTE "Eric Lee", 0
	   sourceMsg BYTE "Souce: ", 0
       target BYTE SIZEOF source DUP(0)
	   targetMsg BYTE "Target: ", 0
.code
	MAIN PROC
		mov esi,0          
		mov ecx,SIZEOF source       

		L1:
			mov al,source[esi]       
			mov target[esi],al   
			inc esi              
			loop L1  
			mov edx, OFFSET sourceMsg
			call WriteString
			mov edx, OFFSET source
			call WriteString
			call Crlf
			mov edx, OFFSET targetMsg
			call WriteString
			mov edx, OFFSET target
			call WriteString
			CALL Crlf
	exit
MAIN ENDP
END MAIN
