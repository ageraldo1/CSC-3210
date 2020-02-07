; Lab 4 - Assignment 1
; opcode <destination> <source>
; unsigned operation

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,0h		; debug purpose only
	mov ebx,0h		; debug purpose only
	mov ecx,0h		; debug purpose only
	mov edx,0h		; debug purpose only
	
    mov bl, 94d     ; 8 bits  (0x5E)
	mov cl, 64d     ; 8 bits  (0x40)
	mov dl, 31d     ; 8 bits  (0X1F)

	add cl, bl		; 94  + 64 = 158 (0x9E)
	;==========================================
	;      94   =      0101 1110
	;    + 64   =  +   0100 0000
	;     ----       ------------
	;     158          1001 1110
	;   
	;     EFLAGS
	;			OV (overflow) = 1 
	;			PL (signal)   = 1 
	;			ZR (zero)     = 0 
	;			CY (carry)    = 0
	;
	; VS Output : OV = 1 UP = 0 EI = 1 PL = 1 ZR = 0 AC = 0 PE = 0 CY = 0 
	;==========================================

	sub cl, dl		; 158 - 31 = 127 (0x7F)
	;==========================================
	;     158   =      1001 1110
	;    - 31   =  +   1110 0001
	;     ----       ------------
	;     127        1|0111 1111
	;                   
	;     EFLAGS
	;			OV (overflow) = 1 
	;			PL (signal)   = 0 
	;			ZR (zero)     = 0 
	;			CY (carry)    = 1  ?? (VS CY = 0) 
	;
	; VS Output : OV = 1 UP = 0 EI = 1 PL = 0 ZR = 0 AC = 1 PE = 0 CY = 0 
	;==========================================

	mov al, cl      ; 127 = (0x7F)


	invoke ExitProcess,0
main endp
end main