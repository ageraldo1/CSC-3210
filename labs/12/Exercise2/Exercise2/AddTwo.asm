; Problem 2
; Write and run the following program. Will the program crash? Why?

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax, 0					;debug purpose only

	call example1
	;=======================================================
	; 1. push offset of next instruction on the stack
	; 2. copies the address of the called procedure into EIP
	;=======================================================
	
	add al, 1

	invoke ExitProcess,0
main endp

example1 proc
	push 6
	push 5

	call AddTwo
	;=======================================================
	; 1. push offset of next instruction on the stack
	; 2. copies the address of the called procedure into EIP
	;=======================================================

	ret

example1 endp

AddTwo proc
	push ebp		; backup ebp 
		mov ebp, esp

		mov eax, [ebp+12]
		add eax, [ebp+8]
	pop ebp			; restore ebp

	ret 8
	;===================================
	;  pops top of the stack into EIP
	;  add 8 to esp
	;===================================
AddTwo endp

end main