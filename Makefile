##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile that compiles assembly
##

SRC =	$(wildcard src/*.asm)

OBJ = 	$(SRC:.asm=.o)

NAME = libasm.so

all:	$(NAME)

%.o: %.asm
	nasm -f elf64 -o $@ $<

$(NAME):	$(OBJ)
	gcc -nostdlib -shared -o $(NAME) $(OBJ) -fPIC

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

# with current Makefile I generate a libasm.so ELF library,
# but I may need a 'gcc -fPIC -shared -o libasm.so malloc.c'
# to clash with the malloc func selector