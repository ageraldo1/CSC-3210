; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	wordVal    	WORD	1000h,2000h,3000h,4000h,13
	dwordVal  	DWORD	34567890h, 90785634h, 11223344h
	pntr        DWORD	dwordVal 

	myBytes		BYTE 10h,20h,30h,40h
	myWords		WORD 3 DUP(?),2000h
	myString	BYTE "ABCDE"
	mych		WORD "AW", "WA",0

	myBytes2	BYTE 10h,20h,30h,40h
	myWords2	WORD 8Ah,3Bh,72h,44h,66h
	myDoubles	DWORD 1,2,3,4,5

	myvar2 DWORD 3 DUP(0), 000002ABh


.code
main proc
	mov eax,0
	mov al, 0F0h
	cmp al, 14h

	ja mylabel
	inc al
	jmp next
	mylabel:
		add al, 4
	next:
	invoke ExitProcess,0
main endp
end main