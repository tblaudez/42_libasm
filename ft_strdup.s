; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strdup.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 10:07:09 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/19 12:51:54 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global	_ft_strdup				; char *ft_strdup(const char *s1)
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_strcpy

section	.text
_ft_strdup:
_get_length:
	push	rdi						; Push `s1` in stack
	call	_ft_strlen				; rax now contains length of s1
	push	rax						; Push length of `s1` in stack
_get_memory:
	mov		rdi, rax				; Set length of `s1` as malloc parameter
	inc		rdi						; Add space for terminating '\0'
	sub		rsp, 8
	call	_malloc					; rax now contain pointer to writable memory
	add		rsp, 8
	jc		_error					; If error, jump to end
_copy_string:
	mov 	rdi, rax				; Move memory as the 'dst' parameter of ft_strcpy
	pop		rcx						; Pop length of `s1` in rdi
	mov 	[rdi+rcx], byte 0		; Set terminating '\0' to new memory
	pop		rsi						; Pop `s1` as the 'src' parameter of ft_strcpy
	call	_ft_strcpy				; Pointer to new memory is in rax
	ret

_error:
	ret		16
