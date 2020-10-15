/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/15 10:23:31 by tblaudez      #+#    #+#                 */
/*   Updated: 2020/10/15 14:23:07 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <stddef.h> // size_t
#include <sys/types.h> // ssize_t


size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

# endif
