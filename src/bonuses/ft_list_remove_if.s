; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_list_remove_if.s                                :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/21 11:47:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/21 11:47:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global _ft_list_remove_if		; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*))
	extern _free

section  .text
_ft_list_remove_if:
	mov		r8, [rdi]
	cmp		r8, 0
	je		_check_first_node
	cmp		[r8+8], byte 0
	je		_check_first_node
	push	rdi
	mov		r10, [r8+8]
	mov		rdi, [r10]
	call	rdx
	pop		rdi
	cmp		rax, 0
	jne		_LRI_loop_next
	mov		r9, [r8+8]
	mov		r10, [r8+8]
	mov		r10, [r10+8]
	mov		[r8+8], r10
	push	rdi
	push	r9
	mov		rdi, [r9]
	call	rcx
	pop		rdi
	call	_free
	pop		rdi
	jmp		_ft_list_remove_if
_LRI_loop_next:
	mov		r8, [r8+8]
	jmp		_ft_list_remove_if
_check_first_node:
	mov		r8, [rdi]
	push	rdi
	mov		rdi, [r8]
	call	rdx
	pop		rdi
	cmp		rax, 0
	jne		_done
	mov		r10, [r8+8]
	mov		[rdi], r10
	push	rdi
	mov		rdi, [r8]
	call	rcx
	mov		rdi, r8
	call	_free
	pop		rdi
_done:
	ret
