; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,1
	mov ecx,6
	L1:
         add eax,1
         dec ecx
         mov ebx,ecx
         loop L1

	invoke ExitProcess,0
main endp
end main