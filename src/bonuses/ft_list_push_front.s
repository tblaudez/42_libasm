; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_list_push_front.s                               :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/18 15:45:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/18 15:45:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global _ft_list_push_front		; void ft_list_push_front(t_list **begin_list, void *data);
	extern _malloc

section .text
_ft_list_push_front:
	push	rdi
	push	rsi
_create_node:
	mov		rdi, 16
	sub		rsp, 8
	call	_malloc
	add		rsp, 8
	pop		rsi
	pop		rdi
_fill_value:
	mov		[rax], rsi
	mov		r8, [rdi]
	mov		[rax+8], r8
	mov		[rdi], rax
	ret
