; Calculating the size of the String
; Lab 6

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myString byte "This is a very long string made by your instructor to test how $ works in this lab hope you will like it"
	myString_length = ($ - myString)

	asize = SIZEOF myString

.code
main proc
	mov eax,0h
	mov ebx,0h

	mov al, myString_length
	mov bl, asize
	;========================================
	; myString
	;      len : 104
	; EAX
	;    00 00 00 68 (hex) => 104d
	;
	; EBX
	;    00 00 00 68 (hex) => 104d
	;============================================
	; $ => counts white space and does not count null terminator
	; double check using SIZEOF operator (EBX)
	; SIZEOF : The SIZEOF operator returns the number of bytes used by an array initializer.
	;=============================================

	invoke ExitProcess,0
main endp
end main