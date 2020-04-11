; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc

	mov dx,0
	mov ax,222h
	mov cx,100h
	mul cx


	invoke ExitProcess,0
main endp
end main