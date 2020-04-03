INCLUDE Irvine32.inc

.data
myArray 	DWORD	5 DUP(?)
prompt1		BYTE	"Enter an Integer:",0
prompt2		BYTE	"SUM:",0
.code
main PROC
	call InProc
	call SumProc
	call OutProc
	exit
main ENDP
InProc PROC
	mov		ebx, OFFSET myArray
	mov		ecx, LENGTHOF myArray
	mov		esi, TYPE myArray
	L1:
		mov		edx, OFFSET prompt1
		call	WriteString
		call	ReadInt
		mov		[myArray + esi], eax
		add		esi, TYPE myArray
		loop L1
	ret
InProc ENDP

SumProc PROC
	mov		ebx, OFFSET myArray
	mov		esi, TYPE myArray
	mov		ecx, LENGTHOF myArray
	mov		edx, 0
	L2:
		add		edx, [myArray + esi]
		add		esi, TYPE myArray
		loop	L2
	ret
SumProc ENDP

OutProc PROC
	mov		eax, edx
	mov		edx, OFFSET prompt2
	call WriteString
	call WriteDec
	ret
OutProc ENDP
END main
