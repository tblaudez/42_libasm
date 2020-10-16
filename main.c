/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/15 10:42:08 by tblaudez      #+#    #+#                 */
/*   Updated: 2020/10/16 16:25:49 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h> // puts, printf
#include <string.h> // strlen, strcpy, strcmp
#include <unistd.h> // write, read
#include <fcntl.h> // open


int main(void) {

	puts("---------- ft_strlen ----------");
	{
		const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis metus ut ante volutpat posuere. Vivamus vel lacus viverra, commodo tellus quis, commodo dolor. Integer iaculis nibh et tellus efficitur, at iaculis lacus fermentum. Duis dictum tellus non magna ornare volutpat. Nunc pulvinar tincidunt nulla convallis finibus. Nulla facilisi. Vestibulum ac magna vel lacus dignissim iaculis in in sapien. Morbi sapien mi, feugiat sed luctus sit amet, mollis venenatis ligula. In ornare velit vitae fermentum vulputate.\nFusce eget ipsum nec quam facilisis consequat. Nulla facilisi. Morbi faucibus risus nec quam porttitor bibendum. Ut ullamcorper, lorem nec nunc"};


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
		const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis metus ut ante volutpat posuere. Vivamus vel lacus viverra, commodo tellus quis, commodo dolor. Integer iaculis nibh et tellus efficitur, at iaculis lacus fermentum. Duis dictum tellus non magna ornare volutpat. Nunc pulvinar tincidunt nulla convallis finibus. Nulla facilisi. Vestibulum ac magna vel lacus dignissim iaculis in in sapien. Morbi sapien mi, feugiat sed luctus sit amet, mollis venenatis ligula. In ornare velit vitae fermentum vulputate.\nFusce eget ipsum nec quam facilisis consequat. Nulla facilisi. Morbi faucibus risus nec quam porttitor bibendum. Ut ullamcorper, lorem nec nunc"};

		for (int i=0; i < 5; i++) {
			printf("ft_strcpy -> src: \"%s\" <------ dst: \"%s\"\n", str_array[i], ft_strcpy(str, str_array[i]));
			printf("strcpy -> src: \"%s\" <------ dst: \"%s\"\n\n", str_array[i], strcpy(str, str_array[i]));
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

	puts("\n---------- ft_read ----------");
	{

		// All good
		{
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = read(fd, buf, 50);
				ret == -1 ? perror("read") : printf("\"%s\"\n", buf);
				close(fd);
			}
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = ft_read(fd, buf, 50);
				ret == -1 ? perror("ft_read") : printf("\"%s\"\n", buf);
				close(fd);
			}
		}

		// NULL buffer is OK
		{
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = read(fd, NULL, 50);
				ret == -1 ? perror("read") : printf("\"%s\"\n", buf);
				close(fd);
			}
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = ft_read(fd, NULL, 50);
				ret == -1 ? perror("ft_read") : printf("\"%s\"\n", buf);
				close(fd);
			}
		}

		// Invalid file descriptor
		{
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = read(-1, buf, 50);
				ret == -1 ? perror("read") : printf("\"%s\"\n", buf);
				close(fd);
			}
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = ft_read(-1, buf, 50);
				ret == -1 ? perror("ft_read") : printf("\"%s\"\n", buf);
				close(fd);
			}
		}

		// Invalid argument
		{
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = read(fd, buf, -1);
				ret == -1 ? perror("read") : printf("\"%s\"\n", buf);
				close(fd);
			}
			{
				int		fd = open("test.txt", O_RDONLY);
				char	buf[50] = {0};
				ssize_t	ret = ft_read(fd, buf, -1);
				ret == -1 ? perror("ft_read") : printf("\"%s\"\n", buf);
				close(fd);
			}
		}
	}

	return 0;
}
