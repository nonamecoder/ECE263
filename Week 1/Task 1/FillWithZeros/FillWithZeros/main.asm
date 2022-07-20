;
; FillWithZeros.asm
;
; Created: 7/20/2022 12:49:12 PM
; Author : Ayyappan
;


; Replace with your application code
.INCLUDE "M328PBDEF.INC"
RJMP START
NOP

.dseg; Data segment
.org 0x100;start from location 0x100
loc : .BYTE 0x100 ;start from location 0x100

.cseg

start:
	CLR r1
	LDI r16, 0
	ldi YH, high(loc)
	ldi YL, low(loc)

	ST Y,R16

FillZeros:
    ldi Yh,high(loc)
    ldi Yl,low(loc)
	ldi R17,0
	ldi R16,0
	st Y+,R16
	FillLoop:
	st y+,R17

	dec R16
	brne FillLoop
	ret
		

