; Exercise 2 - Floating-Point Processing
; Write and run the program to find the value of valD.
; valD = (valA - valB) * valC

.386
.model flat,stdcall
.stack 4096

ExitProcess proto,dwExitCode:dword

.data
	valA	REAL8	12.5
	valB	REAL8	6.5
	valC	REAL8	4.2
	valD	REAL8	?

.code
main proc
	fld	valA		; ST(0) valA
	fsub valB		; ST(0) -= valB
	fmul valC       ; ST(0) *= valC
	fstp valD		; store ST(0) to valD

	invoke ExitProcess,0
main endp
end main