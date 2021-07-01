; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_write.s                                         :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 14:11:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/16 14:47:16 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global			_ft_write		
extern			___error
SYS_WRITE_OSX equ 0x02000004	; Alias for write syscall


; ssize_t ft_write(int fildes, const void *buf, size_t nbyte)
_ft_write:
	mov		rax, SYS_WRITE_OSX
	syscall
	jc		_error
	ret

_error:
	push	rax
	call	___error		; rax = &errno
	pop		qword [rax]
	mov		rax, -1
	ret