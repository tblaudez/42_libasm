/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   strdup.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 15:57:16 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 16:42:54 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Gimme string\n");
		return 1;
	}
	
	printf("str: %1$p -> \"%1$s\"\n", argv[1]);

	char *ptr = strdup(argv[1]);
	char *ptr2 = ft_strdup(argv[1]);
	
	printf("strdup: %1$p -> \"%1$s\"\n", ptr);
	printf("ft_strdup: %1$p -> \"%1$s\"\n", ptr2);

	free(ptr);
	free(ptr2);

	return 0;
}