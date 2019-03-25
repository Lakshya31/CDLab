%{
#include <stdio.h>
%}
id [_|a-z|A-Z][a-z|0-9|A-Z|_]*
num [0-9]+
binop [+|-|*|/]
unop [--|++]
relop [==|!=|<|>|<=|>=]
%%
({id}|{num})({binop}({id}|{num}))?{relop}({id}|{num})({binop}({id}|{num}))? {printf("Recognised Rel");}
%%

void main()
{
	yyin = fopen("src.c","r");
	yylex();
	fclose(yyin);
}
