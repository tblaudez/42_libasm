; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_list_size.s                                     :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/21 11:32:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/21 11:32:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_list_size

%define NULL 0x0

; int ft_list_size(t_list *begin_list)
_ft_list_size:
	xor		rax, rax

_loop:
	cmp		rdi, NULL
	je		_done
	inc		rax
	mov		rdi, [rdi + 8]		; begin_list = begin_list->next
	jmp		_loop

_done:
	ret