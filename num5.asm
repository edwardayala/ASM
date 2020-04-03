INCLUDE Irvine32.inc

.data
valX sbyte 16		;default:1
valY sbyte ?		;valY = 5*valX
valZ sbyte ?		;valZ = 2*valX
finalVal sbyte ?	;finalVal = 2*X + 3*Y - Z

.code
main PROC
	; clear registers
	sub eax,eax
	sub ebx,ebx
	sub ecx,ecx

	; initialize Y
	add bh,valX
	add bh,valX
	add bh,valX
	add bh,valX
	add bh,valX
	mov valY,bh ; valY = 5*valX
	
	; initialize Z
	add ch,valX
	add ch,valX
	mov valZ,ch	; valZ = 2*valX

	; calculate finalVal
	mov ah,valX
	add ah,valX	; 2*X
				; +
	add ah,valY	
	add ah,valY
	add ah,valY	; 3*Y
				; -
	sub ah,valZ	; Z
	
	mov finalVal,ah

	call	DumpRegs			; display the registers


	exit
main ENDP
END main