# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bebosson <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/12 17:38:05 by bebosson          #+#    #+#              #
#    Updated: 2021/08/12 20:17:37 by bebosson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BLACK   =       \033[30m
RED             =       \033[31m
GREEN   =       \033[32m
YELLOW  =       \033[33m
BLUE    =       \033[34m
PURPLE  =       \033[35m
TUR             =       \033[36m
WHITE   =       \033[37m
END             =       \033[0m

UP              =       \033[A
CUT     =       \033[K

#	project

NAME	=	libft

#	directories
SRCPATH	=	srcs
INCDIR	=	./include
OBJDIR	=	./obj

SRC_CHAR =	ft_isalnum.c		ft_isascii.c	ft_islower.c	ft_isupper.c	\
		   	ft_toupper.c		ft_isalpha.c	ft_isdigit.c	ft_isprint.c	\
		   	ft_tolower.c
SRC_LST	=	ft_lstadd.c			ft_lstdel.c		ft_lstdelone.c	ft_lstiter.c	\
			ft_lstmap.c			ft_lstnew.c

SRC_MEM =	ft_bzero.c		ft_memccpy.c	ft_memcmp.c		ft_memdel.c		\
			ft_memset.c		ft_memalloc.c	ft_memchr.c		ft_memcpy.c   \
			ft_memmove.c
SRC_NB =	ft_atoi.c		ft_itoa.c	\

SRC_PUT	=	ft_putchar.c	ft_putendl.c	ft_putnbr.c		ft_putstr.c		\
			ft_putchar_fd.c		ft_putendl_fd.c		ft_putnbr_fd.c		\
			ft_putstr_fd.c
SRC_STR =	ft_str_is_alpha.c	ft_strcpy.c		ft_strlen.c		ft_strnstr.c
			ft_str_is_lowercase.c	ft_strdel.c		ft_strmap.c		ft_strrchr.c
			ft_str_is_numeric.c		ft_strdup.c	ft_strmapi.c	ft_strsplit.c
			ft_str_is_printable.c	ft_strequ.c	ft_strncat.c	ft_strstr.c
			ft_strcat.c		ft_striter.c 		ft_strncmp.c	ft_strsub.c
			ft_strchr.c		ft_striteri.c		ft_strncpy.c	ft_strtrim.c
			ft_strclr.c		ft_strjoin.c 		ft_strnequ.c
			ft_strcmp.c		ft_strlcat.c		ft_strnew.c


SRCS_NAME =	$(addprefix ft_char/,   $(SRCS_CHAR))	\
			$(addprefix ft_lst/,     $(SRCS_FD))		\
			$(addprefix ft_mem/,    $(SRCS_MEM))	\
			$(addprefix ft_nb/,     $(SRCS_NB))		\
			$(addprefix ft_str/,    $(SRCS_STR))	\
			$(addprefix ft_put/,   $(SRCS_PRTF))	

INC		=	libft.h

OBJ_NAME = $(SRCS_NAME:.c=.o)
OBJ_DIR	=	ft_char	ft_lst	ft_mem	ft_nb	ft_put		ft_str	\

OBJ		=	$(addprefix $(OBJDIR)/,$(SRC:.c=.o))
HEADER  =	$(addprefix $(INCDIR)/,$(INC))

#	compiler
CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror

all: obj $(NAME)

obj:
	@mkdir -p $(OBJDIR)

$(OBJDIR)/%.o:$(SRCDIR)/%.c $(HEADER)
						@echo "${TUR}compiling [$@] ...${END}"
						@$(CC) $(CFLAGS) -I $(INCDIR) -c -o $@ $<
						@printf "$(UP)$(CUT)"

$(NAME): 
						@$(CC) $(CFLAGS) $(OBJ) -o $@
						@echo "${GREEN}[$@ COMPILED]${END}"

clean:
						@/bin/rm -rf $(OBJDIR)
						@$(MAKE) -C $(FT) clean
						@echo "${PURPLE}[.o deleted]${END}"

fclean:         clean
						@/bin/rm -rf $(NAME)
						@$(MAKE) -C $(FT) fclean
						@echo "${RED}[$(NAME) deleted]${END}"
						@echo "${RED}[$(LIB) deleted]${END}"

re:				fclean all

.PHONY:			all clean fclean re
