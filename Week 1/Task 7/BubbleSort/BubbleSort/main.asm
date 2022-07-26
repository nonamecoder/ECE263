;
; BubbleSort.asm
;
; Created: 7/25/2022 10:53:22 PM
; Author : Ayyappan
;


; Replace with your application code
.include "M328PBDEF.INC"
.cseg
.org 0x00


ldi r19,$50
outloop:
ldi r26,00	;loading x pointer withthe value 0100
ldi r27,01
ldi r18,$50
inloop:
ld r16,x+	;loading the value pointed by x first to r16 and increment x
ld r17,x	;loading the value pointed by x to r17
cp r17,r16	;comparing between the first and second elements
brlt swp	; go to swap if less than
back:
dec r18
brne inloop
dec r19
brne outloop
end:
rjmp end

swp:
st x,r16
st -x,r17
inc r26
rjmp back