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
opInput	BYTE	?
fstNum	DWORD	?
sndNum	DWORD	?
prompt0	BYTE	"Enter a mathematical operation: +, -, /, *, n!, 2^n",0dh,0ah,0
prompt1 BYTE	"Enter the first number:",0dh,0ah,0
prompt2	BYTE	"Enter the second number:"

.code
main PROC
	
	call DumpRegs
	exit
main ENDP
END main
