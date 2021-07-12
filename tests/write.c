/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   write.c                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 16:16:39 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/12 13:09:01 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	if (argc < 4) {
		printf("Gimme fd and string and size\n");
		return 1;
	}

	int fildes = atoi(argv[1]);
	const void *buf = argv[2];
	size_t nbyte = strtoul(argv[3], NULL, 10);

	ssize_t write_ret = write(fildes, buf, nbyte);
	putchar('\n');
	ssize_t ft_write_ret = ft_write(fildes, buf, nbyte);
	putchar('\n');

	if (write_ret < 0)
		perror("write");
	if (ft_write_ret < 0)
		perror("ft_write");

	printf("write: %ld\n", write_ret);
	printf("ft_write: %ld\n", ft_write_ret);

	return 0;
}