TITLE My first assembly program

INCLUDE Irvine32.inc
.data
message BYTE "Eric Lee",0dh,0ah,0


.CODE
main PROC
mov edx, offset message
Call WriteString
Exit

main ENDP

END main

