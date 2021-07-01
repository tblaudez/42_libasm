/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   listremoveif.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/07/01 18:00:54 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/07/01 18:29:49 by tblaudez      ########   odam.nl         */
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

static int compare_int(void *data1, void *data2)
{
	return (*(int*)data1 - *(int*)data2);
}

int main(void)
{

	t_list *list = NULL;
	int data_ref = 1;

	for (int i = 0; i < 10; i++) {
		int *data = (int*)malloc(sizeof(int));
		*data = i % 2;
		ft_list_push_front(&list, data);
	}
	
	printf("list: %d nodes\n", ft_list_size(list));
	ft_list_remove_if(&list, &data_ref, compare_int, free);
	printf("list: %d nodes\n", ft_list_size(list));
	
	ft_lstclear(&list, free);

	return 0;
}