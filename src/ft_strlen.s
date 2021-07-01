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

global	_ft_strlen

; size_t ft_strlen(const char *s)
_ft_strlen:
	xor		rax, rax

_loop:
	cmp		byte [rdi + rax], 0
	je		_done
	inc		rax
	jmp		_loop

_done:
	ret