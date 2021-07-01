# ************************************************************************** #
#                                                                            #
#                                                        ::::::::            #
#   Makefile                                           :+:    :+:            #
#                                                     +:+                    #
#   By: tblaudez <tblaudez@student.codam.nl>         +#+                     #
#                                                   +#+                      #
#   Created: 2020/09/17 14:41:30 by tblaudez      #+#    #+#                 #
#   Updated: 2020/10/19 11:30:32 by tblaudez      ########   odam.nl         #
#                                                                            #
# ************************************************************************** #

NAME := libasm.a

CC := nasm
CFLAGS ?= -fmacho64 -I include/

HEADERFILES := $(addprefix include/, libasm.h)

SRCFILES := $(addprefix src/, ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s \
	ft_write.s ft_atoi_base.s ft_list_push_front.s ft_list_remove_if.s ft_list_size.s ft_list_sort.s)

OBJFILES := $(SRCFILES:src/%.s=obj/%.o)

all: $(NAME)

$(NAME): $(OBJFILES)
	ar rs $@ $^

obj/%.o: src/%.s $(HEADERFILES)
	@mkdir -p obj/
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf obj/

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re