%{
#include <stdio.h>
%}
id [_|a-z|A-Z][a-z|0-9|A-Z|_]*
num [0-9]+
binop [+|-|*|/]
unop [--|++]
%%
{id}=({id}|{num}){binop}({id}|{num}) {printf("Recognised Bin");}
{id}{binop}?=({id}|{num})({binop}({id}|{num}))? {printf("Recognised Bin Sp");}
{unop}{id} {printf("Recognised Pre Unop");}
{id}{unop} {printf("Recognised Post Unop");}
%%

void main()
{
	yyin = fopen("src.c","r");
	yylex();
	fclose(yyin);
}
