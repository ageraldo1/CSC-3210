; mov and xchg: rearrange the values to be 3,1,2, you could
; Lab 6

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	array DWORD 1,2,3
	;=========================================
	;	DWORD = 4 bytes
	;
	;     00   01  02    03
	;	+----+----+----+----+
	;	| 01 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     04   05   06   07
	;	+----+----+----+----+
	;	| 02 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     08   09   10   11
	;	+----+----+----+----+
	;	| 03 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;=========================================
	
.code
main proc
	mov eax,0h
	mov ebx,0h

	mov eax,array
	;===================
	; EAX = 00 00 00 01
	;               <==
	;===================

	xchg eax,[array+4]
	;==================================
	; BEFORE
	;    EAX       = 00 00 00 01
	;    [array+4] = 02 00 00 00
	;
	; AFTER
	;    EAX       = 00 00 00 02
	;    [array+4] = 01 00 00 00
	;==================================

	xchg eax,[array+8]
	;==================================
	; BEFORE
	;    EAX       = 00 00 00 02
	;    [array+8] = 03 00 00 00
	;
	; AFTER
	;    EAX       = 00 00 00 03
	;    [array+8] = 02 00 00 00
	;==================================
	
	xchg array,eax
    ;==================================
	; BEFORE
	;    EAX       = 00 00 00 03
	;    [array]   = 01 00 00 00
	;
	; AFTER
	;    EAX     = 00 00 00 01
	;    [array] = 03 00 00 00
	;==================================

	;==================================
	;           RESULT   
	; 
	;     00   01  02    03
	;	+----+----+----+----+
	;	| 03 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     04   05   06   07
	;	+----+----+----+----+
	;	| 01 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     08   09   10   11
	;	+----+----+----+----+
	;	| 02 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;=========================================

	;====================================================================
	; FIX = exchange array[8], array[4]
	;    XCHG mem1, mem2   ; Illegal, can't exchange memory locations!
	;===================================================================
	xchg eax,[array+4]
	xchg eax,[array+8]
	xchg eax,[array+4]

	;==================================
	;      RESULT AFTER FIX
	; 
	;     00   01  02    03
	;	+----+----+----+----+
	;	| 03 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     04   05   06   07
	;	+----+----+----+----+
	;	| 02 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;
	;     08   09   10   11
	;	+----+----+----+----+
	;	| 01 | 00 | 00 | 00 |
	;	+----+----+----+----+
	;=========================================
	
	invoke ExitProcess,0

main endp
end main