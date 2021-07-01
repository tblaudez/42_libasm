/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   read.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 16:28:01 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 16:42:18 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <strings.h>

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Gimme file to read\n");
		return 1;
	}

	char buf[8192] = {0};

	int fd = open(argv[1], O_RDONLY);
	if (fd == -1) {
		perror("open");
		return 1;
	}

	ssize_t read_ret = read(fd, buf, sizeof(buf));
	if (read_ret < 0)
		perror("read");
	else
		printf("read: %ld\n===\n%s\n===\n", read_ret, buf);

	
	bzero(buf, sizeof(buf));
	lseek(fd, 0, SEEK_SET);
	
	ssize_t ft_read_ret = ft_read(fd, buf, sizeof(buf));
	if (read_ret < 0)
		perror("ft_read");
	else
		printf("ft_read: %ld\n===\n%s\n===\n", ft_read_ret, buf);

	close(fd);
	return 0;
}