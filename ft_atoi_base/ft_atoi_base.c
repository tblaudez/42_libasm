/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_atoi_base.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/06/16 14:21:08 by tblaudez      #+#    #+#                 */
/*   Updated: 2021/06/16 15:16:25 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdbool.h> // bool

static bool ft_isspace(int c)
{
	return (unsigned char)c == '\t' || (unsigned char)c == '\n' \
		|| (unsigned char)c == '\v' || (unsigned char)c == '\f' \
		|| (unsigned char)c == '\r' || (unsigned char)c == ' ';
}

char *ft_strchr(const char *s, int c)
{
    if ((char)c == '\0')
        return ((char*)s + ft_strlen(s));
    for (int i = 0; s[i]; i++) {
        if (s[i] == (char)c)
            return (char*)s + i;
    }
    return NULL;
}

static bool check_base_invalid_character(const char *base)
{
	while (*base) {
		if (*base == '+' || *base == '-' || *base == ' ')
			return false;
		base++;
	}

	return true;
}

static bool check_base_double_character(const char *base)
{
	for (int i = 0; base[i]; i++) {
		for (int j = 0; base[j]; j++) {
			if (i != j && base[i] == base[j])
				return false;
		}
	}

	return true;
}

static int get_value(char c, const char *base)
{
	int i = 0;

	while (base && base[i] != c)
		i++;
	
	return i;
}

static bool str_is_not_in_base(char *str, char *base)
{
	while (*str) {
		if (!ft_strchr(base, *str))
			return false;
		str++;
	}

	return true;
}

int ft_atoi_base(char *str, char *base)
{
	const size_t base_len = ft_strlen(base);
	int neg = 1, ret = 0;

	if (base_len < 2)
		return 0;
	if (!check_base_invalid_character(base))
		return 0;
	if (!check_base_double_character(base))
		return 0;
	if (!str_is_not_in_base(str, base))
		return 0;

	while (ft_isspace(*str))
		str++;
	if (*str == '-' || *str == '+') {
		if (*str == '-')
			neg = -1;
		str++;
	}

	for (int i = 0; str[i]; i++) {
		ret = ret * base_len + get_value(str[i], base);
	}

	return ret * neg;
}

#include <stdio.h>
int main(int argc, char **argv)
{
	printf("str: |%s|\nbase: |%s|\nft_atoi_base: |%d|\n", argv[1], argv[2], ft_atoi_base(argv[1], argv[2]));
	return 0;
}