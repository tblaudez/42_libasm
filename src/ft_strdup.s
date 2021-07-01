; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strdup.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 10:07:09 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/19 12:51:54 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy

%define NULL 0x0

; char *ft_strdup(const char *s1)
_ft_strdup:
	xor		rax, rax

	cmp		rdi, NULL
	je		_done
	call	_ft_strlen
	inc		rax					; rax = ft_strlen(s1) + 1
	
	push	rdi
	mov		rdi, rax
	call	_malloc				; rax = malloc(strlen(s1) + 1)
	pop		rsi
	cmp		rax, NULL			; Check malloc return
	je		_done

	mov		rdi, rax
	call	_ft_strcpy

_done:
	ret
