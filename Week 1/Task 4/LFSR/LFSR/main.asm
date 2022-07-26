;.INCLUDE "M328PBDEF.INC"
;RJMP START
;NOP

;.dseg; Data segment
;.org 0x100;start from location 0x100
;loc : .BYTE 0x100 ;start from location 0x100

;.cseg

;start:
;	CLR r1
;	CALL nextlfsr
;	ldi YH, high(loc)
;	ldi YL, low(loc)

;	ST Y,R16

;.EQU LFSR=0x19;
.;EQU TAPS=0xB4;
;nextlfsr:
;	PUSH R17
;	LDS R16, LFSR
;	LDI R17,0
;	SBRC R16,0
;	LDI R17,TAPS
;	LSR R16
;	EOR R16,R17
;	STS LFSR, R16
;	POP R17
;	RET

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
.equ TAPS = 0xB4
.equ lfsr=69
nextlfsr:
	push R17
	lds R16, lfsr
	ldi R17,0
	sbrc R16, 0
	ldi R17, TAPS
	lsr R16
	eor R16, R17
	sts lfsr, R16
	pop r17
	ret

;FillDecrements:
 ;   ldi Yh,high(loc)
 ;  ldi Yl,low(loc)
;	ldi R17,0
;	ldi R16,0
;	st; Y+,R16
;	FillLoop:
;	DEC R17
;	st y+,R17
;
;	DEC R16
;	brne FillLoop
;	ret
;	brne FillLoop
;	ret