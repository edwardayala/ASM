;----------------------------------------------------------------------------+
TITLE quiz 6                                                                 |
; Write a program that will prompt the user to enter a number.               |
; The program will determine whether or not the number is prime.             |
; Recall, a number is prime if it is only divisible by 1 and itself.         |
; Your output for each run of the program should be either:                  |
; "The number X is prime" or                                                 |
; "The number X is NOT prime".                                               |
;----------------------------------------------------------------------------+

INCLUDE Irvine32.inc

.data
input   DWORD   ?
prompt  BYTE    "Enter a number:",0
output  BYTE    "The number ",0
isPrime BYTE    " is prime.",0dh,0ah,0
ntPrime BYTE    " is NOT prime.",0dh,0ah,0

.code
main PROC
  ; INPUT PROMPT
  mov   EDX, OFFSET prompt
  call  WriteString
  call  ReadInt

  ; STORE INPUT
  mov   input, EAX

  ; CHECK IF PRIME
  .REPEAT
    mov   EBX, 2
    mov   EDX, 0
    mov   EAX, input
    mov   ECX, EBX
    div   ECX
	inc   EBX
	cmp   EDX, 0
	je    NOTPRIME
	jg    PRIME
  .UNTIL EBX == input-1

  NOTPRIME:
  mov   EDX, OFFSET output
  call  WriteString
  mov   EAX, input
  call  WriteDec
  mov   EDX, OFFSET ntPrime
  call  WriteString
  jmp   QUIT

  PRIME:
  mov   EDX, OFFSET output
  call  WriteString
  mov   EAX, input
  call  WriteDec
  mov   EDX, OFFSET isPrime
  call  WriteString
  jmp   QUIT

  QUIT:
  exit
main ENDP
END main
