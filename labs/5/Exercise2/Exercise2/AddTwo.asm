; AddTwo.asm - adds two 32-bit integers.
; Exercise 2
; 2 + 4 + 8 + 10 + 12 + 14 =
;
;     50d
;     0x32
;
;  2  4  8  10  12  14
;  |  |  |  |   |   |___ 10
;  |  |  |  |   |_______ 8
;  |  |  |  |___________ 6
;  |  |  |______________ 4
;  |  |_________________ 2
;  |____________________ 0


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myList   WORD 1 DUP(2, 4, 8, 10, 12, 14)
	W_SIZE   EQU 2

.code
main proc
	mov eax, 0h	        ; debug purpose only
	mov ebx, 0h         ; OFFSET Accumulator

	mov ax, myList[bx]  ; first element

	add bx, W_SIZE      ; bx = 2 (4)
	add ax, myList[bx]  ; 2 + 4 = 6

	add bx, W_SIZE      ; bx = 4 (8)
	add ax, myList[bx]  ; 6 + 8  = 14

	add bx, W_SIZE      ; bx = 6 (10)
	add ax, myList[bx]  ; 14 + 10  = 24

	add bx, W_SIZE      ; bx = 8 (12)
	add ax, myList[bx]  ; 24 + 12  = 36

	add bx, W_SIZE      ; bx = 10 (14)
	add ax, myList[bx]  ; 36 + 14  = 50

	mov myList[bx], ax  ; Store the result in the list-element position 6

	invoke ExitProcess,0
main endp
end main