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

	global			_ft_write		; ssize_t ft_write(int fildes, const void *buf, size_t nbyte)
	extern			___error
	SYS_WRITE_OSX	equ 0x02000004	; Alias for write syscall


section .text
_ft_write:
	mov	rax, SYS_WRITE_OSX			; Prepare write syscall
	syscall							; Data are in the correct registers already
	jc	_error						; If CF is set, there was an error
	ret								; Return value is already in rax

_error:
	push	rax						; rax contains write syscall return value, push it in stack
	call	___error				; Get pointer to errno, stack is aligned thanks to previous line
	pop		rdx						; Put write syscall return value in rdx
	mov		[rax], rdx				; Set errno to write syscall return value
	mov		rax, -1					; Return -1
	ret
