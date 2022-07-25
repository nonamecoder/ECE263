;
; Bubble Sort.asm
;
; Created: 7/24/2022 10:01:08 PM
; Author : sabhi
;


  .equ	SIZE	= 199		;data block size
  .equ	TABLE_L	=$100		;Low SRAM address of first data element
  .equ	TABLE_H	=$00		;High SRAM address of first data element
                                    
  rjmp	RESET		;Reset Handle


  .def	A=r13		;first value to be compared
  .def	B=r14		;second value to be compared
  .def	cnt2=r15		;inner loop counter
  .def	cnt1=r16		;outer loop counter
  .def	endL=r17		;end of data array low address
  .def	endH=r18		;end of data array high address

  ; ***CODE GOES HERE AYYAPPAN***

     bubble:
                                    	mov	ZL,endL
                                    	mov	ZH,endH		;init Z pointer
                                    	mov	cnt2,cnt1	;counter2 <- counter1
                                    i_loop:	ld	A,Z		;get first byte, A (n)
                                    	ld	B,-Z		;decrement Z and get second byte, B (n-1)
                                    	cp	A,B		;compare A with B
                                    	brlo	L1		;if A not lower 
                                    	st	Z,A		;    store swapped
                                    	std	Z+1,B
                                    L1:	dec	cnt2
                                    	brne	i_loop		;end inner loop
                                    	dec	cnt1
                                    	brne	bubble		;end outer loop		
                                    	ret