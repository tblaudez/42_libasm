/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   strlen.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 15:51:48 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 16:43:12 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <string.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Gimme string\n");
		return 1;
	}
	
	printf("str: \"%s\"\n", argv[1]);
	printf("strlen: %lu\n", strlen(argv[1]));
	printf("ft_strlen: %lu\n", ft_strlen(argv[1]));

	return 0;
}