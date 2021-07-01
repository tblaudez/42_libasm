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

global _ft_list_remove_if
extern _free

%define NULL 0x0

%macro EXTERN_FUNCTION_SAVE 0
	push	rdi
	push	rsi
	push	rdx
	push	rcx
%endmacro

%macro EXTERN_FUNCTION_RESTORE 0
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
%endmacro

; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void*, void*), void (*free_fct)(void*))
_ft_list_remove_if:
	; === Base condition ===
	cmp		rdi, NULL
	je		_done
	cmp		qword [rdi], NULL
	je		_done

	; === compare *(begin_list)->data and data_ref
	EXTERN_FUNCTION_SAVE
	mov		rdi, [rdi]
	mov		rdi, [rdi + 0]
	call	rdx						; cmp((*begin_list)->data, data_ref)
	EXTERN_FUNCTION_RESTORE
	cmp		rax, 0
	je		_remove_head

	; === next element ===
	push	rdi
	mov		rdi, [rdi]
	lea		rdi, [rdi + 8]			; rdi = &((*begin_list)->next)
	call	_ft_list_remove_if
	pop		rdi
	jmp		_done

_remove_head:
	; === remove head and go next ===
	mov		rax, [rdi]
	mov		rax, [rax + 8]			; rax = (*begin_list)->next
	push	rax

	EXTERN_FUNCTION_SAVE
	mov		rdi, [rdi]
	mov		rdi, [rdi + 0]
	call	rcx						; free_fct((*begin_list)->data)
	EXTERN_FUNCTION_RESTORE

	EXTERN_FUNCTION_SAVE
	mov		rdi, [rdi]
	call	_free					; free(*begin_list)
	EXTERN_FUNCTION_RESTORE

	pop		qword [rdi]				; *(begin_list) = (*begin_list)->next
	call	_ft_list_remove_if

_done:
	ret
