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
	push	rdi						; save function's parameters
	push	rsi
_create_node:
	mov		rdi, 16					; set 16 as first parameter of malloc
	sub		rsp, 8					; align stack
	call	_malloc					; rax now contain 16 bytes of allocated memory
	add		rsp, 8
	pop		rsi						; restore function's parameters
	pop		rdi
_fill_value:
	mov		[rax], rsi				; copy `data` to allocated memory
	mov		r8, [rdi]
	mov		[rax+8], r8				; copy `*begin_list` to `next` to allocated memory 
	mov		[rdi], rax				; copy pointer  to allocated memory to `*begin_list`
	ret
