;
; Task 1.asm
;
; Created: 7/12/2022 12:56:43 PM
; Author : sabhi
;

		.NOLIST
		.INCLUDE "M328PBDEF.INC"
                      
.org 0x100;start from location 0x100
	
			LDI R18,0x10   ;Load R18 with 0x00
			STS 0x100, R18 ;Load 0x100 location with R18