%{
#include<stdio.h>
int lc=1;
%}

intDT ("int")
floatDT ("float")
space (" ")
id [_|a-z|A-Z][a-z|0-9|A-Z|_]*
assign ("=")
sc (";")
num_pat [-+]?[0-9]+
float_pat [-+]?[0-9]+[.][0-9]+
err_pat1 [-+]?[0-9]+[a-z|A-Z]+
err_pat2 [-+]?[0-9]+[.][.][0-9]+
%%

"\n" {lc++;}

. {;}

{intDT}{space}{id}{space}?{assign}{space}?{err_pat1}{space}?{sc} {printf("\nInvalid Int Declaration (Alphanumeric value detected) \"%s\" in line %d\n",yytext,lc);}

{floatDT}{space}{id}{space}?{assign}{space}?{err_pat2}{space}?{sc} {printf("\nInvalid Float Declaration (Two decimal points detected) \"%s\" in line %d\n",yytext,lc);}

{intDT}{space}{id}{space}?{assign}{space}?{num_pat}{space}?{sc} {printf("\nValid Int Declaration \"%s\" in line %d\n",yytext,lc);}

{floatDT}{space}{id}{space}?{assign}{space}?{float_pat}{space}?{sc} {printf("\nValid Float Declaration \"%s\" in line %d\n",yytext,lc);}

{intDT}{space}{id}{space}?{assign}{space}?{float_pat}{space}?{sc} {printf("\nInvalid Int Declaration (Float cannot be int) \"%s\" in line %d\n",yytext,lc);}

{floatDT}{space}{id}{space}?{assign}{space}?{num_pat}{space}?{sc} {printf("\nInvalid Float Declaration (Int cannot be float) \"%s\" in line %d\n",yytext,lc);}

%%
void main()
{
yyin = fopen("p1.c","r");
yylex();
fclose(yyin);
}
