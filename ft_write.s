; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_write.s                                         :+:    :+:            ;
;                                                     +:+                    ;
;   By: tblaudez <tblaudez@student.codam.nl>         +#+                     ;
;                                                   +#+                      ;
;   Created: 2020/10/15 14:11:40 by tblaudez      #+#    #+#                 ;
;   Updated: 2020/10/15 14:46:45 by tblaudez      ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

	global	_ft_write			; ssize_t ft_write(int fildes, const void *buf, size_t nbyte)

section .text
_ft_write:
	mov	rax, 0x02000004			; write syscall
	syscall
	movsx rax, eax
	ret
