; Problem 3
; Multiplication and Division Instructions
; var4 = (var1 * -5) / (-var2 / var3)
; var4 = (-2 * -5) / (-20 / 2)
; var4 = (10) / (-10)
; var4 = -1
;
;CDQ (convert doubleword to quadword) extends EAX into EDX

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1	SDWORD -2
	var2	SDWORD	20
	var3	SDWORD	2
	var4	SDWORD	?

.code
main proc
	mov eax,0		; debug purpose only
	mov ebx,0		; debug purpose only
	mov edx,0		; debug purpose only

	;=====================================================
	; (-var2 / var3);
	;=====================================================
	mov eax,var2		; EAX : 00 00 00 14
	neg eax				; EAX : FF FF FF EC	(-var2)

	cdq					; sign-extend dividend
	idiv var3			; EDX = remainder
	;=====================================================
	; EAX : FF FF FF F6		(-10d)
	; EDX : 00 00 00 00
	;=====================================================
	mov ebx,eax			; EBX = right side

	;=====================================================
	; (var1 * -5)
	;=====================================================
	mov eax,-5			; begin left side (EAX = FF FF FF FB)
	imul var1			; EAX = 00 00 00 0A

	idiv ebx			; final division
	mov var4,eax		; quotient
	;======================================================
	; var4 = FF FF FF FF	(-1d)
	;======================================================

	invoke ExitProcess,0
main endp
end main