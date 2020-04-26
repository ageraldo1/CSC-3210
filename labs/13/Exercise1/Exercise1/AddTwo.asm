; Exercise 1 - Floating-Point Processing
; Write and run the program to find the value of valD.
; valD = -valA + (valB * valC)

.386
.model flat,stdcall
.stack 4096

ExitProcess proto,dwExitCode:dword

.data
	valA	REAL8	1.5
	valB	REAL8	2.5
	valC	REAL8	3.0
	valD	REAL8	?

.code
main proc
	fld	valA		; ST(0) valA
	fchs			; change sign of ST(0)
	fld valB		; load valB into ST(0)
	fmul valC		; ST(0) *= valC
	fadd			; ST(0) += ST(1)
	fstp valD		; store ST(0) to valD

	invoke ExitProcess,0
main endp
end main