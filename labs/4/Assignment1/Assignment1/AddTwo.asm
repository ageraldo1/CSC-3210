; Lab 4 - Assignment 1
; opcode <destination> <source>

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
	
	mov	bl, 94d		; 8 bits  (0x5E)
	mov cl, 64d		; 8 bits  (0x40)
	mov dl, 31d		; 8 bits  (0X1F)

	add cl, bl		; 94  + 64 = 158 (0x9E)	
	sub cl, dl		; 158 - 31 = 127 (0x7F)

	mov al, cl      ; 127 = (0x7F)

	COMMENT !
	    CFLAGS : 
			OV (overflow) = 1 
			PL (signal)   = 0 
			ZR (zero)     = 0 
			CY (carry)    = 0 
	!

	invoke ExitProcess,0
main endp
end main