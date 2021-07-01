; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strcpy.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 10:07:09 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/15 12:19:08 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global	_ft_strcpy

; char	*ft_strcpy(char *dst, const char *src)
_ft_strcpy:
	xor		rcx, rcx
	mov		rax, rdi

_loop:
	cmp		byte [rsi + rcx], 0
	je		_done
	mov		dl, byte [rsi + rcx]
	mov		byte [rdi + rcx], dl
	inc		rcx
	jmp		_loop

_done:
	ret