; Exercise1.asm - calculate the sum of 3, 50, 12, 11,40, 88 (32-bit integers).
; Exercise 1 - Lab
; 3 + 50 + 12 + 11 + 40 + 88 = 
;     dec : 204
;     hex : CC
;     bin : 1100 1100
;
;     opcode <destination> <source>
;
;     AH | AL = 8 bits         ( 0->255 )
;     AX      = 16 bits        ( 0-> 65,536)
;     EAX     = 32 bits        ( 0-> 4,294,967,296)

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.code
main proc
	mov eax,0            ; clear

	mov	al,3		     		
	add	al,50            ; 0 | 0 | 0 | 1
	add	al,12
	add	al,11
	add	al,40
	add	al,88

	;EFLAGS
	;    OV = Overflow
	;    CY = Carry Flag	
	;    PL = Signal Flag
	;    ZR = Zero Flag
	
	; 1 | 0 | 1 | 0

	invoke ExitProcess,0
main endp
end main