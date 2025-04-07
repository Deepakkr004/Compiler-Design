%{
//#include "y.tab.h" 
%}

D [0-9]
L [a-zA-Z]
B [\t]*
%%
-{D}+   {printf("Negative Integer");}
\+?{D}+ {printf("Positive Integer");}
-0.{D}+ {printf("Negative Fraction");}
G{L}*   {printf("May have a G word here");}
rail{B}road {printf("railroad is one world");}

%%
extern int yylex();
int yywrap()
{
return(1);
}
main()
{
while(yylex());
}


