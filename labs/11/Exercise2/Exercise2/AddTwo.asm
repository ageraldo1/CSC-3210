; Exercise 2
; Understand how to declare and call a procedure and use external procedures

Include Irvine32.inc 

.386
;.model flat,stdcall
.stack 4096

ExitProcess proto,dwExitCode:dword

.code
main proc
	mov ebx, 1431
	mov ecx, 63

	call AddTwo
	call WriteInt
	call Crlf

	invoke ExitProcess,0
main endp

AddTwo proc
	mov eax, 0
	add eax, ebx
	sub eax, ecx

	ret
AddTwo endp

end main