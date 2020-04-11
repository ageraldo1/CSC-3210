; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov edx,1
	mov al,0FFh
	cmp eax,0A1h
	jl L2
	mov edx,0
	L2:


	invoke ExitProcess,0
main endp
end main