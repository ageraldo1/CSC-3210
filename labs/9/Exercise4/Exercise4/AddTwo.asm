; Problem 4
; Write and run a program to translate the following while and if statements

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	sum			DWORD 0
	sample		DWORD 50
	array		DWORD 10,60,20,33,72,89,45,65,72,18
	ArraySize = ($ - Array) / TYPE array

.code
main proc
	mov eax, 0			;sum
	mov edx, sample
	mov esi, 0
	mov ecx, ArraySize

	L1:
		cmp esi, ecx			; if esi < ecx
		jl L2
		jmp L5
	L2:
		cmp array[esi*4], edx	; if array[esi] > edx
		jg L3
		jmp L4
	L3:
		add eax,array[esi*4]
	L4:
		inc esi
		jmp L1
	L5:
		mov sum, eax

	;==========================
	; SUM = (166h) (358d)
	;
	;      +----+
	;      | 66 |
	;      +----+
	;      | 01 |
	;      +----+
	;      | 00 |
	;      +----+
	;      | 00 |
	;      +----+
	;				66 01 00 00
	;==========================	

	invoke ExitProcess,0
main endp
end main