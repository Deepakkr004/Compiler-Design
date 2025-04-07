%{
#include <stdio.h>
%}

D   [0-9]          // Digits
G   [a-zA-Z]       // Alphabet characters
L   [ \t]*         // Whitespace (spaces or tabs)
B   [ \t]+         // One or more spaces/tabs for matching spaces between "rail" and "road"
%%

-{D}+        {printf("Negative Integer\n");}
\+?{D}+      {printf("Positive Integer\n");}
-0\.[0-9]+   {printf("Negative Fraction\n");}
{G}{L}*      {printf("May have a G word here\n");}
rail{B}road  {printf("railroad is one word\n");}

%%
extern int yylex();
int yywrap() {
    return 1;
}

void main() {
    while (yylex());
}

