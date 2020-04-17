; Problem 3
; What will happen to the Factorial program’s output when you try to calculate 13! and why? How did you know?

INCLUDE Irvine32.inc 

.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	push 13
	call Factorial
	call WriteDec
	call Crlf
	exit

main endp

Factorial proc

	push ebp
	mov ebp, esp

	mov eax, [ebp+8]
	cmp eax,0
	ja L1
	mov eax, 1
	jmp L2

	L1:
		dec eax
		push eax
		call Factorial

	ReturnFact:
		mov ebx, [ebp+8]
		mul ebx

	L2:
		pop ebp
		ret 4
Factorial endp
end main