; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strlen.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 10:10:15 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/15 14:14:20 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global	_ft_strlen			; size_t ft_strlen(const char *s)

section	.text
_ft_strlen:
	xor		rcx, rcx			; Set counter to 0

_loop:
	cmp		[rdi+rcx], byte 0	; Check if `s` + counter is pointing to '\0'
	jz		_done				; If so, return
	inc		rcx					; Increment counter
	jmp		_loop				; Next iteration

_done:
	mov		rax, rcx			; Counter is equal to the length of the string, move it to rax
	ret
