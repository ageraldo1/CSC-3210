; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov al, 00001111b
	test al,00000010b 		; a. CF= ZF= SF=

	mov al,00000110b
	cmp al,00000101b 		; b. CF= ZF= SF=

	mov al,00000101b
	cmp al,00000111b 		; c. CF= ZF= SF=

	invoke ExitProcess,0
main endp
end main