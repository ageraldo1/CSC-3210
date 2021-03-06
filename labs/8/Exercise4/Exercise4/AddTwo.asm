; Exercise 4
; Write and run a program and answer the questions in the box.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	temp dword ?

.code
main proc

	mov eax, 0
	mov ecx,10			; outer loop counter
	
	L1:
		mov eax,3
		mov temp,ecx
		mov ecx,5		; inner loop counter

		L2:
			add eax,5
			loop L2			; repeat inner loop
		
		mov ecx, temp
		loop L1 ; repeat outer loop

		;===============================
		;  First : Trace ECX, EAX
		;===============================
		;  +---------+--------+--------+
		;  | EAX     | ECX	  | temp   |
		;  +---------+--------+--------+
		;  |  0d     |  10d   |  0d    |
		;  +---------+--------+--------+
		;  |  3d     |  5d    |  10d   |
		;  +---------+--------+--------+
		;  |  8d     |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  10d   |        |
		;  +---------+--------+--------+
		;  |         |  9d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  9d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  9d    |        |
		;  +---------+--------+--------+
		;  |         |  8d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  8d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  8d    |        |
		;  +---------+--------+--------+
		;  |         |  7d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  7d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  7d    |        |
		;  +---------+--------+--------+
		;  |         |  6d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  6d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  6d    |        |
		;  +---------+--------+--------+
		;  |         |  5d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  5d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  5d    |        |
		;  +---------+--------+--------+
		;  |         |  4d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  4d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  4d    |        |
		;  +---------+--------+--------+
		;  |         |  3d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  3d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  3d    |        |
		;  +---------+--------+--------+
		;  |         |  2d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  2d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  2d    |        |
		;  +---------+--------+--------+
		;  |         |  1d    |        |
		;  +---------+--------+--------+
		;  |   3d    |  5d    |  1d    |
		;  +---------+--------+--------+
		;  |   8d    |  4d    |        |
		;  +---------+--------+--------+
		;  |  13d    |  3d    |        |
		;  +---------+--------+--------+
		;  |  18d    |  2d    |        |
		;  +---------+--------+--------+
		;  |  23d    |  1d    |        |
		;  +---------+--------+--------+
		;  |  28d    |  0d    |        |
		;  +---------+--------+--------+
		;  |         |  1d    |        |
		;  +---------+--------+--------+
		;  |         |  0d    |        |
		;  +---------+--------+--------+

		;==============================================================
		;  Second : If we removed mov ecx, temp, What will happen?
		;==============================================================
		mov eax, 0
		mov ecx,10			; outer loop counter
		mov temp,0
	
		;L3:
		;	mov eax,3
		;	mov temp,ecx
		;	mov ecx,5		; inner loop counter
		;
		;	L4:
		;		add eax,5
		;		loop L4			; repeat inner loop
		;
		;	;removing this line -> mov ecx, temp
		;	loop L3 ; repeat outer loop

        ;=============================================
		; Infinity loop issue : loop never ends.
		; LOOP 
		;    - Subtract one from ECX
		;    - Check if ECX is zero
		;
		; +---------+--------+--------+
		; | EAX     | ECX	 | temp   |
		; +---------+--------+--------+
		; |  0d     | 10d    |  0d    |
		; +---------+--------+--------+
		; |  3d     |  5d    |  10d   |
		; +---------+--------+--------+
		; |  8d     |  4d    |        |
		; +---------+--------+--------+
		; |  13d    |  3d    |        |
		; +---------+--------+--------+
		; |  18d    |  2d    |        |
		; +---------+--------+--------+
		; |  23d    |  1d    |        |
		; +---------+--------+--------+
		; |  28d    |  0d    |        |
		; +---------+--------+--------+
		; |         |  -1d   |        |
		; +---------+--------+--------+
		; |  3d     |  5d    |  -1d   |
		; +---------+--------+--------+
		; |  8d     |  4d    |        |
		; +---------+--------+--------+
		; |  13d    |  3d    |        |
		; +---------+--------+--------+
		; |  18d    |  2d    |        |
		; +---------+--------+--------+
		; |  23d    |  1d    |        |
		; +---------+--------+--------+
		; |  28d    |  0d    |        |
		; +---------+--------+--------+
		; |         |  -1d   |        |
		; +---------+--------+--------+
		; |  3d     |  5d    |  -1d   |
		; +---------+--------+--------+
		; Stopped the program at this point


		;==============================================================================
		;  Third : Replace mov temp,ecx with push exc and mov ecx, temp with pop ecx
		;=============================================================================
		mov eax, 0
		mov ecx,10			; outer loop counter
		mov temp,0
	
		L5:
			mov eax,3
			push ecx		;mov temp,ecx
			mov ecx,5		; inner loop counter

			L6:
				add eax,5
				loop L6			; repeat inner loop
		
			pop ecx				;mov ecx, temp
			loop L5 ; repeat outer loop


	invoke ExitProcess,0
main endp
end main