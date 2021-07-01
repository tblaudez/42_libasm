/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   atoibase.c                                         :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 18:00:54 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 18:02:54 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>

int main(int argc, char **argv)
{
	if (argc < 3) {
		printf("Gimme string and string\n");
		return 1;
	}

	printf("%d\n", ft_atoi_base(argv[1], argv[2]));

	return 0;
}