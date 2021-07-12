/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   strcpy.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 15:57:16 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/12 13:07:02 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Gimme source string\n");
		return 1;
	}

	char buf[512] = {0};
	
	printf("src: \"%s\"\n", argv[1]);
	
	printf("strcpy: \"%s\"\n", strcpy(buf, argv[1]));
	bzero(buf, sizeof(buf));
	printf("ft_strcpy: \"%s\"\n", ft_strcpy(buf, argv[1]));


	return 0;
}