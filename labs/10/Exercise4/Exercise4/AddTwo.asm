; Problem 4
; Multiplication and Division Instructions
;
; var3 = (var1 * -var2) / (var3 – ebx)
; var3 = (-2 * -20) / (2 - 0)
; var3 = 40 / 2
; var3 = 20

.386
.model flat,stdcall
.stack 4096
	ExitProcess proto,dwExitCode:dword

.data
	var1	SDWORD	-2
	var2	SDWORD	20
	var3	SDWORD	2

.code
main proc
	mov eax,0		; debug purpose only
	mov ebx,0		; debug purpose only
	mov edx,0		; debug purpose only

	;=====================================================
	; (var1 * -var2)
	;=====================================================
	mov eax,var1
	mov edx,var2
	neg edx				;-var2
	imul edx			; left side: EDX:EAX
	;=====================================================
	; EAX : 00 00 00 28		(40d)
	; EDX : 00 00 00 00
	;=====================================================

	;=====================================================
	; (var3 – ebx)
	;=====================================================
	mov ecx,var3
	sub ecx,ebx			;	ECX : 00 00 00 02

	idiv ecx			; EAX = quotient
	mov var3,eax
	;=====================================================
	; var3 : 00 00 00 14	(20d)
	;=====================================================

	invoke ExitProcess,0
main endp
end main