

NAME = asm

SRCS = return_param.asm

OBJS = return_param.o

CC = nasm

LINK = ld 

CFLAGS = -f elf64

RM = rm -f

all: $(NAME)

$(NAME):
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Compiling:\033[0m" $(OBJS)
	@$(CC) $(CFLAGS) $(SRCS) -o $(OBJS)
	@$(LINK) $(OBJS) -o $(NAME)
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Creating:\033[0m" $(NAME)

clean:
	@$(RM) $(OBJS)
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Delete:\033[0m" $(OBJS)

fclean: clean
	@$(RM) $(NAME)
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Delete:\033[0m" $(NAME)

re: fclean all

.PHONY: all clean fclean re

.SILENT: $(OBJS)