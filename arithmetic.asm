TITLE Arithmetic Program

INCLUDE Irvine32.inc

; (insert macro definitions here)

; (insert constant definitions here)

.data

intro_1		BYTE	"Arithmetic Program ",0
prompt_1	BYTE	"Please enter 3 numbers A > B > C and I will calculate the sums and differences!", 10, 13, 0
n1_prompt	BYTE	"First number: ",0
num1		DWORD	?	; first number to be calculated
n2_prompt	BYTE	"Second number: ",0
num2		DWORD	?	; second number to be calculated
n3_prompt	BYTE	"Third number: ",0
plus		BYTE	" + ",0
equal		BYTE	" = ",0
minus		BYTE	" - ",0
num3		DWORD	?	; third number to be calculated
sum1		DWORD	?	; sum of first 2 numbers
dif1		DWORD	?	; difference of num1 and num2
sum2		DWORD	?	; sum of num1 and num3
dif2		DWORD	?	; difference of num1 and num3
sum3		DWORD	?	; sum of num2 and num3
dif3		DWORD	?	; difference of num2 and num3
sum4		DWORD	?	; sum of all numbers
goodbye		BYTE	10, 13, "Thank you for using my Arithmetic program! Goodbye for now.",0
_incorrect	BYTE	"Your number is not less than the number entered prior. Please try again.", 10, 13,0


.code
main PROC

; introduce program and myself

  mov	EDX, OFFSET	intro_1
  call	writeString
  call	CrLf

; get the user's numbers
  
 ; display prompt and get first number
 start:
  mov	EDX, OFFSET prompt_1
  call	WriteString
  mov	EDX, OFFSET n1_prompt
  call	WriteString
  call	ReadDec
  mov	num1, EAX

; get second number
secondnum:                
  mov	EDX, OFFSET n2_prompt
  call	WriteString
  call	ReadDec
  mov	num2, EAX

 ; check that 2nd number is < 1st number
  mov	EAX, num1
  cmp	EAX, num2
  JLE	incorrect        ; if less than, jump to incorrect label
  mov	num1, EAX
  jmp	thirdnum         ; proceed if # is less than prior #

; loop for when number is not less than # before
incorrect:
  mov	EDX, OFFSET _incorrect
  call	WriteString
  jmp	secondnum       ; loop back for user to enter again


; get third number
thirdnum:               ; loop if user enters a number greater than # before
  mov	EDX, OFFSET n3_prompt
  call	WriteString
  call	ReadDec
  mov	num3, EAX

 ; check that 3rd number is < 2nd number
  mov	EAX, num2
  cmp	EAX, num3
  JLE	incorrect2       ; if less than, jump to incorrect label
  mov	num2, EAX
  call	Crlf
  jmp	calculations     ; proceed if # is less than prior #
 
; loop for when number is not less than # before
incorrect2:              
  mov	EDX, OFFSET _incorrect
  call	WriteString
  jmp	thirdnum       ; loop back for user to enter again


; calculate the sums and differences
calculations:
 ; num1 + num2 
  mov	EAX, num1
  add	EAX, num2
  mov	sum1, EAX

 ; num1 - num2
  mov	EAX, num1
  sub	EAX, num2
  mov	dif1, EAX

 ; num1 + num3
  mov	EAX, num1
  add	EAX, num3
  mov	sum2, EAX

 ; num1 - num3
  mov	EAX, num1
  sub	EAX, num3
  mov	dif2, EAX

 ; num2 + num3
  mov	EAX, num2
  add	EAX, num3
  mov	sum3, EAX  
  
 ; num2 - num3
  mov	EAX, num2
  sub	EAX, num3
  mov	dif3, EAX

 ; num1 + num2 + num3
  mov	EAX, num1
  add	EAX, num2
  add	EAX, num3
  mov	sum4, EAX

; display the results

 ; num 1 + num 2 results
  mov	EAX, num1
  call	WriteDec
  mov	EDX, OFFSET plus
  call	WriteString
  mov	EAX, num2
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, sum1
  call	WriteDec
  call	Crlf

 ; num 1 - num 2 results
  mov	EAX, num1
  call	WriteDec
  mov	EDX, OFFSET minus
  call	WriteString
  mov	EAX, num2
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, dif1
  call	WriteDec
  call	Crlf

 ; num 1 + num 3 results
  mov	EAX, num1
  call	WriteDec
  mov	EDX, OFFSET plus
  call	WriteString
  mov	EAX, num3
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, sum2
  call	WriteDec
  call	Crlf

 ; num 1 - num 3 results
  mov	EAX, num1
  call	WriteDec
  mov	EDX, OFFSET minus
  call	WriteString
  mov	EAX, num3
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, dif2
  call	WriteDec
  call	Crlf

 ; num 2 + num 3 results
  mov	EAX, num2
  call	WriteDec
  mov	EDX, OFFSET plus
  call	WriteString
  mov	EAX, num3
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, sum3
  call	WriteDec
  call	Crlf

 ; num 2 - num 3 results
  mov	EAX, num2
  call	WriteDec
  mov	EDX, OFFSET minus
  call	WriteString
  mov	EAX, num3
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, dif3
  call	WriteDec
  call	Crlf

 ; sum of all nums results
  mov	EAX, num1
  call	WriteDec
  mov	EDX, OFFSET plus
  call	WriteString
  mov	EAX, num2
  call	WriteDec
  mov	EDX, OFFSET plus
  call	WriteString
  mov	EAX, num3
  call	WriteDec
  mov	EDX, OFFSET equal
  call	WriteString
  mov	EAX, sum4
  call	WriteDec
  call	Crlf


; goodbye message
  mov	EDX, OFFSET goodbye
  call	WriteString
  call	CrLf

	Invoke ExitProcess,0	; exit to operating system
main ENDP


END main
