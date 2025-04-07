%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+		{ yylval = atoi(yytext); return NUMBER;}
[ \t]+		{ /* Ignore whitespace */}
\n		{ return EOL; }
.		{ return yytext[0];}

%%
