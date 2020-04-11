; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov al,0D4h
	ror al,3 				; a.

	mov al,0D4h
	rol al,7 				; b.

	stc
	mov al,0D4h
	rcl al,1 				; c.

	stc
	mov al,0D4h
	rcr al,3 				; d.


	invoke ExitProcess,0
main endp
end main