;
; Test of explicitly and implicitly sized operands
;
start:
	add esi,2			; Implicit
	add esi,123456h			; Implicit
	add esi,byte 2			; Explicit
	add esi,dword 2			; Explicit
	add esi,dword 123456h		; Explicit
	add esi,byte 123456h		; Explicit Truncation

	add esi,strict 2		; Implicit Strict
	add esi,strict 123456h		; Implicit Strict
	add esi,strict byte 2		; Explicit Strict
	add esi,strict dword 2		; Explicit Strict
	add esi,strict dword 123456h	; Explicit Strict
	add esi,strict byte 123456h	; Explicit Strict Truncation
;
; Same thing with branches
;
	jmp short start			; Explicit
	jmp near start			; Explicit
	jmp word start			; Explicit
	jmp dword start			; Explicit
	jmp short forward		; Explicit
	jmp near forward		; Explicit
	jmp word forward		; Explicit
	jmp dword forward		; Explicit
%ifdef ERROR
	jmp short faraway		; Explicit (ERROR)
%endif
	jmp near faraway		; Explicit
	jmp word faraway		; Explicit
	jmp dword faraway		; Explicit
	jmp start			; Implicit
	jmp forward			; Implicit
	jmp faraway			; Implicit

	jmp strict short start		; Explicit Strict
	jmp strict near start		; Explicit Strict
	jmp strict word start		; Explicit Strict
	jmp strict dword start		; Explicit Strict
	jmp strict short forward	; Explicit Strict
	jmp strict near forward		; Explicit Strict
	jmp strict word forward		; Explicit Strict
	jmp strict dword forward	; Explicit Strict
%ifdef ERROR
	jmp strict short faraway	; Explicit (ERROR)
%endif
	jmp strict near faraway		; Explicit Strict
	jmp strict word faraway		; Explicit Strict
	jmp strict dword faraway	; Explicit Strict
	jmp strict start		; Implicit Strict
	jmp strict forward		; Implicit Strict
	jmp strict faraway		; Implicit Strict
forward:

	times 256 nop
faraway:


