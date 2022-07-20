;
; LFSR.asm
;
; Created: 7/20/2022 1:27:10 PM
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
	CALL nextlfsr
	ldi YH, high(loc)
	ldi YL, low(loc)

	ST Y,R16

.EQU LFSR=0x8;
.EQU TAPS=0xB4;
nextlfsr:
	PUSH R17
	LDS R16, LFSR
	LDI R17,0
	SBRC R16,0
	LDI R17,TAPS
	LSR R16
	EOR R16,R17
	STS LFSR, R16
	POP R17
	RET

FillDecrements:
    ldi Yh,high(loc)
    ldi Yl,low(loc)
	;ldi R17,0
	;ldi R16,0
	st Y+,R16
	FillLoop:
	CALL nextlfsr
	DEC R17
	st y+,R17

	DEC R16
	brne FillLoop
	ret