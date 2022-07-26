.INCLUDE "M328PBDEF.INC"
RJMP start
NOP


.dseg; Data segment
.org 0x100;start from location 0x100
loc : .BYTE 0x100 ;start from location 0x100


.cseg


;;Notes:
;assuming r25 is where remainder is stored.
;; 1. First check if it is divisible by 15, if so, break and return the remainder to isDiv15.
;; 2. Check if it is divisible by 5, if so, break and return to the remainder to isDiv5
;; 3. Check if it is divisible by 3, if so, break and return the remainder to isDiv3.
;; 4. Else, break and return remainder to any of the routines mentioned above.
;;IMPORTANT: Ensure that it is written in this order. Checks both conditions first, then one by one



;;main section
;iterate through memory here
;store value of number at register
;;pass value to isDiv15, isDiv5, isDiv3
;; R28 AND R29 can be used for counting with Y flag
start:
	CLR r1

	;;test divider
	LDI R16, 90 ; DIVIDEND
	LDI R17, 3  ; DIVISOR
	CALL Divide  
	;READ R15 TO GET REMAINDER, WILL BE 0 IF DIVISIBLE.
	; READ R16 TO GET RESULT

rjmp start


;;Subroutines
IsDiv3:
;r24= store r25%3
cpi r25,0 ;compare branch value to constant 0
breq fizz; branch if r25 is divisible by 3

IsDiv5:
;r24= store r25%5
cpi r25,0 ;compare branch value to constant 0
breq buzz; branch if r25 is divisible by 5

IsDiv15:
;Numbers that are divisible by 3 and 5 are always divisible by 15
;r24= store r25%15
cpi r25,0;compare branch value to constant 0
breq fizzbuzz; branch if r25 divisible by 15(both 3 and 15)

fizz:
;replace with F(0x46)

buzz:
;replace with b(0x62)

fizzbuzz:
;replace with g(0x67)



;; Divider code below

 Divide:
		;***************************************************************************
		;*
		;* "div8u" - 8/8 Bit Unsigned Division
		;*
		;* This subroutine divides the two register variables "dd8u" (dividend) and
		;* "dv8u" (divisor). The result is placed in "dres8u" and the remainder in
		;* "drem8u".
		;*
		;* Number of words	:14
		;* Number of cycles	:97
		;* Low registers used	:1 (drem8u)
		;* High registers used  :3 (dres8u/dd8u,dv8u,dcnt8u)
		;*
		;***************************************************************************

		;***** Subroutine Register Variables

		.def	drem8u	=r15		;remainder
		.def	dres8u	=r16		;result
		.def	dd8u	=r16		;dividend
		.def	dv8u	=r17		;divisor
		.def	dcnt8u	=r18		;loop counter

		;***** Code

		div8u:	sub	drem8u,drem8u	;clear remainder and carry
			ldi	dcnt8u,9	;init loop counter
		d8u_1:	rol	dd8u		;shift left dividend
			dec	dcnt8u		;decrement counter
			brne	d8u_2		;if done
			ret			;    return
		d8u_2:	rol	drem8u		;shift dividend into remainder
			sub	drem8u,dv8u	;remainder = remainder - divisor
			brcc	d8u_3		;if result negative
			add	drem8u,dv8u	;    restore remainder
			clc			;    clear carry to be shifted into result
			rjmp	d8u_1		;else
		d8u_3:	sec			;    set carry to be shifted into result
			rjmp	d8u_1


		