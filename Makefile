# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: maruiz-p <maruiz-p@student.42.com>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/04 11:06:42 by maruiz-p          #+#    #+#              #
#    Updated: 2024/03/04 11:17:49 by maruiz-p         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap
CHECK = checker

SRCS = $(wildcard src/*.c)
CHECK_SRCS = $(wildcard utils/*.c)

OBJS = ${SRCS:.c=.o}
CHECK_OBJS = ${CHECK_SRCS:.c=.o}

CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iincludes

RM = rm -rf

all: ${NAME} ${CHECK}
${NAME}: ${OBJS}
		@${MAKE} -C ./libftproyectos
		@${CC} ${CFLAGS} ${OBJS} ./libftproyectos/libft.a - o ${CHECK}

clean:
		@${MAKE} -C ./libftproyectos fclean
		@${RM} ${OBJS}
		@${RM} ${CHECK_OBJS}

fclean: clean
		@${RM} ${NAME}
		@${RM} ${CHECK}

re: fclean all

.PHONY: all clean fclean re