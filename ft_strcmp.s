; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strcmp.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 11:36:25 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/15 14:03:11 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global _ft_strcmp				; int ft_strcmp(const char *s1, const char *s2)

section .text
_compare:
	mov		al, [rdi+rcx]			; Put the current byte of `s1` in al
	mov		dl, [rsi+rcx]			; and the current byte of `s2` in dl
	cmp		al, dl
	jl		_less					; if al is less than dl -> _less
	jg		_greater				; else if al is greater than dl -> _greater
	mov		al, 0					; else set al to 0
	ret

	_less:
	mov		al, -1					; Set al to -1
	ret

	_greater:
	mov		al, 1					; Set al to 1
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
