; AddTwo.asm - adds two 32-bit integers.
; Exercise 3 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	add al, 20     ; EAX = 00 00 00 14
	add ax, 30     ; EAX = 00 00 00 32

	mov eax, 1
	mov ebx, eax

	invoke ExitProcess,0
main endp
end main