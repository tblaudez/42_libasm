/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   listsort.c                                         :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 18:00:54 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 18:39:55 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>

static void ft_lstclear(t_list **lst, void (*del)(void*))
{
    t_list *node = *lst;
    t_list *tmp;

    while (node) {
        tmp = node;
        node = node->next;
		if (del)
			del(tmp->data);
		free(tmp);
    }

    *lst = NULL;
}

static void display_list(t_list *list)
{
	while (list) {
		printf("%3d | ", *((int*)list->data));
		list = list->next;
	}
	putchar('\n');
}

static int compare_int(void *data1, void *data2)
{
	return (*((int*)data1) - *((int*)data2));
}

int main(void)
{
	t_list *list = NULL;

	for (int i = 0; i < 10; i++) {
		int *data = malloc(sizeof(int));
		*data = arc4random_uniform(50);
		ft_list_push_front(&list, data);
	}

	display_list(list);
	ft_list_sort(&list, compare_int);
	display_list(list);
	
	ft_lstclear(&list, free);
	return 0;
}