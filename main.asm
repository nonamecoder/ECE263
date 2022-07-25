;
; Bubble Sort.asm
;
; Created: 7/24/2022 10:01:08 PM
; Author : sabhi
;


  .cseg
  .org 0x00



  ldi r19,$09
  outer_loop:
  ldi r22, 00	;loading pointer a with value 0100
  ldi r23, 01
  ldi r18, $09   ; loading counter value 9 for inner loop

  inner_loop:
  ld r16,a+	; loading the value pointed by a to r16 and increment a
  ld r17,a
  cp r17,r16	; comparing the first and second elements
  brlt swp		; swap if less tham

  reset:
  dec r18
  brne inner_loop	;if branch != 0 to innerloop
  dec r19
  brne outer_loop

  end:
  rjmp end


  swp:
  st a,r17		;swap
  st -a,r17		; decremented the a value
  inc r22
  rjmp reset

