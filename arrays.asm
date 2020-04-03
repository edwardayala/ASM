TITLE Arrays         (arrays.asm)

; Creates arrays

INCLUDE Irvine32.inc

.data
val1     sword  -32768
;arr1	 dword	0:120
;arr2	 BYTE	'A', 'B', 'C', 'D', 'E'

.code
main PROC

call	val1

	exit
main ENDP
END main