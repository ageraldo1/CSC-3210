; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myBytes BYTE 10h,20h,30h,40h
	myWords WORD 3 DUP(?),2000h
	myString BYTE "ABCDE"
 

.code
main proc
	mov eax, 0	;debug purpose only
	mov ebx, 0	;debug purpose only
	mov ecx, 0  ;debug purpose only

	mov eax,TYPE myBytes ; a.
	mov eax,LENGTHOF myBytes ; b.
	mov eax,SIZEOF myBytes ; c.
	mov eax,TYPE myWords ; d.
	mov eax,LENGTHOF myWords ; e.
	mov eax,SIZEOF myWords ; f.
	mov eax,SIZEOF myString ; g.

	invoke ExitProcess,0
main endp
end main