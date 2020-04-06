INCLUDE Irvine32.inc

.data
;myArr		DWORD	10 DUP(?)
myArr		DWORD	5,22,33,44,55,66,77,88,99,100,101
sortArr		DWORD	10 DUP(?)
minVal		DWORD	?
maxVal		DWORD	?
tmpVal		DWORD	?
menuPrompt	 BYTE	"Please make a selection:",0ah,0dh,"1. Manually Enter Values",0ah,0dh,"2: Randomly Generate Values",0ah,0dh,"3. Find Minimum Value",0ah,0dh,"4. Find Maximum Value",0ah,0dh,"5. Find Median Value",0ah,0dh,"6. Print Array",0ah,0dh,"7. Sort Array",0ah,0dh,"8. Quit",0ah,0dh,"Enter an option:",0
inputPrompt	 BYTE	"Enter an integer:",0
outputPrompt BYTE	"Array values:",0
errorPrompt	 BYTE	"Invalid selection!",0
minPrompt	 BYTE	"Minimum:",0
maxPrompt	 BYTE	"Maximum:",0

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


OPTION1:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT1PROC
			jmp		SELECT

OPTION2:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT2PROC
			jmp		SELECT

OPTION3:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT3PROC
			jmp		SELECT

OPTION4:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT4PROC
			jmp		SELECT

OPTION5:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT5PROC
			jmp		SELECT

OPTION6:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT6PROC
			jmp		SELECT

OPTION7:	mov		esi, 0					; Iterator index  - ESI
			mov		ecx, LENGTHOF myArr		; Length of array - ECX
			call	OPT7PROC
			jmp		SELECT

ERROROPT:	mov		edx, OFFSET errorPrompt
			call	WriteString
			call	Crlf
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

L2:
	mov		eax, 200			; Ceiling value
	call	RandomRange			; Generate random value
	cmp		eax, 100			; Check if random value is over 100
	jl		FLOOR				; Move to LABEL to add 100 to the random value
	jg		MOVETOARR			; Continue and enter random value into array
	MOVETOARR:
	mov		[myArr + esi], eax	; Add to array
	add		esi, TYPE myArr		; Incremement iterator
	loop L2
ret
FLOOR:
			add		eax, 100
			jmp		MOVETOARR
OPT2PROC ENDP

OPT3PROC PROC
mov		ebx, [myArr + esi]
jmp		START
L3:
	add		esi, TYPE myArr
	START:
	mov		edx, [myArr + esi]
	cmp		ebx, edx
	jge		EBXgtEDX
	loop	L3
mov		eax, ebx
mov		edx, OFFSET minPrompt
call	WriteString
call	WriteDec
call	Crlf

ret

EBXgtEDX:
	xchg	ebx, edx
	jmp		L3
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
