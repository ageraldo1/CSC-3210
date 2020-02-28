; Exercise 3: Indirect memory access using OFFSET Operator and pointers

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myBytes		BYTE	10h,20h,30h,40h
	myWords		WORD	8Ah,3Bh,72h,44h,66h
	myDoubles	DWORD	1,2,3,4,5
	myPointer	DWORD	myDoubles

.code
main proc
	mov eax, 0		;debug purpose only
	mov ebx, 0		;debug purpose only
	mov ecx, 0		;debug purpose only

	mov esi,OFFSET myBytes
	;================================
	; myBytes addr : 00 40 40 00
	; esi          : 00 40 40 00 
	;================================
	
	;=====================================================
	; dereferencing esi on ecx for debug purpose only
	;=====================================================
	mov ecx, [esi] 

	;================================
	; ecx : 40 30 20 10
	;             AH AL
	;               AX
	;================================

	mov ax,[esi]		
	;=================================
	; a. AX = 20 10
	;=================================
	
	mov esi,myPointer	
	;=================================================================================================================
	; b. What is the difference between this memory access mode and direct offset operand
	; direct mode   : the address field refers directly to the memory location at which the data is stored. 
	; indirect mode : the address field refers to the register first, which is then directed to the memory location
	; Using inderect mode, we can access part of the data (line 55)
	;=================================================================================================================

	;=====================================================
	; dereferencing esi on ecx for debug purpose only
	;=====================================================
	mov ecx, [esi] 

	mov ax,[esi+6]
	;=======================================================================================================
	; myDoubles	DWORD	1,2,3,4,5
	;
	;  00  01  02  03  04   05 06  07  08  09  10  11  12  13  14  15   16  17  18  19 20
	; +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
	; | 01| 00| 00| 00| 02|00 |00 | 00|03 |00 |00 |00 |04 |00 |00 | 00|05 |00 |00 |00 |00 |
	; +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
	;                         |  AX   |
	; c. AX = 00 00
	;=====================================================================================================

	mov esi,OFFSET myWords
	;=====================================================
	; dereferencing esi on ecx for debug purpose only
	;=====================================================
	 mov ecx, [esi] 
	
	mov eax, [esi+2]
	;===============================================================
	; myWords WORD	8Ah,3Bh,72h,44h,66h
	;
	;  00  01  02  03  04   05 06  07  08  09  
	; +---+---+---+---+---+---+---+---+---+---+
	; | 8A| 00| 3B| 00| 72|00 |44 | 00|66 |00 |
	; +---+---+---+---+---+---+---+---+---+---+
    ;         |     EAX       |   
	;
	; EAX = 00 72 00 3B
	;===============================================================

	;===============================================================
	; ESI     = mov esi,OFFSET myWords
	; AX      = 00 3B
	; [esi]   = 00 3B 00 8A
	; myWords = 8a 00 3b 00 72 00 44 00 66 00
	;===============================================================
	mov [esi], ax		;uncomment the instruction, why this would not work?

	;========================================================================
	; myWords = 3b 00 3b 00 72 00 44 00 66 00
	;     It did work. The mov change the first element of the myWwords 
	;     array [8A] by the value the was  previously store on AX (3B)
	;======================================================================

	invoke ExitProcess,0
main endp
end main