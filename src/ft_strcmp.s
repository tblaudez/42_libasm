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

	global _ft_strcmp				; int ft_strcmp(const char *s1, const char *s2)

section .text
_compare:
	mov		al, [rdi+rcx]			; Put the current byte of `s1` in al
	mov		dl, [rsi+rcx]			; and the current byte of `s2` in dl
	sub		al, dl
	ret

_ft_strcmp:
	xor		rcx, rcx				; Set counter to 0

_loop:
	cmp 	[rdi+rcx], byte 0		; Check if `s1` or `s2` is pointing to NULL
	jz		_done					; If so, return
	cmp 	[rsi+rcx], byte 0
	jz		_done

	call	_compare				; Check if [rdi+rcx] and [rsi+rcx] are equal
	cmp		al, byte 0
	jnz		_done					; If not, return

	inc		rcx						; Increment counter
	jmp		_loop					; Next iteration

_done:
	call	_compare				; Put the value ([rdi+rcx] - [rsi+rcx]) in rax and return
	movsx	rax, al
	ret
