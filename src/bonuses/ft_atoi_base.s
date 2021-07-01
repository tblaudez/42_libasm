; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_atoi_base.s                                     :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/17 11:47:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/17 11:47:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_atoi_base
extern _ft_strlen

; int ft_atoi_base(char *str, char *base)
_ft_atoi_base:
	sub		rsp, 16
	mov		qword [rsp], 0
	mov		dword [rsp + 8], 0
	mov		dword [rsp + 12], 0
	push	rbx

	; === Check base ===
	push	rdi
	mov		rdi, rsi
	call	_check_base
	pop		rdi
	cmp		rax, 0
	je		_done

	; === Ignore spaces ===
	mov		rbx, 0		; rbx is index
_ft_atoi_base_ignore_spaces:
	push	rdi
	mov		dil, byte [rdi + rbx]
	call	_isspace
	pop		rdi
	cmp		rax, 1
	jne		_ft_atoi_base_sign_loop
	inc		rbx
	jmp		_ft_atoi_base_ignore_spaces

	; === Check sign ===
_ft_atoi_base_sign_negative:
	not		dword [rsp + 12]			; Set negative to true
_ft_atoi_base_sign_loop_next:
	inc		rbx
_ft_atoi_base_sign_loop:
	cmp		byte [rdi + rbx], 0x2b		; Check '+'
	je		_ft_atoi_base_sign_loop_next
	cmp		byte [rdi + rbx], 0x2d		; Check '-'
	je		_ft_atoi_base_sign_negative

	; === Find radix ===
	push	rdi
	mov		rdi, rsi
	call	_ft_strlen
	pop		rdi
	mov		dword [rsp + 8], eax		; Set radix to strlen(base)

	; === Compute value ===
_ft_atoi_base_loop:
	push	rdi
	push	rsi
	mov		dil, byte [rdi + rbx]
	call	_find_position_in_base
	pop		rsi
	pop		rdi
	cmp		rax, -1
	je		_ft_atoi_base_loop_end		; TODO set rax to 0

	mov		r11, qword [rsp]
	mov		r15d, dword [rsp + 8]
	imul	r11, r15
	mov		qword [rsp], r11
	add		qword [rsp], rax

	inc		rbx
	jmp		_ft_atoi_base_loop
_ft_atoi_base_loop_end:
	cmp		dword [rsp + 12], 0
	je		_ft_atoi_base_end
	neg		qword [rsp]				; Negate value
_ft_atoi_base_end:
	mov		rax, qword [rsp]
_done:
	pop		rbx
	add		rsp, 16
	ret



_find_position_in_base:
	mov		rax, -1
_find_position_in_base_loop:
	inc		rax
	cmp		byte [rsi + rax], 0
	je		_find_position_in_base_error
	cmp		dil, byte [rsi + rax]
	jne		_find_position_in_base_loop
	ret
_find_position_in_base_error:
	mov		rax, -1
	ret



_check_base:
	; === Check base length ===
	push	rdi
	call	_ft_strlen
	pop		rdi
	cmp		rax, 2
	jl		_check_base_false
_check_base_loop:
	; === Forbidden characters ===
	cmp		byte [rdi], 0
	je		_check_base_true
	cmp		byte [rdi], 0x2b		; Check '+'
	je		_check_base_false
	cmp		byte [rdi], 0x2d		; Check '-'
	je		_check_base_false

	; === Spaces ===
	push	rdi
	mov		dil, [rdi]
	call	_isspace
	pop		rdi
	cmp		rax, 1
	je		_check_base_false

	; === Duplicates ===
	xor		rcx, rcx
	mov		r10b, [rdi]
_check_base_duplicate_loop:
	inc		rcx
	cmp		r10b, byte [rdi + rcx]
	je		_check_base_false
	cmp		byte [rdi + rcx], 0
	jne		_check_base_duplicate_loop

	inc		rdi
	jmp		_check_base_loop
_check_base_true:
	mov		rax, 1
	ret
_check_base_false:
	xor		rax, rax
	ret



_isspace:
	cmp		dil, 0x20
	je		_isspace_true
	cmp		dil, 0x09
	je		_isspace_true
	cmp		dil, 0x0A
	je		_isspace_true
	cmp		dil, 0x0B
	je		_isspace_true
	cmp		dil, 0x0C
	je		_isspace_true
	cmp		dil, 0x0D
	je		_isspace_true
	xor		rax, rax
	ret
_isspace_true:
	mov		rax, 1
	ret