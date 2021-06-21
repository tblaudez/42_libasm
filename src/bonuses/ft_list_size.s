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

	global _ft_list_size		; int ft_list_size(t_list *begin_list)

section .text
_ft_list_size:
	xor		rax, rax
_LS_loop:
	cmp		rdi, 0				; check if `begin_list` is NULL
	je		_done
	mov		rdi, [rdi+8]		; if not set `begin_list` to `begin_list->next`
	inc		rax
	jmp		_LS_loop
_done:
	ret							;  value is already in rax