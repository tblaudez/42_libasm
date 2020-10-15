; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strcpy.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 10:07:09 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/15 12:19:08 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global	_ft_strcpy				; size_t ft_strcpy(char *dst, const char *src)

section	.text
_ft_strcpy:
	push	rdi						; Push `dst` in stack to be restored later
	xor		rcx, rcx				; Set counter to 0

_loop:
	cmp		[rsi+rcx], byte  0		; Check if (`src` + counter) is pointing to NULL
	jz		_done					; If so, return
	mov		al, [rsi+rcx]			; Move (`src` + counter) char to `dst` using 8-bits register al
	mov		[rdi+rcx], al
	inc		rcx						; Increment counter
	jmp		_loop					; Next iteration

_done:
	mov		[rdi+rcx], byte 0		; Copy the terminating '\0' in dst
	pop		rax						; Restore `dst` to rax before returning
	ret
