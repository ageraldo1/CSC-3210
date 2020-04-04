; Problem 2
; Multiplication and Division Instructions
; var4 = (var1 * 5) / (var2 – 3)
; var4 = (40 * 5) / (13 -3)
; var4 = 200 / 10
; var4 = 20

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1 DWORD 40		; 28h	
	var2 DWORD 13		; 0Dh
	var4 DWORD ?		
	
.code
main proc
	mov eax,0		; debug purpose only
	mov ebx,0		; debug purpose only
	mov edx,0		; debug purpose only

	;==========================
	; (var1 * 5)
	;==========================
	mov eax, var1
	mov ebx, 5
	mul ebx
	;==========================
	; 40 * 5 = 200d
	;	EDX = 00 00 00 00
	;   EAX = 00 00 00 C8
	;==========================
	
	;==========================
	; (var2 -3)
	;==========================
	sub var2, 3		;var2 = 0A
	
	mov ebx, var2
	div ebx

	mov var4, eax
	;=========================
	; var4 = 00 00 00 14 (20d)
	;=========================


	invoke ExitProcess,0
main endp
end main