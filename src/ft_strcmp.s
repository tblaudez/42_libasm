; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strcmp.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 11:36:25 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/19 10:55:13 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_strcmp				

; int ft_strcmp(const char *s1, const char *s2)
_ft_strcmp:
	xor		rcx, rcx

_loop:
	mov		al, byte [rdi + rcx]
	mov		dl, byte [rsi + rcx]

	cmp		al, 0
	je		_done
	cmp		dl, 0
	je		_done
	cmp		al, dl
	jne		_done

	inc		rcx
	jmp		_loop

_done:
	sub		al, dl
	movsx	rax, al
	ret
