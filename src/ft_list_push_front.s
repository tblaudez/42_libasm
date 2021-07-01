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

global _ft_list_push_front		
extern _malloc

%define NULL 0x0

; void ft_list_push_front(t_list **begin_list, void *data);
_ft_list_push_front:
	cmp		rdi, NULL
	je		_done

	push	rdi
	push	rsi
	mov		rdi, 16
	sub		rsp, 8
	call	_malloc
	add		rsp, 8
	pop		rsi
	pop		rdi

	mov		qword [rax + 0], rsi		; new_node->data = data
	mov		r10, qword [rdi]
	mov		qword [rax + 8], r10		; new_node->next = *begin_list
	mov		qword [rdi], rax			; *begin_list = new_node

_done:
	ret