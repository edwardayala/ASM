; SubTwoPairs.asm - adds two pairs of 32-bit integers, then subtracts the pairs.

INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
varA sdword ?	; Create uninitialized variable A (ex:4)
varB sdword ?	; Create uninitialized variable B (ex:3)
varC sdword ?	; Create uninitialized variable C (ex:2)
varD sdword ?	; Create uninitialized variable D (ex:1)
				;						ex:(4+3)-(2+1)=4
.code
main proc
	mov	eax,varA	; Move var A into EAX
	add	eax,varB	; Add var B to EAX (A+B)
	mov ebx,varC	; Move var C to EBX
	add ebx,varD	; Add var D to EBX (C+D)
	mov ecx,eax		; Move (A+B) to ECX
	sub ecx,ebx		; Subtract (C+D) from ECX

	call DumpRegs

	invoke ExitProcess,0
main endp
end main