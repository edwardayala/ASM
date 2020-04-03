INCLUDE Irvine32.inc

.data
;str1 BYTE "Assembly language is not easy!",0			; Example 2
;str1 BYTE "Assembly language is not easy!",0Dh,0Ah,0	; Example 2a
;IntVal DWORD 42										; Example 3
;fileName BYTE 80 DUP(0)								; Example 4
;str1 BYTE "Color output is cool!",0					; Example 6
prompt BYTE "Enter an integer:",0						; Short Program
output1 BYTE "SUM:",0									; Short Program
output2 BYTE "Array values:",0							; Short Program
inputArr DWORD 10 DUP(0)								; Short Program

.code
main PROC
;	Example 1
;	call	Clrscr				; Clear screen
;	mov		eax, 300			; Move 300 (ms) into EAX
;	call	Delay				; Delay for 500ms (from EAX)
;	call	DumpRegs			; Display the registers

;	Example 2
;	mov	edx, OFFSET str1		; Move index of str1 into EDX
;	call	WriteString			; Output value from EDX
;	call	Crlf				; New line

;	Example 2a
;	mov	edx, OFFSET str1		; Move index of str1 into EDX
;	call	WriteString			; Output value from EDX

;	Example 3
;	mov		eax,IntVal			; Move IntVal(35) into EAX
;	call	WriteBin			; Output IntVal(35) in Binary
;	call	Crlf				; New line
;	call	WriteDec			; Output IntVal(35) in Decimal
;	call	Crlf				; New line
;	call	WriteHex			; Output IntVal(35) in Hexadecimal
;	call	Crlf				; New line
	
;	Example 4
;	mov		edx, OFFSET fileName	; Move index of fileName into EDX
;	mov		ecx, SIZEOF fileName - 1; Move data size of fileName into ECX
;	call	ReadString	

;	Example 5
;	mov		ecx, 5			; Loop counter
;	L1:
;		mov		eax,50		; Ceiling value
;		call	RandomRange ; Generate random int
;		call	WriteInt	; Output signed int
;		call	Crlf		; New line
;		loop	L1			; Repeat loop

;	Example 6
;	mov		eax, yellow + (blue * 16)	; Move color value into EAX
;	call	SetTextColor				; Set text color
;	mov		edx, OFFSET str1			; Move index of str1 into EDX
;	call	WriteString					; Output string
;	call	Crlf						; New line

;	Short Program
	mov		ebx, OFFSET inputArr		; Move index of inputArr into EDX
	mov		ecx, LENGTHOF inputArr		; Length of array
	mov		esi, TYPE inputArr			; Iterator  
;	INPUT LOOP
	L1:
		mov		edx, OFFSET prompt		; Move offset of output text
		call	WriteString				; Display 'Enter an integer:'
		call	ReadInt					; Input integer
		mov		[inputArr + esi], eax	; Move input into inputArr
		add		esi, TYPE inputArr		; Iterate to next array position
		loop	L1						; LOOP
	
	call	Crlf						; New line
	mov		edx, OFFSET output2			; Move offset of output text
	call	WriteString					; Display 'Array values:'
	call	Crlf						; New line
;	OUTPUT LOOP
	mov		ebx, OFFSET inputArr		; Move offset of inputArr into EDX
	mov		esi, TYPE inputArr			; Iterator
	mov		ecx, LENGTHOF inputArr		; Length of array
	mov		edx, 0						; Set edx to 0
	L3:
		mov		eax, [inputArr + esi]	; Move array value into EAX
		call	WriteDec				; Display array value
		call	Crlf					; New line
		add		esi, TYPE inputArr		; Iterate
		loop	L3						; LOOP
	
	call	Crlf						; New line
	mov		edx, OFFSET output1			; Move offset of output text
	call	WriteString					; Display 'SUM:'
	call	SumProc						; Call Sum Process
	
	exit
main ENDP

SumProc	PROC
		mov		ebx, OFFSET inputArr	; Move offset of inputArr to EBX
		mov		esi, TYPE inputArr		; Iterator
		mov		ecx, LENGTHOF inputArr	; Length of array
		mov		edx, 0					; Set EDX to 0
		L2:
			add		edx, [inputArr + esi]	; Add array value to EDX
			add		esi, TYPE inputArr		; Iterate
			loop	L2						; LOOP
		mov		eax, edx					; Move EDX value to EAX
		call WriteDec						; Display sum
		ret									; Return to main
	SumProc ENDP

END main