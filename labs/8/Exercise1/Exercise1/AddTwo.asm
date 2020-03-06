; Indirect Addressing & Indexed Operands
; Write and run a program to find the values of each destination operand:
; And define the memory access mode marked by *

.386
.model flat,stdcall
.stack 4096
	ExitProcess proto,dwExitCode:dword

.data
	myBytes   BYTE 10h,20h,30h,40h
	myWords	  WORD 8Ah,3Bh,72h,44h,66h
	myDoubles DWORD 1,2,3,4,5
	
	myPointer DWORD myDoubles
	;=============================================================================
	;    myBytes		myWords			myDoubles			
	;   
	;    +----+				+----+			+----+				
	;    | 10 |	00   	00  | 8A | 04    00	| 01 | 14           
	;    +----+				+----+			+----+				
	;    | 20 |	01   	01  | 00 | 05	 01	| 00 | 15			
	;    +----+				+----+			+----+				
	;    | 30 |	02		02	| 3B | 06	 02	| 00 | 16			
	;    +----+				+----+			+----+				
	;    | 40 |	03		03	| 00 | 07	 03	| 00 | 17			
	;    +----+				+----+			+----+				
	;					04	| 72 | 08	 04	| 02 | 18			
	;          				+----+			+----+				
	;          			05	| 00 | 09	 05	| 00 | 19			
	;          				+----+			+----+				
	;          			06	| 44 | 10	 06	| 00 | 20			
	;          				+----+			+----+				
	;          			07	| 00 | 11	 07	| 00 | 21			
	;          				+----+			+----+				
	;          			08	| 66 | 12	 08	| 03 | 22			
	;          				+----+			+----+				
	;          			09	| 00 | 13	 09	| 00 | 23			
	;          				+----+			+----+				
	;          							 10	| 00 | 24			
	;          			      				+----+				
	;          							 11	| 00 | 25			
	;          			      				+----+				
	;          							 12	| 04 | 26			
	;          			      				+----+				
	;          							 13	| 00 | 27			
	;          			      				+----+				
	;          							 14	| 00 | 28			
	;          			      				+----+				
	;          							 15	| 00 | 29			
	;          			      				+----+				
	;          							 16	| 05 | 30			
	;          			      				+----+				
	;          							 17	| 00 | 31			
	;          			      				+----+				
	;          							 18	| 00 | 32			
	;          			      				+----+				
	;          							 19	| 00 | 33			
	;          			      				+----+				
	;=============================================================================
	
	
.code
main proc
	mov eax,0				; debug purpose only

	mov esi,OFFSET myBytes
	mov al,[esi+5]          ; AL = 1 byte
	;==============================
	; AL = 00 
	;==============================

	mov al,[esi+14]         ; AL = 1 byte
	;==============================
	; AL   = 01
	; Mode = Indirect operand
	;==============================

	mov esi,OFFSET myWords + 2
	mov ax,[esi]			; AX = 2 bytes
	;==============================
	; AX = 00 3B
	;==============================

	mov edi,8
	mov edx, [myDoubles - 8]                  ; mov edx,[myDoubles - edi] - error compiling
	;==============================
	; EDX  = 00 72 00 3B 
	; Mode = Indirect Addressing
	;==============================

	mov edx, myDoubles[edi]
	;==============================
	; EDX  = 00 00 00 03 
	;==============================
	
	mov ebx,myPointer
	mov eax,[ebx+4]
	;==============================
	; EAX  = 00 00 00 02 
	; Mode = Indirect using pointers
	;==============================

	invoke ExitProcess,0
main endp
end main