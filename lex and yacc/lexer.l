%{
#include  "y.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUMBER;}
[+\-*/] { return *yytext; }
[\t]+	; // ignore whitespace
[\n]	{return 0; }
. 	{return yytext[0]; }
%%

int yywrap() {return 1; }
