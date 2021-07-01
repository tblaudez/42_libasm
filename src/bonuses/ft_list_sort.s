; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_list_sort.s                                     :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/30 14:18:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/30 14:18:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_list_sort

extern _ft_list_size

%define NULL 0x0

_ft_list_sort:
	cmp		rdi, NULL
	je		_list_sort_end
	mov		rax, [rdi]
	cmp		rax, NULL
	je		_list_sort_end
	mov		rbx, [rax + 8]
	cmp		rbx, NULL
	je		_list_sort_end

_list_sort_middle_loop:
	mov		rbx, [rbx + 8]
	cmp		rbx, NULL
	je		_list_sort_middle_loop_end
	mov		rbx, [rbx + 8]
	mov		rax, [rax + 8]
	cmp		rbx, NULL
	jne		_list_sort_middle_loop

_list_sort_middle_loop_end:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 8

	mov		rcx, [rax + 8]
	mov		[rbp - 8], rcx
	mov		qword [rax + 8], NULL

	push	rdi
	push	rsi
	call	_ft_list_sort
	lea		rdi, [rbp - 8]
	call	_ft_list_sort
	pop		rsi
	pop		rdi

	push	rdi
	push	rsi
	mov		rdi, [rdi]
	mov		rdx, rsi
	mov		rsi, [rbp - 8]
	call	_merge_sorted_list
	pop		rsi
	pop		rdi
	mov		[rdi], rax

	mov		rsp, rbp
	pop		rbp

_list_sort_end:
	ret


_merge_sorted_list:
	cmp		rdi, NULL
	je		_merge_sorted_list_return_right
	cmp		rsi, NULL
	je		_merge_sorted_list_return_left	

	push	rdi
	push	rsi
	push	rdx
	mov		rdi, [rdi]
	mov		rsi, [rsi]
	xor		rax, rax
	call	rdx
	pop		rdx
	pop		rsi
	pop		rdi

	cmp		eax, 0
	jl		_merge_sorted_list_left_lt_right

	push	rsi
	mov		rsi, [rsi + 8]
	call	_merge_sorted_list
	pop		rsi
	mov		[rsi + 8], rax
	mov		rax, rsi
	jmp		_merge_sorted_list_end

_merge_sorted_list_left_lt_right:
	push	rdi
	mov		rdi, [rdi + 8]
	call	_merge_sorted_list
	pop		rdi
	mov		[rdi + 8], rax
	mov		rax, rdi
	jmp		_merge_sorted_list_end

_merge_sorted_list_return_left:
	mov		rax, rdi
	ret
_merge_sorted_list_return_right:
	mov		rax, rsi
	ret
_merge_sorted_list_end:
	ret