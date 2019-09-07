all:
	flex detext.l
	gcc -lfl lex.yy.c

run:
	flex detext.l
	gcc -lfl -odetext lex.yy.c
	./detext
