; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	dVal DWORD 12345678h

.code
main proc
	mov eax, 0		;debug purpose only

	mov ax,3
	mov WORD PTR dVal+2 ,ax
	mov eax,dVal

	invoke ExitProcess,0
main endp
end main