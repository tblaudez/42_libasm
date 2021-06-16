; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strchr.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/16 15:20:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/16 15:20:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global _ft_strchr			; char *ft_strchr(const char *s, int c)
	extern _ft_strlen

section .text
_ft_strchr:
	xor		rcx, rcx			; Set counter to 0

_check_needle:
	cmp		sil, byte 0			; Check if `(char)c` is equal to '\0'
	jnz		_loop				; If not, jump to _loop
	call	_ft_strlen			; Else return `s + ft_strlen(s)` (end of string)
	add		rax, rdi
	ret

_loop:
	cmp		[rdi+rcx], byte 0	; Check if `s[rcx]` is equal to '\0'
	jz		_return_null		; If so, jump to _return_null
	cmp		[rdi+rcx], sil		; Else check if `s[rcx]` is equal to `(char)c`
	jz 		_done				; If so, jump to _done
	inc		rcx					; Else increment counter and keep looping
	jmp		_loop

_done:
	add		rdi, rcx			; Return `(char*)s + rcx`
	mov		rax, rdi
	ret

_return_null:
	xor		rax, rax			; Return NULL
	ret