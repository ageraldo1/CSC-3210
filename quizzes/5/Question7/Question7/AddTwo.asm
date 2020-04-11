; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val1	DWORD 10
	x	    DWORD ?


.code
main proc
	mov	eax,0	; debug
	mov ebx,0   ; debug
	mov ecx,0   ; debug
	mov edx,0	; debug

	mov ecx, 5
	mov edx, 1

	cmp val1, ecx
	jle part2

	cmp ecx,edx
	jle part2

	mov x,1
	jmp next

	part2:
		mov x,2

	next:




	invoke ExitProcess,0
main endp
end main