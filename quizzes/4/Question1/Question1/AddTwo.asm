; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myBytes BYTE 10h,20h,30h,40h
	myWords WORD 8Ah,3Bh,72h,44h,66h
	myDoubles DWORD 1,2,3,4,5
.code
main proc
	mov eax, 13		;debug purpose only
	mov ebx, 0		;debug purpose only
	mov ecx, 0		;debug purpose only

		

 

	invoke ExitProcess,0
main endp
end main