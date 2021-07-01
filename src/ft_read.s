; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_read.s                                          :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 14:11:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/16 15:37:04 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global			_ft_read		
extern			___error
SYS_READ_OSX equ 0x02000003			; Alias for read syscall


; ssize_t ft_read(int d, void *buf, size_t nbyte)
_ft_read:
	mov		rax, SYS_READ_OSX
	syscall
	jc		_error
	ret

_error:
	push	rax
	call	___error		; rax = &errno
	pop		qword [rax]
	mov		rax, -1
	ret
