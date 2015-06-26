SRC=		philosophers.adb	\

NAME=		philo

ADABIND=	gnatbind

ADALINK=	gnatlink

CC=		gcc-4.8

OBJ=		$(SRC:.adb=.o)

all:		$(NAME)

$(NAME):
		gnatmake $(SRC)

clean:
		gnatclean $(SRC) -c

fclean:
		gnatclean $(SRC)

re:		fclean all
