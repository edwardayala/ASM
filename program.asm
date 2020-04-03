INCLUDE Irvine32.inc

; 4. Write a program that will take the values of a DWORD array: 12h, 34h, 56h, 78h, 9Ah, BCh, DEh, F0h and reverse them.

.data
array DWORD 12h, 34h, 56h, 78h, 9Ah, 08Ch, 0DEh, 0F0h		; Initialize array
reverse DWORD 8 DUP(?)										; Uninitialized array

.code
main PROC
	; Clear registers
	mov eax, 0
	mov ebx, 0
	mov esi, 0
	mov edi, 0
	mov esi, OFFSET array									; First element address to ESI
	mov edi, OFFSET array + SIZEOF array - TYPE array		; Last element address to EDI
	mov ecx, LENGTHOF array / 2								; Counter
	L1:							
		mov eax, [esi]										; Move element [ESI] to EAX
		mov ebx, [edi]										; Move element [EDI] to EBX
		xchg eax,ebx										; Swap the two elements
		mov [esi], eax										; Next element
		mov [edi], ebx										; Next element
		add esi, TYPE array									; Increment index
		sub edi, TYPE array									; Decrement index
		loop L1	
	call DumpRegs
	exit
main ENDP
END main



; 3. Write a program that will:
;   a. Create an array of bytes containing the values: 12h, 34h, 56h, 78h, 9Ah, BCh, DEh, F0h
;   b. Loop over the array and compute the sum in the EAX register. Note: the array contains bytes and you convert the bytes in the array to a 32-bit value before performing the sum.
;   c. Show the contents of the EAX and ECX register at each iteration of the loop.
;.data
;array BYTE 12h, 34h, 56h, 78h, 9Ah, 08Ch, 0DEh, 0F0h		; a. Create an array of bytes
;newline BYTE 0ah
;character BYTE 0ah,"EAX:"

;.code
;main PROC
;	mov esi, OFFSET array
;	mov esi, 0					; esi is index, start with 0
;	mov ecx, LENGTHOF array		; set ecx to number of elements
;	mov eax,0					; set accumulator to zero
;	L1:
;		movzx ebx, [array + esi]
;		add eax, ebx			; b. Loop over the array and compute the sum in the EAX register.
;		inc esi
;		mov edx, OFFSET character
;		call WriteString
;		call WriteInt
;		loop L1
;	call	DumpRegs			; display the registers
;	exit
;main ENDP
;END main



; 2. Write a program that will sum an array of 32-bit integers. After creating the array in the .data segment, follow these steps:
;   a. Assign the array's address to a register that will serve as an indexed operand.
;   b. Initialize the loop counter to the length of the array
;   c. Assign zero to the register that accumulates the sum.
;   d. Create a label to mark the beginning of the loop.
;   e. In the loop body, add a single array element to the sum.
;   f. Point to the next array element.
;   g. Use a loop instruction to repeat the loop.
;.data
;array DWORD 1,2,3,4,5,6,7,8,9	; initializing the array
;
;.code
;main PROC
;	mov esi, OFFSET array		; a. Assign the array's address to a register
;	mov ecx, LENGTHOF array		; b. Initialize the loop counter to the length of the array.
;	mov eax, 0					; c. Assign zero to the register that accumulates the sum.
;	L1:							; d. Create a label to mark the beginning of the loop
;		add eax, [esi]			; e. In the loop body, add a single array element to the sum.
;		add esi, TYPE array		; f. Point to the next array element.
;		loop L1					; g. Use a loop instruction to repeat the loop.
;
;	call	DumpRegs			; display the registers
;	exit
;main ENDP
;END main


; 1. Write a count controlled loop that will iterate N times and compute the sum Rval = 1 + 2 + ... + N. Insert a call DumpRegs statement to display the contents of the registers. Make sure to describe what is happening at each step of the program.
;.data
;Rval BYTE 1,2,3,4,5,6,7,8,9		; initializing the array
;
;.code
;main PROC
;	mov esi, OFFSET Rval
;	mov esi, 0					; esi is index - start with 0
;	mov ecx, LENGTHOF Rval		; set ecx to number of elements in array
;	mov eax, 0					; set accumulator to 0
;	L1:
;		movzx ebx, [Rval + esi]	; move value at [index] to ebx
;		add eax, ebx			; add value to accumulator
;		inc esi					; increment the index
;		loop L1					; repeat loop
;	call	DumpRegs			; display the registers
;	exit
;main ENDP
;END main