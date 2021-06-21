/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_list_remove_if.c                                :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/06/21 11:52:20 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/06/21 14:27:13 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdlib.h>

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*))
{
	t_list  *node = *begin_list;
	t_list	*tmp;

	while (node && node->next) {
		if (!cmp(node->next->data, data_ref)) {
			tmp = node->next;
			node->next = node->next->next;
			free_fct(tmp->data);
			free(tmp);
			continue;
		}
		node = node->next;
	}

	node = *begin_list;
	if (!cmp(node->data, data_ref)) {
		*begin_list = node->next;
		free_fct(node->data);
		free(node);
	}
}