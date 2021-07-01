/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/15 10:42:08 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/06/30 16:59:03 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>

int compare_int(void *data1, void *data2)
{
	return (*((int*)data1) - *((int*)data2));
}

void display_list(t_list *node)
{
	while (node) {
		printf("%d | ", *((int*)node->data));
		node = node->next;
	}
	printf("\n");
}

int main(void) {

	t_list *list = NULL;

	for (int i = 0; i < 3; i++) {
		int *ptr = (int*)malloc(sizeof(int));
		*ptr = arc4random_uniform(50);
		ft_list_push_front(&list, ptr);
	}

	ft_list_sort(&list, compare_int);

	return 0;
}
