; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,0h
	mov	al,80h				
	sub	al,01h				

	invoke ExitProcess,0
main endp
end main