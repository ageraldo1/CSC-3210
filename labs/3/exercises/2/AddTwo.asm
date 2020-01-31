; Exercise2.asm - calculate the following: a = b + c – 7Fh
; a, b, and c are 16-bit registers and b=66h and c=50h
; Exercise 2 - Lab
;     b + c  
;         66h + 50h = B6
;     B6 - 7F 
;         37  => a
;         
;     dec : 55
;     hex : 37
;     bin : 0011 0111
;
;     opcode <destination> <source>
;
;     AH | AL = 8 bits
;     AX      = 16 bits
;     EAX     = 32 bits

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
v_result  dword ?
v_b  dword 66h
v_c  dword 50h
v_d  dword 7Fh

.code
main proc
	mov	eax,0             ; clear
	
	mov eax,v_b
	add eax,v_c
	sub eax,v_d
	mov v_result,eax

	;EFLAGS
	;    OV = Overflow
	;    CY = Carry Flag	
	;    PL = Signal Flag
	;    ZR = Zero Flag
	
	; 0 | 0 | 0 | 0

	invoke ExitProcess,0
main endp
end main