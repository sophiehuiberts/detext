all:
	flex test.l
	gcc -lfl lex.yy.c

run:
	flex test.l
	gcc -lfl lex.yy.c
	./a.out
