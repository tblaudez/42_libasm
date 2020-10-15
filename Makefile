# ************************************************************************** #
#                                                                            #
#                                                        ::::::::            #
#   Makefile                                           :+:    :+:            #
#                                                     +:+                    #
#   By: tblaudez <tblaudez@student.codam.nl>         +#+                     #
#                                                   +#+                      #
#   Created: 2020/09/17 14:41:30 by tblaudez      #+#    #+#                 #
#   Updated: 2020/10/15 14:22:00 by tblaudez      ########   odam.nl         #
#                                                                            #
# ************************************************************************** #

NAME=libasm.a

SRC= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s
HEADERS= libasm.h
OBJ= $(SRC:%.s=%.o)

CC= nasm # Hopefuly in $HOME/.brew/bin/nasm
CFLAGS= -fmacho64

all: $(NAME)

$(NAME): $(OBJ) $(HEADERS)
	ar rs $(NAME) $(OBJ)

%.o: %.s
	$(CC) $(CFLAGS) $<

clean:
	/bin/rm -f $(OBJ)

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re run
