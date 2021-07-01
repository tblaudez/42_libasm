/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   listpushfront.c                                    :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 18:00:54 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 18:25:29 by tblaudez      ########   odam.nl         */
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

int main(void)
{

	t_list *list = NULL;
	int data = 42;

	for (int i = 0; i < 5; i++) {
		printf("list: %p\n", list);
		if (list)
			printf("list->next: %p\n", list->next);
		putchar('\n');
		ft_list_push_front(&list, &data);
	}
	
	ft_lstclear(&list, NULL);

	return 0;
}