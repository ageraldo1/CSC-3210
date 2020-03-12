; Problem 3
; Implement the following pseudocode in assembly language.
; 
;  if ( bl > cl)
;     al = 50
;  else
;      dl = 23
;      al = al - dl
;  end if

; bl > cl 
;	(dest > src)
;	ZF = 0, CF = 0
;			JA (if leftOp > rightOp)	; unsigned
;			JG (if leftOp > rightOp)	; signed 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax,0		; debug purpose only
	mov ebx,0		; debug purpose only
	mov ecx,0		; debug purpose only

	;==============================================
	; simulate : (bl > cl)
	;==============================================
	mov bl, 7
	mov cl, 3

	cmp bl,cl			; ZF = 0, CF = 0
	ja isGreater1		; jump to Greater if bl > cl

	mov dl, 23
	sub al, dl
	jmp end1
	

	isGreater1:
		mov al, 50

	end1:

	;==============================================
	;  AL = 32h	(50d)
	;==============================================

	;==============================================
	; simulate : (bl < cl) 
	;==============================================
	mov bl, 7
	mov cl, 30

	cmp bl,cl			; ZF = 0, CF = 0
	ja isGreater2		; jump to Greater if bl > cl

	mov dl, 23
	sub al, dl
	jmp end2

	isGreater2:
		mov al, 50

	end2:

	
	;==============================================
	;  AL = 1Bh	(27d)
	;==============================================


	invoke ExitProcess,0
main endp
end main