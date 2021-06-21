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

	global _ft_atoi_base			; int ft_atoi_base(char *str, char *base)

section .text
_ft_atoi_base:
	xor		rax, rax				; total value
	xor		r11, r11				; negative flag
_check_base_double_char:
	push	rsi						
_BDC_loop_over:
	mov		rcx, 1					; increment `base` at each iteration
	mov		r8b, [rsi]				; and check that `*base` is different than
_BDC_loop:							; every other character in the string
	cmp		r8b, byte 0
	je		_get_base_length
	cmp		[rsi+rcx], byte 0
	je		_BDC_loop_next
	cmp		r8b, [rsi+rcx]
	je		_error_stack
	inc		rcx
	jmp		_BDC_loop
_BDC_loop_next:
	inc		rsi
	jmp		_BDC_loop_over
_get_base_length:
	pop		rsi
	xor		r8, r8
_GBL_loop:							; basically a strlen of `base` but 
	cmp		[rsi+r8], byte 0		; return 0 if an invalid character is found
	je		_check_base_length		; store strlen of `base` in r8
	cmp		[rsi+r8], byte 43
	je		_error
	cmp		[rsi+r8], byte 45
	je		_error
	cmp		[rsi+r8], byte 32
	je		_error
	inc		r8
	jmp		_GBL_loop
_check_base_length:					; strlen of `base` is stored in r8
	cmp		r8, 2					; if it's less than 2, return 0
	jl		_error
_check_spaces:
	cmp		[rdi], byte 9			; increment `str` as long as 
	je		_ignore_spaces			; `*str` is a space character
	cmp		[rdi], byte 10
	je		_ignore_spaces
	cmp		[rdi], byte 11
	je		_ignore_spaces
	cmp		[rdi], byte 12
	je		_ignore_spaces
	cmp		[rdi], byte 13
	je		_ignore_spaces
	cmp		[rdi], byte 32
	je		_ignore_spaces
	jmp		_check_signs
_ignore_spaces:
	inc		rdi
	jmp		_check_spaces
_check_signs:
	cmp		[rdi], byte 43			; increment `str` if `*str` is '+' or '-'
	je		_ignore_sign			; set negative flag is '-' is found
	cmp		[rdi], byte 45
	jne		_get_value
	mov		r11b, 1
_ignore_sign:
	inc		rdi
_get_value:		
	xor		rcx, rcx
_GV_loop:							
	cmp		[rdi], byte 0			; find index of `*str` in `base`
	je		_done					; and store it in rcx
	mov		r9b, [rsi+rcx]
	cmp		r9b, byte 0
	je		_error
	cmp		[rdi], r9b
	je		_convert
	inc		rcx
	jmp		_GV_loop
_convert:
	mul		r8						; compute total value and store it in rax
	add		rax, rcx				; C equivalent -> total = total * base_len + index
	inc		rdi
	xor		rcx, rcx
	jmp		_GV_loop

_done:
	cmp		r11b, 1					; negate total if negative flag is set
	jne		_return
	neg		rax
	jmp		_return
_error_stack:						; restore stack before returning
	pop		rsi
_error:
	xor		rax, rax				; return 0
_return:
	ret