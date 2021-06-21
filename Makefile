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

TARGET := libasm.a
CC := nasm
CFLAGS := -fmacho64 -g

SOURCES := src/ft_read.s src/ft_strcpy.s src/ft_strdup.s src/ft_strcmp.s \
	src/ft_write.s src/ft_strlen.s src/bonuses/ft_atoi_base.s src/bonuses/ft_list_push_front.s \
	src/bonuses/ft_list_size.s src/bonuses/ft_list_remove_if.s

HEADERS := include/libasm.h
OBJECTS := $(SOURCES:%.s=%.o)

default: $(TARGET)
all: default

$(TARGET): $(OBJECTS)
	@printf "✅ \e[96;1m%s\e[0m\n" $(TARGET)
	@ar rs $@ $(OBJECTS) 1>/dev/null 2>&1

%.o: %.s $(HEADERS)
	@printf "🔄 \e[34m%s: \e[32m%s\e[0m\n" $(TARGET) $@
	@$(CC) $(CFLAGS) -o $@ $<

clean:
	@printf "🗑  \e[31m%s\e[0m\n" $(OBJECTS)
	@rm -f $(OBJECTS)

fclean: clean
	@printf "🗑  \e[31;1m%s\e[0m\n" $(TARGET)
	@rm -f $(TARGET)

re: fclean all

.PHONY: all clean fclean re