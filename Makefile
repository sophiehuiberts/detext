all:
	flex vampire.l
	gcc -lfl lex.yy.c

run:
	flex vampire.l
	gcc -lfl lex.yy.c
	./a.out
