# Makefile

FILES	= Lexer.c Parser.c Expression.c main.c
CC	= g++
CFLAGS	= -g -ansi

fregeit:	$(FILES)
			$(CC) $(CFLAGS) $(FILES) -o trans

Lexer.c:	Lexer.l
				flex Lexer.l

Parser.c:	Parser.y Lexer.c
				bison Parser.y

clean:
				rm -f *.o *~ Lexer.c Lexer.h Parser.c Parser.h trans
