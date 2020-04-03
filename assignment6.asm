INCLUDE Irvine32.inc

.data
myArr DWORD 10 DUP(?)
menuPrompt BYTE "Please make a selection:",0ah,0dh,"1. Manually Enter Values",0ah,0dh,"2: Randomly Generate Values",0ah,0dh,"3. Find Minimum Value",0ah,0dh,"4. Find Maximum Value",0ah,0dh,"5. Find Median Value",0ah,0dh,"6. Print Array",0ah,0dh,"7. Sort Array",0ah,0dh,"8. Quit",0ah,0dh,"Enter an option:",0
inputPrompt BYTE "Enter an integer:",0
outputPrompt BYTE "Array values:",0
errorPrompt BYTE "Invalid selection!",0

.code
main PROC
	
SELECT:		
			mov		edx, OFFSET menuPrompt
			call	WriteString
			call	ReadInt
			cmp		eax, 1
			je		OPTION1		; Manually Enter Values
			cmp		eax, 2
			je		OPTION2		; Randomly Generate Values
			cmp		eax, 3
			je		OPTION3		; Find Minimum Value
			cmp		eax, 4
			je		OPTION4		; Find Maximum Value
			cmp		eax, 5
			je		OPTION5		; Find Median Value
			cmp		eax, 6
			je		OPTION6		; Print the Array
			cmp		eax, 7
			je		OPTION7		; Sort the Array
			cmp		eax, 8
			je		OPTION8		; Exit
			jmp		ERROROPT


OPTION1:	mov		esi, TYPE myArr
			mov		ecx, LENGTHOF myArr
			call	OPT1PROC
			jmp		SELECT

OPTION2:	mov		esi, TYPE myArr
			mov		ecx, LENGTHOF myArr
			call	OPT2PROC
			jmp		SELECT

OPTION3:	call	OPT3PROC

OPTION4:	call	OPT4PROC

OPTION5:	call	OPT5PROC

OPTION6:	mov		esi, TYPE myArr
			mov		ecx, LENGTHOF myArr
			call	OPT6PROC

OPTION7:	call	OPT7PROC

ERROROPT:	mov		edx, OFFSET errorPrompt
			call	WriteString
			jmp		SELECT

OPTION8:	exit



;	call	DumpRegs			; display the registers
	exit
main ENDP
OPT1PROC PROC
L1:
	mov		edx, OFFSET inputPrompt
	call	WriteString
	call	ReadInt
	mov		[myArr + esi], eax
	add		esi, TYPE myArr
	loop	L1
ret

OPT1PROC ENDP

OPT2PROC PROC
call	Randomize
L2:
	mov		[myArr + esi], RandomRange
	add		esi, TYPE myArr
	loop L2
ret

OPT2PROC ENDP

OPT3PROC PROC

ret

OPT3PROC ENDP

OPT4PROC PROC

ret

OPT4PROC ENDP

OPT5PROC PROC

ret

OPT5PROC ENDP

OPT6PROC PROC
mov		edx, OFFSET outputPrompt
call	WriteString
call	Crlf
L6:
	mov		eax,[myArr + esi]
	call	WriteDec
	call	Crlf
	add		esi, TYPE myArr
	loop	L6
ret
OPT6PROC ENDP

OPT7PROC PROC

ret

OPT7PROC ENDP

END main
