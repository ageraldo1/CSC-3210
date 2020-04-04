; Exercise 1
; Shift and Rotate Instructions

.386
.model flat,stdcall
.stack 4096
	ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax, 0	;debug purpose only

	;========================================================
	;  D4 = 1101 0100  (212d)
	;  shr (logical shift right) (division)
	;  expected value = 212/2 = 106
	;========================================================
	mov al, 0D4h
	shr al,1
	;========================================================
	; AL = 0110 1010 (6Ah) (106d)
	; CF = 0
	; OF = 1  (signal changed from negative to positive)
	;========================================================
	;Overflow flag 
	;	- clear : sign bit retains its original value
	;	- set   : sign changes
	;========================================================

	sar al,1
	;========================================================
	; SAR (arithmetic - duplicate sign bit)
	; AL = 0011 0101 (35h) (53d)
	; CF = 0
	; OF = 0  (signal sign bit retains its original value)
	;========================================================

	mov al,0D4h
	sar al,4
	;========================================================
	; D4 = 1101 0100 (-44d)
	; AL = 1111 1101 (FDh) (-3d)
	; CF = 0
	; OF = 0  (signal sign bit retains its original value)
	;========================================================
	
	mov al,0D4h
	rol al,1
	;========================================================
	; D4 = 1101 0100 
	; AL = 1010 1001 (A9) 
	; CF = 1
	; OF = 0  
	;========================================================
	
	ror al,3
	;========================================================
	; AL = 0011 0101 (35h) 
	; CF = 0
	; OF = 0  
	;========================================================

	invoke ExitProcess,0
main endp
end main