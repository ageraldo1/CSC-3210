; Write and run a program and answer the questions in the box
; Summing an Array (SumArray.asm)

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	intarray  DWORD 10000h,20000h,30000h,40000h
	myPointer DWORD intarray

.code

main proc

	;mov edi,OFFSET intarray			; 1: EDI = address of intarray
	mov edi,myPointer					; 1: EDI = address of intarray
	
	mov ecx,LENGTHOF intarray			; 2: initialize loop counter
	mov eax,0							; 3: sum = 0

	L1:									; 4: mark beginning of loop
		add eax,[edi]					; 5: add an integer
		add edi,TYPE intarray			; 6: point to next element
		loop L1							; 7: repeat until ECX = 0

	;=================================
	;    EAX = 00 0A 00 00
	;=================================

	;==========================================================================================
	; What will be the value of EAX if the square brackets around EDI register are removed?
	; 
	;    Memory addresses 
	;        step 0
	;           edi         :  
	;           eax         :
	;           mypointer   : 00 40 40 10
	;      
	;=============================================================================
	mov ecx,LENGTHOF intarray			; 2: initialize loop counter
	mov eax,0							; 3: sum = 0

	L2:									; 4: mark beginning of loop
		add eax,edi						; 5: add an integer
		add edi,TYPE intarray			; 6: point to next element
		loop L2							; 7: repeat until ECX = 0

	; +--------------------+--------------+-------------+
	; | step | eax         |  edi         | mypointer   |
	; -------+-------------+--------------+-------------+
	; |   0  | 00 00 00 00 | 00 40 40 10  | 00 40 40 10 |
	; +------+-------------+--------------+-------------+
	; |   1  | 00 40 40 10 | 00 40 40 14  | 00 40 40 10 |
	; +------+-------------+--------------+-------------+
	; |   2  | 00 80 80 24 | 00 40 40 18  | 00 40 40 10 |
	; +------+-------------+--------------+-------------+
	; |   3  | 00 C0 C0 3C | 00 40 40 1C  | 00 40 40 10 |
	; +------+-------------+--------------+-------------+
	; |   4  | 01 01 00 58 | 00 40 40 20  | 00 40 40 10 |
	; +------+-------------+--------------+-------------+

	;=================================
	;    EAX = 01 01 00 58
	;=================================
		

	invoke ExitProcess,0
main endp
end main