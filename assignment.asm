;----------------------------------------------------------------------------+
TITLE assignment 8                                                           |
;  1. Enter a mathematical operation: '+', '-', '/', '*', 'n!', '2^n'.       |
;  2. Request input for the first number.                                    |
;  3. Request input for the second number (if needed).                       |
;  4. Output the result of the operation.                                    |
;                                                                            |
;----------------------------------------------------------------------------+

INCLUDE Irvine32.inc

.data
opInput	DWORD	?
fstNum	DWORD	?
sndNum	DWORD	?
hello	BYTE	"Welcome to assembly calculator!",0dh,0ah,"Here are the types of operations available:",0dh,0ah,0
bye		BYTE	0dh,0ah,"Goodbye!",0dh,0ah,0
prompt0	BYTE	"1: +",0dh,0ah,"2: -",0dh,0ah,"3: /",0dh,0ah,"4: *",0dh,0ah,"5: n!",0dh,0ah,"6: 2^n",0dh,0ah,"Enter a mathematical operation: ",0
prompt1 BYTE	"Enter the first number: ",0
prompt2	BYTE	"Enter the second number: ",0
output	BYTE	"Result:",0

.code
main PROC
	; PRINT WELCOME MESSAGE
	mov     EDX, OFFSET hello
	call	WriteString

	; PRINT OPERATION PROMPT
	mov     EDX, OFFSET prompt0
	call	WriteString

	; INPUT OPERATION 
	call	ReadInt
	mov     opInput, EAX

	; MENU OPTIONS
	mov     EAX, opInput
	
	cmp		EAX, 1
	je      ADDITION

	cmp     EAX, 2
	je      SUBTRACTION
	
	cmp		EAX, 3
	je      DIVISION

	cmp     EAX, 4
	je      MULTIPLICATION
	
	cmp		EAX, 5
	je      FACTORIAL

	cmp     EAX, 6
	je      POWER

	ADDITION:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX

		; PROMPT 2ND INPUT
		mov     EDX, OFFSET prompt2
		call	WriteString

		; INPUT SECOND NUMBER
		call	ReadInt
		mov     sndNum, EAX

		; ADDITION
		mov     EAX, fstNum
		add     EAX, sndNum
		
		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT

	SUBTRACTION:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX

		; PROMPT 2ND INPUT
		mov     EDX, OFFSET prompt2
		call	WriteString

		; INPUT SECOND NUMBER
		call	ReadInt
		mov     sndNum, EAX

		; SUBTRACTION
		mov     EAX, fstNum
		sub     EAX, sndNum

		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT

	DIVISION:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX

		; PROMPT 2ND INPUT
		mov     EDX, OFFSET prompt2
		call	WriteString

		; INPUT SECOND NUMBER
		call	ReadInt
		mov     sndNum, EAX

		; DIVISION
		mov     EDX, 0
		mov     EAX, fstNum
		mov     ECX, sndNum
		div     ECX
		
		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT


	MULTIPLICATION:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX

		; PROMPT 2ND INPUT
		mov     EDX, OFFSET prompt2
		call	WriteString

		; INPUT SECOND NUMBER
		call	ReadInt
		mov     sndNum, EAX

		; MULTIPLICATION
		mov     EAX, fstNum
		mul     sndNum
		
		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT

	FACTORIAL:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX
		
		; FACTORIAL LOOP
		mov     ECX, fstNum
		mov		EAX, fstNum
		.REPEAT
			dec     ECX
			mul     ECX
		.UNTIL ECX == 1
		
		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT

	POWER:
		; PROMPT FIRST INPUT
		mov     EDX, OFFSET prompt1
		call	WriteString

		; INPUT FIRST NUMBER
		call	ReadInt
		mov     fstNum, EAX
		
		; POWER
		mov		ECX, EAX
		mov     EAX, 2
		mov     EBX, 2
		.REPEAT
			mul		EBX
			dec     ECX
		.UNTIL ECX == 1

		; OUTPUT RESULT
		mov     EDX, OFFSET output
		call	WriteString
		call	WriteDec

		call	QUIT

	QUIT:
		mov     EDX, OFFSET bye
		call	WriteString
		exit
main ENDP
END main
