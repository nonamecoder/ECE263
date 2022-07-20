;
; FillIncrements.asm
;
; Created: 7/20/2022 12:54:10 PM
; Author : Ayyappan
;

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

FillIncrements:
    ldi Yh,high(loc)
    ldi Yl,low(loc)
	ldi R17,0
	ldi R16,0
	st Y+,R16
	FillLoop:
	INC R17
	st y+,R17

	DEC R16
	brne FillLoop
	ret
		

