TITLE assignment7

; INSTRUCTIONS:
;	In this assignment, you will implement a Bubble Sort using higher level directives. 
;	 - You should create a random array of 20 32-bit values; this should be a procedure. - DONE
;	 - You should implement a BubbleSort procedure that will be responsible for sorting your values using the Bubble Sort algorithm. 
;	 - Your program should prompt the user if they would like to repeat the process of generating a random set of values, output the values, 
;	 - call the bubble sort procedure, 
;	 - and then output the array again.
;	 - use the higher level directives of .WHILE, .IF, .REPEAT, etc. 


INCLUDE Irvine32.inc

.data
myArr	DWORD	20 DUP(?)
prompt1	BYTE	"Do you want to run Bubble Sort on another random array?",0Ah,0Dh,"1 = YES | 0 = NO",0Ah,0Dh,0
hello	BYTE	"Welcome to Bubble Sort in Assembly!",0ah,0dh,"Generating initial random array...",0Ah,0Dh,0
bye		BYTE	"Goodbye!",0
print1	BYTE	"Unsorted Array:",0Ah,0Dh,0
print2	BYTE	"Sorted Array:",0Ah,0Dh,0

.code
main PROC
	mov		EDX, OFFSET hello
	call	WriteString
	.REPEAT
		; RANDOMIZE ARRAY
		call	RandomizeArray

		; PRINT UNSORTED ARRAY
		mov		EDX, OFFSET print1
		call	WriteString
		call	PrintArray

		; BUBBLE SORT ARRAY
		call	BubbleSort

		; PRINT SORTED ARRAY
		mov		EDX, OFFSET print2
		call	WriteString
		call	PrintArray

		; PROMPT TO RUN AGAIN
		mov		EDX, OFFSET prompt1
		call	WriteString
		call	ReadInt
	.UNTIL EAX == 0
	mov		EDX, OFFSET bye
	call	WriteString
	exit

main ENDP

RandomizeArray PROC
	mov	ESI, 0
	mov	ECX, LENGTHOF myArr
	LR:
		mov		EAX, 1000	
		call	RandomRange
		mov		[myArr + ESI], EAX
		add		ESI, TYPE myArr
		loop	LR
	ret
RandomizeArray ENDP

PrintArray PROC
	mov	ESI, 0
	mov	ECX, LENGTHOF myArr
	LP:
		mov 	EAX, [myArr + ESI]
		call	WriteDec
		call	Crlf
		add		ESI, TYPE myArr
		loop	LP
	ret
PrintArray ENDP

BubbleSort PROC
	mov		ESI, 0
	mov		ECX, LENGTHOF myArr
	LB:
		mov		EAX, [myArr + ESI]
		cmp		EAX, [myArr + ESI + TYPE myArr]
		jge		SWAPVAL
		CONT:
		add		ESI, TYPE myArr

		loop	LB
	ret
	SWAPVAL:
		xchg	EAX, [myArr + ESI + TYPE myArr]
		jmp		CONT
BubbleSort ENDP
END main
