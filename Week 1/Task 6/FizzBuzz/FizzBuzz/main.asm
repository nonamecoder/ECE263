;assuming r25 is where remainder is stored.



;;Notes:
;; 1. First check if it is divisible by 15, if so, break and return the remainder to isDiv15.
;; 2. Check if it is divisible by 5, if so, break and return to the remainder to isDiv5
;; 3. Check if it is divisible by 3, if so, break and return the remainder to isDiv3.
;; 4. Else, break and return remainder to any of the routines mentioned above.
;;IMPORTANT: Ensure that it is written in this order. Checks both conditions first, then one by one



;;main section
;iterate through memory here
;store value of number at register
;;pass value to isDiv15, isDiv5, isDiv3
;;



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



;; Subroutines for dividing

Try