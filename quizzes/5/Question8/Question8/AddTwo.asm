; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov al,0D4h
	shr al,1 			; a.

	mov al,0D4h
	sar al,1 			; b.

	mov al,0D4h
	sar al,4 			; c.

	mov al,0D4h
	rol al,1 			; d.

	invoke ExitProcess,0
main endp
end main