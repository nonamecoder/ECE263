;assuming r24 is where num is stored.

;;Subroutines
Div3:
;r24= store r25%3
cpi r25,0 ;compare branch value to constant 0
breq fizz; branch if r25=3

Div5:
;r24= store r25%5
cpi r25,0 ;compare branch value to constant 0
breq fizz; branch if r25=5

Div15:
;Numbers that are divisible by 3 and 5 are always divisible by 15
;r24= store r25%15
cpi r25,0;compare branch value to constant 0
breq fizzbuzz; branch

fizz:
;replace with F(0x46)

