/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   strcmp.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 15:57:16 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 16:43:01 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <string.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	if (argc < 3) {
		printf("Gimme string and string\n");
		return 1;
	}
	
	printf("str1: \"%s\"\nstr2: \"%s\"\n", argv[1], argv[2]);
	
	printf("strcmp: %d\n", strcmp(argv[1], argv[2]));
	printf("ft_strcmp: %d\n", ft_strcmp(argv[1], argv[2]));

	return 0;
}