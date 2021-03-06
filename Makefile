# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfelty <jfelty@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 18:02:02 by jfelty            #+#    #+#              #
#    Updated: 2020/01/28 15:09:25 by jfelty           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_ls

CC = gcc

CFLAGS = -Wall -Wextra -Werror

LIBFT = sources/libft/libft.a

SRC =	sources/ft_ls.c				\
		sources/ft_ls_parse.c		\
		sources/ft_ls_tree.c		\
		sources/ft_ls_helper.c		\
		sources/ft_ls_print.c

all: $(NAME)

$(NAME): lib out clean

lib:
	@make -C sources/libft
	@make -C sources/libft clean
	@echo "libft complete"
#uses make command in library

out:
	@$(CC) $(CFLAGS) $(SRC) $(LIBFT) -o ft_ls
	@echo "ft_ls Generation Complete"

test:
	@$(CC) $(SRC) $(LIBFT) -g -o ft_ls
	@echo "Test Generation Complete"

clean:
	@rm -f $(OBJ)
	@make -C sources/libft/ clean

fclean: clean
	@rm -f ft_ls
	@make -C sources/libft/ fclean

re: fclean all

.PHONY: lib out clean all fclean re