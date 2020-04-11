; Exercise 1
; Understand how Stack, ESP, Push, and Pop work together

.386
.model flat,stdcall
.stack 4096
	ExitProcess proto,dwExitCode:dword

.data
	aName BYTE "Abraham Lincoln",0
	nameSize = ($ - aName) -1

.code
main proc
	
	mov ecx, nameSize
	mov esi, 0

	L1:
		movzx eax, aName[esi]	;get character
		push eax				;push on stack
		inc esi
		loop L1

	;Pop the name from the stack, in reverse, and store in the aName array
	mov ecx, nameSize
	mov esi, 0
	
	L2:
		pop eax
		mov aName[esi], al
		inc esi
		loop L2

	invoke ExitProcess,0
main endp
end main