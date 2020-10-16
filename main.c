/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/15 10:42:08 by tblaudez      #+#    #+#                 */
/*   Updated: 2020/10/16 14:55:13 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h> // puts, printf
#include <string.h> // strlen, strcpy, strcmp
#include <unistd.h> // write


int main(void) {

	puts("---------- ft_strlen ----------");
	{
		const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ex diam, vestibulum tincidunt velit sed, interdum efficitur eros. Maecenas ornare finibus ex, sed porttitor turpis varius quis. Mauris sagittis lobortis ante, fringilla ultricies sapien lacinia vel. Aliquam id massa risus. Vestibulum sit amet vulputate est, a porta lectus. Mauris eget turpis euismod, finibus nibh sed, faucibus arcu. Ut mi ipsum, aliquam a nunc vel, laoreet egestas lorem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc et lorem vitae lectus elementum fermentum. In hac habitasse platea dictumst. Suspendisse potenti. Morbi cursus enim quis commodo condimentum."};


		for (int i=0; i < 5; i++) {
			printf("ft_strlen(\"%s\") : %lu\n", str_array[i], ft_strlen(str_array[i]));
			printf("strlen(\"%s\") : %lu\n\n", str_array[i], strlen(str_array[i]));
		}

		// // strlen does not NULL check the string, uncommenting the below test will result in a segmentation fault
		// {
		// 	const char *str = NULL;
		// 	printf("ft_strlen(\"%s\") : %lu\n", str, ft_strlen(str));
		// 	printf("strlen(\"%s\") : %lu\n\n", str, strlen(str));
		// }
	}

	puts("---------- ft_strcpy ----------");
	{

		char		str[700] = {0};
		const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ex diam, vestibulum tincidunt velit sed, interdum efficitur eros. Maecenas ornare finibus ex, sed porttitor turpis varius quis. Mauris sagittis lobortis ante, fringilla ultricies sapien lacinia vel. Aliquam id massa risus. Vestibulum sit amet vulputate est, a porta lectus. Mauris eget turpis euismod, finibus nibh sed, faucibus arcu. Ut mi ipsum, aliquam a nunc vel, laoreet egestas lorem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc et lorem vitae lectus elementum fermentum. In hac habitasse platea dictumst. Suspendisse potenti. Morbi cursus enim quis commodo condimentum."};

		for (int i=0; i < 5; i++) {
			printf("ft_strcpy -> src: \"%s\" | dst: \"%s\"\n", str_array[i], ft_strcpy(str, str_array[i]));
			printf("strcpy -> src: \"%s\" | dst: \"%s\"\n\n", str_array[i], strcpy(str, str_array[i]));
		}
	}

	puts("---------- ft_strcmp ----------");
	{

		const char	*s1[5] = {"Foo", "Bar", "FooBA", "", "Hello There I am pleased to meet you"};
		const char	*s2[5] = {"Fo", "Bar", "FooAB", "", "hi"};

		for (int i=0; i < 5; i++) {
			printf("strcmp(\"%s\", \"%s\") -> %d\n", s1[i], s2[i], strcmp(s1[i], s2[i]));
			printf("ft_strcmp(\"%s\", \"%s\") -> %d\n\n", s1[i], s2[i], ft_strcmp(s1[i], s2[i]));
		}
	}

	puts("---------- ft_write ----------");
	{

		// All good
		{
			ssize_t	ret = write(1, "Hello World!\n", 13);
			if (ret == -1) {
				perror("write");
			}

			ret = ft_write(1, "Hello World!\n", 13);
			if (ret == -1) {
				perror("ft_write_1");
			}
		}

		// Bad Address
		{
			ssize_t	ret = write(1, NULL, 13);
			if (ret == -1) {
				perror("write");
			}

			ret = ft_write(1, NULL, 13);
			if (ret == -1) {
				perror("ft_write");
			}
		}

		// Bad file descriptor
		{
			ssize_t	ret = write(-1, "Hello World!\n", 13);
			if (ret == -1) {
				perror("write");
			}

			ret = ft_write(-1, "Hello World!\n", 13);
			if (ret == -1) {
				perror("ft_write");
			}
		}

		// Invalid argument
		{
			ssize_t	ret = write(1, "Hello World!\n", -1);
			if (ret == -1) {
				perror("write");
			}

			ret = ft_write(1, "Hello World!\n", -1);
			if (ret == -1) {
				perror("ft_write");
			}
		}
	}

	return 0;
}
