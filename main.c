/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tblaudez <tblaudez@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/15 10:42:08 by tblaudez      #+#    #+#                 */
/*   Updated: 2020/10/19 13:11:22 by tblaudez      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h> // puts, printf
#include <string.h> // strlen, strcpy, strcmp, strdup
#include <strings.h> // bzero
#include <unistd.h> // write, read, //lseek
#include <fcntl.h> // open
#include <stdlib.h> // malloc, free


static void	test_strlen() {

	puts("---------- ft_strlen ----------");

	const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor \
sit amet, consectetur adipiscing elit. Praesent quis metus ut ante volutpat posuere. \
Vivamus vel lacus viverra, commodo tellus quis, commodo dolor. Integer iaculis nibh \
et tellus efficitur, at iaculis lacus fermentum. Duis dictum tellus non magna ornare \
volutpat. Nunc pulvinar tincidunt nulla convallis finibus. Nulla facilisi. Vestibulum \
ac magna vel lacus dignissim iaculis in in sapien. Morbi sapien mi, feugiat sed luctus \
sit amet, mollis venenatis ligula. In ornare velit vitae fermentum vulputate.\n\
Fusce eget ipsum nec quam facilisis consequat. Nulla facilisi. Morbi faucibus \
risus nec quam porttitor bibendum. Ut ullamcorper, lorem nec nunc"};


	for (int i=0; i < 5; i++) {
		printf("strlen(\"%.100s\") -> %zu\n", str_array[i], strlen(str_array[i]));
		printf("ft_strlen(\"%.100s\") -> %zu\n", str_array[i], ft_strlen(str_array[i]));

		if (i != 5-1) {
			puts("-----");
		}
	}
	putchar('\n');
}


static void	test_strcpy() {

	puts("---------- ft_strcpy ----------");

	char		dst[700] = {0};
	const char	*str_array[5] = {"F", "Foo", "", "Hello World !", "Lorem ipsum dolor \
sit amet, consectetur adipiscing elit. Praesent quis metus ut ante volutpat posuere. \
Vivamus vel lacus viverra, commodo tellus quis, commodo dolor. Integer iaculis nibh \
et tellus efficitur, at iaculis lacus fermentum. Duis dictum tellus non magna ornare \
volutpat. Nunc pulvinar tincidunt nulla convallis finibus. Nulla facilisi. Vestibulum \
ac magna vel lacus dignissim iaculis in in sapien. Morbi sapien mi, feugiat sed luctus \
sit amet, mollis venenatis ligula. In ornare velit vitae fermentum vulputate.\n\
Fusce eget ipsum nec quam facilisis consequat. Nulla facilisi. Morbi faucibus \
risus nec quam porttitor bibendum. Ut ullamcorper, lorem nec nunc"};

	for (int i=0; i < 5; i++) {
		bzero(dst, 700);
		printf("src -> \"%.100s\"\n", str_array[i]);
		printf("dst -> \"%.100s\"\n", strcpy(dst, str_array[i]));
		puts("-----");
		bzero(dst, 700);
		printf("src -> \"%.100s\"\n", str_array[i]);
		printf("dst -> \"%.100s\"\n", ft_strcpy(dst, str_array[i]));

		if (i != 5-1) {
			puts("=====");
		}
	}
	putchar('\n');
}


static void	test_strcmp() {

	puts("---------- ft_strcmp ----------");

	const char	*s1[5] = {"Foo", "Bar", "FooBA", "FooAB", "Hello world!"};
	const char	*s2[5] = {"Fo", "Bar", "FooAB", "FooBA", "Hello WORLD!"};

	for (int i=0; i < 5; i++) {
		printf("strcmp(\"%s\", \"%s\") -> %d\n", s1[i], s2[i], strcmp(s1[i], s2[i]));
		printf("ft_strcmp(\"%s\", \"%s\") -> %d\n", s1[i], s2[i], ft_strcmp(s1[i], s2[i]));

		if (i != 5-1) {
			puts("=====");
		}
	}
	putchar('\n');
}


static void	test_write() {

	puts("---------- ft_write ----------");
	ssize_t	ret = 0;

	// All good
	ret = write(1, "Hello World!\n", 13);
	if (ret == -1) {
		perror("write_1");
	}

	ret = ft_write(1, "Hello World!\n", 13);
	if (ret == -1) {
		perror("ft_write_1");
	}


	// Bad Address
	ret = write(1, NULL, 13);
	if (ret == -1) {
		perror("write_2");
	}

	ret = ft_write(1, NULL, 13);
	if (ret == -1) {
		perror("ft_write_2");
	}


	// Bad file descriptor
	ret = write(-1, "Hello World!\n", 13);
	if (ret == -1) {
		perror("write_3");
	}

	ret = ft_write(-1, "Hello World!\n", 13);
	if (ret == -1) {
		perror("ft_write_3");
	}


	// Invalid argument
	ret = write(1, "Hello World!\n", -1);
	if (ret == -1) {
		perror("write_4");
	}

	ret = ft_write(1, "Hello World!\n", -1);
	if (ret == -1) {
		perror("ft_write_4");
	}

	putchar('\n');
}


static void	test_read() {

	puts("---------- ft_read ----------");
	ssize_t	ret = 0;
	int		fd = open("ft_read.txt", O_RDONLY);
	char	buf[550+1] = {0};

	if (fd == -1) {
		perror("open(\"ft_read.txt\")");
		return;
	}

	// All good
	ret = read(fd, buf, 550);
	ret == -1 ? perror("read_1") : printf("ret -> %lu || \"%s\"\n", ret, buf);

	lseek(fd, 0, SEEK_SET);
	bzero(buf, 550);

	ret = ft_read(fd, buf, 550);
	ret == -1 ? perror("ft_read_1") : printf("ret -> %lu || \"%s\"\n", ret, buf);
	puts("=====");


	// NULL buffer is OK
	ret = read(fd, NULL, 10);
	ret == -1 ? perror("read_2") : printf("ret -> %lu || \"%s\"\n", ret, NULL);
	ret = ft_read(fd, NULL, 10);
	ret == -1 ? perror("ft_read_2") : printf("ret -> %lu || \"%s\"\n", ret, NULL);
	puts("=====");


	// Invalid file descriptor
	ret = read(-1, buf, 10);
	ret == -1 ? perror("read_3") : printf("ret -> %lu || \"%s\"\n", ret, buf);
	ret = ft_read(-1, buf, 10);
	ret == -1 ? perror("ft_read_3") : printf("ret -> %lu || \"%s\"\n", ret, buf);
	puts("=====");


	// Invalid argument
	ret = read(fd, buf, -1);
	ret == -1 ? perror("read_4") : printf("ret -> %lu || \"%s\"\n", ret, buf);
	ret = ft_read(fd, buf, -1);
	ret == -1 ? perror("ft_read_4") : printf("ret -> %lu || \"%s\"\n", ret, buf);

	close(fd);
	putchar('\n');
}


static void test_strdup() {

	puts("---------- ft_strdup ----------");

	const char	*s1 = "Hello World!";
	char		*s2 = NULL;
	char		*s2_bis = NULL;

	s2 = strdup(s1);
	printf("strdup -> %1$p -> %1$s\n", s2);
	s2_bis = ft_strdup(s1);
	printf("ft_strdup -> %1$p -> %1$s\n", s2_bis);

	free(s2);
	free(s2_bis);
}


int main(void) {

	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();

	return 0;
}
