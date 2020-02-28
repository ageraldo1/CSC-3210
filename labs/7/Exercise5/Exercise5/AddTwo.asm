; Exercise 5: Type, Length, & Sizeof Operators

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myBytes		BYTE 10h, 20h, 30h, 40h
	myWords		WORD 3 DUP(?), 2000h
	myString	BYTE "ABCDE"

.code
main proc

	mov eax, 0 ; debug purpose only
	mov eax,TYPE myBytes
	;==========================================
	; EAX = 00 00 00 01
	;==========================================
	
	mov eax, 0 ; debug purpose only
	mov eax, LENGTHOF myBytes
	;==========================================
	; EAX = 00 00 00 04
	;==========================================

	mov eax, 0 ; debug purpose only
	mov eax,SIZEOF myBytes
	;==========================================
	; EAX = 00 00 00 04
	;==========================================

	mov eax, 0 ; debug purpose only
	mov eax,TYPE myWords
	;==========================================
	; EAX = 00 00 00 02
	;==========================================

	mov eax, 0 ; debug purpose only
	mov eax,LENGTHOF myWords
	;==========================================
	; EAX = 00 00 00 04
	;==========================================

	mov eax, 0 ; debug purpose only
	mov eax,SIZEOF myWords
	;==========================================
	; EAX = 00 00 00 08
	;==========================================

	mov eax, 0 ; debug purpose only
	mov eax,SIZEOF myString
	;==========================================
	; EAX = 00 00 00 05
	;==========================================

	invoke ExitProcess,0
main endp
end main