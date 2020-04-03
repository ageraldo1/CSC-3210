; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc

	mov eax,0
	mov ecx,10 ; outer loop counter
	L1:
		mov eax,3
		mov ecx,5 ; inner loop counter
	L2:
		add eax,5
		loop L2 ; repeat inner loop

	loop L1 ; repeat outer loop
 
	invoke ExitProcess,0
main endp
end main