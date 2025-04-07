%{
# include "y.tab.h"
%}
%%
[0-9]+		{yylval=atoi(yytext);return NUMBER;}
[+\-*/]		{return *yytext; }
[\t]+		; //Ignore Whitespace
[\n]		{return 0;}
.		{return yytext[0];}
%%
int yywrap() { return 1;}
