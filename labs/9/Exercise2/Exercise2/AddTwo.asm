; Problem 2
; Write and run a program to find the values of each Flag value

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;================================
; CMP
;               ZF   CF
; dest < src    0    1 
; dest > src    0    0
; dest = src    1    0
;================================

.code
main proc
	mov eax, 0   ; debug purpose only
	mov ebx, 0   ; debug purpose only
	mov ecx, 0   ; debug purpose only

	mov al,00001111b
	test al,00000010b
	;============================================
	;       0000 1111
	;       0000 0010
	;  AND -----------
	;       0000 0010
	; 
	;   AL = 0000 1111 (0Fh)
	;   ZF = 0
	;   SF = 0
	;   CF = 0
	;============================================

	mov bl,00000110b    ;
	cmp bl,00000101b
	;============================================
	;   0000 0110 (6d)
	;   0000 0101 (5d) 
	;
	;   dest > src
	; 
	;   BL = 0000 0110 (06h)
	;   CF = 0
	;   ZF = 0
	;   SF = 0
	;============================================

	mov cl,00000101b
	cmp cl,00000111b
	;============================================
	;   0000 0101 (5d)
	;   0000 0111 (7d) 
	;
	;   dest < src
	; 
	;   CL = 0000 0101 (05h)
	;   CF = 0
	;   ZF = 0
	;   SF = 1		; result is negative
	;============================================

	;==========================================================================================
	; Q : Did the value in al, bl, cl register change when test and CMP were 
	;     used? Why?
	;
	; A : No, TEST and CMP instructions are nondestructive instructions operands (only affects eflags)
	;===========================================================================================

	invoke ExitProcess,0
main endp
end main