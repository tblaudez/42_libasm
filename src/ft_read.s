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

	global			_ft_read		; ssize_t ft_read(int d, void *buf, size_t nbyte)
	extern			___error
	SYS_READ_OSX	equ 0x02000003	; Alias for read syscall


section .text
_ft_read:
	mov	rax, SYS_READ_OSX			; Prepare read syscall
	syscall							; Data are in the correct registers already
	jc	_error						; If CF is set, there was an error
	ret								; Return value is already in rax

_error:
	push	rax						; rax contains read syscall return value, push it in stack
	call	___error				; Get pointer to errno, stack is aligned thanks to previous line
	pop		rdx						; Put read syscall return value in rdx
	mov		[rax], rdx				; Set errno to read syscall return value
	mov		rax, -1					; Return -1
	ret
