; Exercise 3 
; Write and run a program and answer the questions in the box.


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	intarray WORD 6000h,7000h,8000h,9000h,5000h,4000h

.code

main proc
	mov eax, 0						; debug purpose only

	mov edi,OFFSET intarray			; address of intarray
	mov ecx,LENGTHOF intarray		; loop counter
	mov ax,0						; zero the accumulator
	
	;==========================================================
	; EAX
	;==========================================================
	; step 1 -> 6000h + 7000h = D000h
	; step 2 -> D000h + 8000h = 5000h
	; step 3 -> 5000h + 9000h = E000h
	; step 4 -> E000h + 5000h = 3000h
	; step 5 -> 3000h + 4000h = 7000h
	;==========================================================

	L1:
		add ax,[edi]				; add an integer
		add edi,TYPE intarray		; point to next integer
		loop L1						; repeat until ECX = 0

    ;====================================================================================================
	; Change the lines of code highlighted in red so the addition start from most right element (4000h).
	;====================================================================================================
	mov edi,OFFSET intarray+10		; address of intarray starting on 4000h
	mov ecx,LENGTHOF intarray		; loop counter
	mov ax,0						; zero the accumulator
	mov ebx,0                       ; debug purpose only

	L2:
		mov ebx,[edi]               ; debug purpose only
		add ax,[edi]				; add an integer
		sub edi,TYPE intarray		; point to next integer
		loop L2						; repeat until ECX = 0

    ;====================================================================================================
	; Is the ZF flag set? Why
	; During the lab, we changed the code to add the array in reverse order. ZF flag wasn't set during 
	; the loop interation
	;====================================================================================================


	invoke ExitProcess,0
main endp
end main