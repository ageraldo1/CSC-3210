;======================================================================================
; Lab 4 - Assignment 2
;
; HEX digit -> 4 bits
; AH | AL   -> 8 bits
; AX        -> 16 bits
; EAX       -> 32 bits   ( 4 bytes * 8 positions)  // VS debug : Hexa representation
;
;
;   Status Flags :
;        add and sub affect all six flags
;        inc and dec affect all but the carry flag
;        mov, push, and pop do not affect any flags
;
;	    CFLAGS : 
;			OV (overflow) = 0 
;			PL (signal)   = 1 
;			ZR (zero)     = 0 
;			CY (carry)    = 0 
;======================================================================================

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myByte BYTE 10001111b              ; 1000 1111 => 143d 

.code
main proc
	mov eax, 0;
	mov ebx, 0;
	
	movzx ax, myByte;
	;==================================================================================================
	; Question 1 : What is the value in ah register and why? (3P)
	;
	; Answer     : MOVZX instruction fills (extends) the upper half of the destination with zeros.
	;            : AX (16 bits)
	;            :		VALUE BEFORE : 0000 0000 0000 0000
	;            :		VALUE AFTER  : 0000 0000 1000 1111
	;            : 0x8F or 143d
	;
	; Notes      : MOVZX <zeros|dest>
	;==================================================================================================

	movsx bx, myByte
	;==================================================================================================
	; Question 2a : What is the value in bh register and why? (3P)
	;
	; Answer      : MOVSX instruction fills the upper half of the destination with a copy of the source operand's sign bit.
	;             : BX (16 bits)
	;             :		VALUE BEFORE : 0000 0000 0000 0000
	;             :		VALUE AFTER  : 1111 1111 1000 1111
	;             : 0xFF8F or 65423d
	;
	; Notes       : MOVSX <zeros|dest>
	;==================================================================================================

	inc bx	             ;Increment an operand by one.
	;==================================================================================================
	; Question 2b : What is the value of the zero flag (ZR) and why? (2p)
	;
	; Answer      : Zero Flag changed from 1 to 0 because INC instruction affect all flags except the carry flag
	;
	;             : BX (16 bits)
	;             :		VALUE BEFORE : 1111 1111 1000 1111
	;             :		VALUE AFTER  : 1111 1111 1000 1111
	;             : 0xFF90 or 6542d
	;==================================================================================================

	sub al, myByte
	inc al
	;==================================================================================================
	; Question 3 : What is the value of the zero flag (ZR) and why? (2p)
	;
	; Answer     : The zero flag changed from zero to 1 because INC instruction changes the status flag.
	;            : AL (8 bits)
	;            :		VALUE BEFORE      : 1000 1111
	;            :      VALUE AFTER (sub) : 0000 0000
	;            :		VALUE AFTER (inc) : 0000 0001
	;==================================================================================================

	mov al, myByte
	add al, 256-10001111b     ; (256 - 143 = 113) => add 143 + 113 = 256 (out of range)
	;==================================================================================================
	; Question 4a : What is the value of the carry flag (cy) and why? (3p)
	;
	; Answer     : Out of range. AL processor can represent values between [-128 => 127] and [0, 255]
	;
	;            : EFLAGS
	;                    OV = 0, ZR = 1, CY = 1 
	;
	;            :     143d    1000 1111
	;                  113d    0111 0001
	;                         ------------
	;                       1| 0000 0000
	;                       |
	;                       +----------------------- carry bit
	;                    
	;            : AL (8 bits)
	;            :		VALUE BEFORE      : 0000 0001
	;            :      VALUE AFTER (mov) : 1000 1111
	;            :		VALUE AFTER (add) : 0000 0000
	;
	;==================================================================================================

	inc al
	;==================================================================================================
	; Question 4b : What is the value of the overflow flag (ov)? (2p)
	;
	; Answer      : Overflow is 0 because the value on AL was increased by one and the register can represent the value
	;            : AL (8 bits)
	;            :		VALUE BEFORE      : 0000 0000
	;            :      VALUE AFTER (inc) : 0000 0001
	;==================================================================================================

	mov al, myByte   ; ( 143d)
	add al, myByte   ; ( 143d + 143d = 286d -> out of range)
	;==================================================================================================
	; Question 5 : What is the value of the overflow flag (ov)? (3p)
	;
	; Answer     : Out of range. AL processor can represent values between [-128 => 127] and [0, 255]
	;
	;            : EFLAGS
	;                    OV = 1, ZR = 0, CY = 1 
	;
	;            :     143d       1000 1111
	;                  143d       1000 1111
	;                 ------     ------------
	;                  286d    1| 0001 1110
	;                          |
	;                          +----------------------- carry bit
	;                    
	;            : AL (8 bits)
	;            :		VALUE BEFORE      : 0000 0001
	;            :      VALUE AFTER (mov) : 1000 1111
	;            :		VALUE AFTER (add) : 0001 1110   (30d => 1E)
	;
	;==================================================================================================

	invoke ExitProcess,0
main endp
end main