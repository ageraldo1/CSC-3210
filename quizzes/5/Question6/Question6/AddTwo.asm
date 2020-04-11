; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,-30
	cmp eax,-50
	jg Target

	Target:


	invoke ExitProcess,0
main endp
end main