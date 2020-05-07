;----------------------------------------------------------------------------+
TITLE assignment                                                             |
;                                                                            |
;                                                                            |
;----------------------------------------------------------------------------+

INCLUDE Irvine32.inc

.data
mInput BYTE "Input a value for M:",0
nInput BYTE "Input a value for N:",0
.code
main PROC
	mov EDX, OFFSET mInput
	call WriteString
	call ReadInt
	mov EBX, EAX

	mov EDX, OFFSET nInput
	call WriteString
	call ReadInt

	call BetterRandomRange

    exit
main ENDP
BetterRandomRange PROC
mov ECX, 50
L1:
	call RandomRange
	.IF EAX < EBX
		add EAX, EBX
	.ENDIF
	call WriteDec
	call Crlf
	loop L1
ret
BetterRandomRange ENDP
END main
