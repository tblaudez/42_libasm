; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_isspace.s                                       :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/06/16 15:20:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/06/16 15:20:40 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global _ft_isspace			; int ft_isspace(int c)

section .text
_ft_isspace:
	cmp		rdi, byte 9			; Compare `c` to '\t'
	jz		_done
	cmp		rdi, byte 10		; Compare `c` to '\n'
	jz		_done
	cmp		rdi, byte 11		; Compare `c` to '\v'
	jz		_done
	cmp		rdi, byte 12		; Compare `c` to '\f'
	jz		_done
	cmp		rdi, byte 13		; Compare `c` to '\r'
	jz		_done
	cmp		rdi, byte 32		; Compare `c` to ' '
	jz		_done
	mov		rax, 0				; Return 0
	ret

_done:
	mov	rax, 1					; Return 1
	ret