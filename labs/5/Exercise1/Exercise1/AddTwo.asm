; AddTwo.asm - adds two 32-bit integers.
; Lab 5 - Exercise 1
; EAX = Xval + (Yval - Zval) + 10h

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	Xval SDWORD 26d     ; 0x1A
	Yval DWORD  30d     ; 0x1E
	Zval DWORD  40d     ; 0x28

.code
main proc
	mov eax,0h          ;debug purpose only
	
	mov eax, Yval       ; 0x1E      
	sub eax, Zval       ; FF FF FF F6  => FF due to two complements (30 - 40 = -10)
	;===============================
	; (Yval - Zval)
	; 
	; 1E - 28 = Two complement
	;     a) subtract FF
	;           FF
	;        -  28
	;          ====
	;           D7
	;
	;      b) add one
	;           D7
	;           +1
	;          ====
	;           D8
	;      c) Sum both numbers
	;           1E
	;         + D8
	;          ====
	;           F6 
	;===============================

	add eax, Xval       ; 00 00 00 10  => (-10 + 26 = 16)
	add eax, 10h        ; 00 00 00 20  => (16 + 16 = 32)

	invoke ExitProcess,0
main endp
end main