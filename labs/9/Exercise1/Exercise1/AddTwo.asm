; Problem 1
; Write and run a program to find the values of each destination operand.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,0	; debug purpose only

	mov al, 01101111b
	and al, 00101101b
	;============================================
	;       01101111
	;       00101101
	;  AND -----------
	;       00101101
	; 
	;   AL = 0010 1101 (2Dh)
	;   ZF = 0
	;   SF = 0
	;============================================

	mov al,6Dh
	and al,4Ah
	;============================================
	; 6Dh = 0110 1101
	; 4Ah = 0100 1010
	;
	;       0110 1101
	;       0100 1010
	;  AND ------------
	;       0100 1000
	; 
	;   AL = 0100 1000 (48h)
	;   ZF = 0
	;   SF = 0
	;============================================

	mov al,00001111b
	or  al,61h
	;============================================
	; 61h =  0110 0001
	;
	;       0000 1111
	;       0110 0001
	;   OR -----------
	;       0110 1111
	;
	;   AL = 0110 1111 (6Fh)
	;   ZF = 0
	;   SF = 0
	;============================================

	mov al,94h
	xor al,37h
	;============================================
	; 94h = 1001 0100
	; 37h = 0011 0111
	;
	;       1001 0100
	;       0011 0111
	;  XOR -----------
	;       1010 0011
	;
	;   AL = 1010 0011 (A3Fh)
	;   ZF = 0
	;   SF = 1
	;============================================

	;=================================================================================
	;Did the value in al register change when and, or, and xor were used? Why? 
	;=================================================================================
	; Answer : Yes because AND,OR and XOR instructions performs a destructive operation
	;          on the destination operand.
	;=================================================================================

	invoke ExitProcess,0
main endp
end main