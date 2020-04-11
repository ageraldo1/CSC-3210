; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov edx,1
	mov al,7Fh
	cmp ax,80h
	jl L1
	mov edx,0
	L1:

	invoke ExitProcess,0
main endp
end main